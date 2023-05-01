package com.monezhao.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.bean.sys.SysMenu;
import com.monezhao.bean.sys.SysOrg;
import com.monezhao.bean.sys.SysPostUser;
import com.monezhao.bean.sys.SysRole;
import com.monezhao.bean.sys.SysRoleUser;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.bean.sys.SysUserShortCut;
import com.monezhao.bean.utilsVo.ElTree;
import com.monezhao.bean.utilsVo.Meta;
import com.monezhao.bean.utilsVo.Route;
import com.monezhao.bean.utilsVo.SessionObject;
import com.monezhao.bean.utilsVo.ShortCut;
import com.monezhao.bean.utilsVo.SysPasswordForm;
import com.monezhao.bean.utilsVo.SysRolePermissionVO;
import com.monezhao.common.Constants;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.common.exception.SysException;
import com.monezhao.common.util.CommonUtil;
import com.monezhao.common.util.DateUtil;
import com.monezhao.common.util.PasswordUtil;
import com.monezhao.common.util.ShiroUtils;
import com.monezhao.controller.command.UserShortCut;
import com.monezhao.controller.command.VisitCount;
import com.monezhao.mapper.SysUserMapper;
import com.monezhao.service.SysConfigService;
import com.monezhao.service.SysMenuService;
import com.monezhao.service.SysPostUserService;
import com.monezhao.service.SysUserService;
import com.monezhao.service.SysUserShortCutService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 用户Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysUserServiceImpl extends BaseServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    @Autowired
    private SysRoleServiceImpl sysRoleService;

    @Autowired
    private SysRoleUserServiceImpl sysRoleUserService;

    @Autowired
    private SysOrgServiceImpl sysOrgService;

    @Autowired
    private SysUserShortCutService sysUserShortCutService;

    @Autowired
    private SysMenuService sysMenuService;

    @Autowired
    private SysPostUserService sysPostUserService;

    @Autowired
    private SysConfigService sysConfigService;

    @Override
    public IPage<SysUser> list(IPage<SysUser> page, SysUser sysUser) {
        List<SysUser> records = baseMapper.list(page, sysUser);
        if (page == null) {
            page = new Page<>();
            page.setTotal(records != null ? records.size() : 0L);
        }
        return page.setRecords(records);
    }

    /**
     * 公共选人查询
     *
     * @param page
     * @param sysUser
     * @return
     */
    @Override
    public IPage<SysUser> listSelectUser(IPage<SysUser> page, SysUser sysUser) {
        return page.setRecords(baseMapper.list(page, sysUser));
    }

    @Override
    public List<SysRole> getRoleByUserId(String userId) {
        return baseMapper.getRolesByUserId(userId);
    }

    /**
     * 获取用户信息 ，
     * <p>
     * 若用户变更角色，则roleId不能为空,并且将变更后的roleId更新到T_SYS_USER表中
     *
     * @param sysUser
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public SessionObject saveGetUserInfo(SysUser sysUser, String roleId) {
        SessionObject sessionObject = new SessionObject();
        sessionObject.setSysUser(sysUser);
        List<SysRole> sysRoles = this.getRoleByUserId(sysUser.getUserId());
        if (sysRoles == null || sysRoles.size() == 0) {
            if (!Constants.ADMIN.equals(sysUser.getUserId())) {
                throw new SysException("用户未配置角色权限，请联系管理员授权!");
            }
            SysRole sysRoleAdmin = sysRoleService.getById("admin");
            if (sysRoleAdmin == null) {
                throw new SysException("系统未配置admin角色，请联系管理员!");
            }
            sysRoles.add(sysRoleAdmin);
        }
        sessionObject.setSysRoles(sysRoles);
        // 默认以T_SYS_USER表中的角色登录
        if (CommonUtil.isEmptyStr(roleId)) {
            roleId = sysUser.getRoleId();
        }

        SysRole sysRoleUser = null;
        if (CommonUtil.isEmptyStr(roleId)) {
            roleId = sysRoles.get(0).getRoleId();
        } else {
            for (SysRole sysRole : sysRoles) {
                if (sysRole.getRoleId().equals(roleId)) {
                    sysRoleUser = sysRole;
                    break;
                }
            }
            if (sysRoleUser == null) {
                roleId = sysRoles.get(0).getRoleId();
                sysRoleUser = sysRoles.get(0);
            }
        }
        sessionObject.setSysRole(sysRoleUser);
        SysOrg baseOrg = sysOrgService.getById(sysUser.getOrgId());
        sessionObject.setSysOrg(baseOrg);

        sessionObject = loadFuncIdsAndPermissions(sysUser, roleId, sessionObject);
        List<Route> routes = this.loadRoutes(sysUser, roleId);
        sessionObject.setRoutes(routes);

        // 切换角色获取用户信息，需要更新用户表角色ID
        if (CommonUtil.isNotEmptyStr(roleId) && !roleId.equals(sysUser.getRoleId())) {
            sysUser.setRoleId(roleId);

            SysUser updateRoleIdUser = new SysUser();
            updateRoleIdUser.setUserId(sysUser.getUserId());
            updateRoleIdUser.setRoleId(roleId);
            this.updateById(updateRoleIdUser);
        }
        return sessionObject;
    }

    /**
     * @param sysUser
     * @param roleId
     * @return
     */
    @Override
    public SessionObject loadFuncIdsAndPermissions(SysUser sysUser, String roleId, SessionObject data) {
        String userId = sysUser.getUserId();
        List<SysRolePermissionVO> authList = null;
        if (Constants.ADMIN.equals(userId)) {
            authList = baseMapper.getAdminPermissions();
        } else {
            authList = baseMapper.getRolePermissions(roleId);
        }
        List<String> funcs = new ArrayList<>();
        Map<String, String> authPathMap = new HashMap<String, String>(16);
        for (SysRolePermissionVO sysAuthOperVO : authList) {
            if ("1".equals(sysAuthOperVO.getPermissionType())) {
                if (CommonUtil.isNotEmptyStr(sysAuthOperVO.getMenuUrl())) {
                    if (CommonUtil.isNotEmptyStr(sysAuthOperVO.getMenuPermissions())) {
                        // 以逗号分隔
                        String[] menuPermissions = sysAuthOperVO.getMenuPermissions().split(",");
                        for (String permission : menuPermissions) {
                            if (!authPathMap.containsKey(permission)) {
                                authPathMap.put(permission, permission);
                            }
                        }
                    }
                }
            } else if ("2".equals(sysAuthOperVO.getPermissionType())) {
                funcs.add(sysAuthOperVO.getMenuOrFuncId());
                if (CommonUtil.isNotEmptyStr(sysAuthOperVO.getFuncPermissions())) {
                    // 以逗号分隔
                    String[] funcPermissions = sysAuthOperVO.getFuncPermissions().split(",");
                    for (String permission : funcPermissions) {
                        if (!authPathMap.containsKey(permission)) {
                            authPathMap.put(permission, permission);
                        }
                    }
                }
            }
        }
        List<String> permissions = new ArrayList<>();
        authPathMap.forEach((k, v) -> {
            permissions.add(v);
        });
        if (data == null) {
            data = new SessionObject();
        }
        data.setFuncIds(funcs);
        data.setPermissions(permissions);
        return data;
    }

    @Override
    public List<Route> loadRoutes(SysUser sysUser, String roleId) {
        String userId = sysUser.getUserId();
        List<SysMenu> menuList = null;
        if (Constants.ADMIN.equals(userId)) {
            menuList = baseMapper.getRoleMenus("");
        } else {
            menuList = baseMapper.getRoleMenus(roleId);
        }
        Map<String, Route> routeMap = new LinkedHashMap<String, Route>();
        for (SysMenu menu : menuList) {
            if (!"1".equals(menu.getIsRoute())) {
                continue;
            }
            Route route = new Route();
            route.setRouteId(menu.getMenuId());
            route.setPath(menu.getMenuUrl());
            route.setComponent(menu.getComponent());
            route.setHidden("1".equals(menu.getHidden()));
            route.setRedirect(menu.getRedirect());
            if (CommonUtil.isNotEmptyStr(menu.getRouteName())) {
                route.setName(menu.getRouteName());
            } else {
                route.setName(urlToRouteName(menu.getMenuUrl()));
            }

            Meta meta = new Meta();
            meta.setTitle(menu.getMenuName());
            meta.setIcon(menu.getMenuIcon());
            meta.setIsCache("1".equals(menu.getIsCache()));
            meta.setAffix("1".equals(menu.getAffix()));
            route.setMeta(meta);

            routeMap.put(route.getRouteId(), route);
            if (CommonUtil.isNotEmptyStr(menu.getParentMenuId()) && routeMap.containsKey(menu.getParentMenuId())) {
                route.setRouteParentId(menu.getParentMenuId());
                Route parentRoute = routeMap.get(menu.getParentMenuId());
                parentRoute.addChildren(route);
            }
        }

        List<Route> result = new ArrayList<Route>();
        routeMap.forEach((k, v) -> {
            if (CommonUtil.isEmptyStr(v.getRouteParentId())) {
                result.add(v);
            }
        });

        return result;
    }

    /**
     * 通过URL生成路由name（去掉URL前缀斜杠，替换内容中的斜杠‘/’为-）
     * <p>
     * 举例： URL = /sys/config RouteName = sysConfig
     *
     * @return
     */
    private String urlToRouteName(String url) {
        if (CommonUtil.isNotEmptyStr(url)) {
            if (url.startsWith(Constants.FORWARD_SLASH)) {
                url = url.substring(1);
            }
            url = url.replace(Constants.FORWARD_SLASH, Constants.CROSSBAR);
            return url;
        } else {
            return null;
        }
    }

    /**
     * 新增用户
     *
     * @param sysUser
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean saveSysUser(SysUser sysUser) {
        String salt = PasswordUtil.randomGen(8);
        // 默认密码
        String defaultPassword = sysConfigService.getSysConfig("defaultPassword");
        String password = PasswordUtil.encrypt(PasswordUtil.md5Encode(defaultPassword), salt);
        sysUser.setSalt(salt);
        sysUser.setPassword(password);
        SysRoleUser sysRoleUser = new SysRoleUser(sysUser.getRoleId(), sysUser.getUserId());
        sysRoleUserService.saveOrUpdate(sysRoleUser);
        return this.save(sysUser);
    }

    /**
     * 批量新增用户
     *
     * @param sysUsers
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveBatchSysUser(List<SysUser> sysUsers) {
        List<SysRoleUser> roleUsers = new ArrayList<>(sysUsers.size());
        for (SysUser sysUser : sysUsers) {
            String salt = PasswordUtil.randomGen(8);
            // 默认密码
            String defaultPassword = sysConfigService.getSysConfig("defaultPassword");
            String password = PasswordUtil.encrypt(PasswordUtil.md5Encode(defaultPassword), salt);
            sysUser.setSalt(salt);
            sysUser.setPassword(password);
            SysRoleUser sysRoleUser = new SysRoleUser(sysUser.getRoleId(), sysUser.getUserId());
            roleUsers.add(sysRoleUser);
        }

        sysRoleUserService.saveBatch(roleUsers);
        this.saveBatch(sysUsers);
    }

    /**
     * 修改用户
     *
     * @param sysUser
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateSysUser(SysUser sysUser) {
        if (sysUser.getRoleId() != null) {
            SysUser sysUserDb = this.getById(sysUser.getUserId());
            if (!Objects.equals(sysUserDb.getRoleId(), sysUser.getRoleId())) {
                SysRoleUser sysRoleUserDb = new SysRoleUser(sysUserDb.getRoleId(), sysUserDb.getUserId());
                sysRoleUserService.removeById(sysRoleUserDb.getRoleUserId());

                SysRoleUser sysRoleUser = new SysRoleUser(sysUser.getRoleId(), sysUser.getUserId());
                sysRoleUserService.saveOrUpdate(sysRoleUser);
            }
        }
        // 密码设置为空，防止密码被恶意修改
        sysUser.setPassword(null);
        // 密码盐设置为空，防止密码被恶意修改
        sysUser.setSalt(null);
        return this.updateById(sysUser);
    }

    /**
     * 删除用户
     *
     * @param ids
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(String ids) {
        if (ids == null || ids.trim().length() == 0) {
            throw new SysException("ids can't be empty");
        }
        String[] idsArr = ids.split(",");
        for (int i = 0; i < idsArr.length; i++) {
            if (Constants.ADMIN.equals(idsArr[i])) {
                throw new SysException("不允许删除[admin]用户");
            }
        }
        if (idsArr.length > 1) {
            removeByIds(Arrays.asList(idsArr));
        } else {
            removeById(idsArr[0]);
        }
        sysRoleUserService.remove(new QueryWrapper<SysRoleUser>().in("user_id", idsArr));
        sysPostUserService.remove(new QueryWrapper<SysPostUser>().in("user_id", idsArr));
        sysUserShortCutService.remove(new QueryWrapper<SysUserShortCut>().in("user_id", idsArr));
    }

    /**
     * 修改密码
     *
     * @param sysPasswordForm
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updatePassword(SysPasswordForm sysPasswordForm) {
        String userId = ShiroUtils.getUserId();
        SysUser sysUser = this.getById(userId);
        if (sysUser == null) {
            throw new SysException("用户不存在");
        }
        String oldPassword = PasswordUtil.encrypt(sysPasswordForm.getPassword(), sysUser.getSalt());
        String salt = PasswordUtil.randomGen(8);
        String newPassword = PasswordUtil.encrypt(sysPasswordForm.getNewPassword(), salt);
        sysUser.setPassword(newPassword);
        sysUser.setSalt(salt);
        return this.update(sysUser, new QueryWrapper<SysUser>().lambda()
                .eq(SysUser::getUserId, userId).eq(SysUser::getPassword, oldPassword));
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void resetPassword(String userId) {
        SysUser sysUser = this.getById(userId);
        if (sysUser == null) {
            throw new SysException("用户不存在");
        }
        String salt = PasswordUtil.randomGen(8);
        // 默认密码
        String defaultPassword = sysConfigService.getSysConfig("defaultPassword");
        String password = PasswordUtil.encrypt(PasswordUtil.md5Encode(defaultPassword), salt);
        sysUser.setSalt(salt);
        sysUser.setPassword(password);
        this.updateById(sysUser);
    }

    @Override
    public long findTotalVisitCount() {
        return baseMapper.findTotalVisitCount();
    }

    @Override
    public List<String> findLastSevenVisitIp() {
        return baseMapper.findLastSevenVisitIp(DateUtil.dateToStr(new Date()));
    }

    @Override
    public long findTodayVisitCount() {
        return baseMapper.findTodayVisitCount(DateUtil.dateToStr(new Date()));
    }

    @Override
    public long findTodayIp() {
        return baseMapper.findTodayIp(DateUtil.dateToStr(new Date()));
    }

    @Override
    public List<VisitCount> findLastSevenDaysVisitCount(String username) {
        return baseMapper.findLastSevenDaysVisitCount(username, DateUtil.dateToStr(new Date()));
    }

    @Override
    public Map<String, Object> getAuthMenuList(String roleId, String userId) {
        List<SysMenu> list = baseMapper.listMenuByRoleId(roleId);
        Map<String, ElTree> menuMap = new LinkedHashMap<>();
        for (SysMenu sysMenu : list) {
            if (sysMenu == null) {
                continue;
            }
            ElTree elTree = new ElTree();
            elTree.setId(sysMenu.getMenuId());
            elTree.setLabel(sysMenu.getMenuName());
            elTree.setIsLeaf("1".equals(sysMenu.getIsLeaf()));
            elTree.setData(sysMenu);
            menuMap.put(sysMenu.getMenuId(), elTree);
            if (CommonUtil.isNotEmptyStr(sysMenu.getParentMenuId()) && menuMap.containsKey(sysMenu.getParentMenuId())) {
                elTree.setParentId(sysMenu.getParentMenuId());
                ElTree parentElTree = menuMap.get(sysMenu.getParentMenuId());
                parentElTree.addChildren(elTree);
            }
        }

        List<ElTree> permissionTree = new ArrayList<>();
        menuMap.forEach((k, v) -> {
            if (CommonUtil.isEmptyStr(v.getParentId())) {
                permissionTree.add(v);
            }
        });

        List<String> permissions = baseMapper.listPermissionsByUserId(userId, roleId);
        Map<String, Object> result = new HashMap<>(2);
        result.put("permissionTree", permissionTree);
        result.put("permissions", permissions);
        return result;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean userShortCutSave(UserShortCut userShortCut) {
        String userId = userShortCut.getUserId();
        String roleId = userShortCut.getRoleId();
        for (String menuId : userShortCut.getAdd()) {
            SysUserShortCut shortCut = new SysUserShortCut();
            shortCut.setUserId(userId);
            shortCut.setRoleId(roleId);
            shortCut.setMenuId(menuId);
            sysUserShortCutService.save(shortCut);
        }
        List<String> delIds = userShortCut.getDel();
        if (Objects.nonNull(delIds) && !delIds.isEmpty()) {
            QueryWrapper<SysUserShortCut> queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda()
                    .eq(SysUserShortCut::getUserId, userId)
                    .eq(SysUserShortCut::getRoleId, roleId)
                    .in(SysUserShortCut::getMenuId, delIds);
            sysUserShortCutService.remove(queryWrapper);
        }
        return true;
    }

    @Override
    public List<ShortCut> getMenuShortCut(String userId, String roleId) {
        List<String> menuIds = baseMapper.listPermissionsByUserId(userId, roleId);
        return baseMapper.listMenuByRoleId(roleId).parallelStream()
                .filter(Objects::nonNull)
                .filter(e -> menuIds.contains(e.getMenuId()))
                .map(menu -> {
                    ShortCut shortCut = new ShortCut();
                    shortCut.setName(menu.getMenuName());
                    shortCut.setIcon(menu.getMenuIcon());
                    List<String> urls = new ArrayList<>();
                    urls.add(pathFormat(menu));
                    while (!StringUtils.isEmpty(menu.getParentMenuId()) && !menu.getMenuUrl().startsWith(Constants.FORWARD_SLASH)) {
                        menu = sysMenuService.getById(menu.getParentMenuId());
                        urls.add(pathFormat(menu));
                    }
                    Collections.reverse(urls);
                    shortCut.setPath(Constants.FORWARD_SLASH + String.join(Constants.FORWARD_SLASH, urls));
                    return shortCut;
                })
                .collect(Collectors.toList());
    }

    @Override
    public IPage<SysUser> queryUserByOrg(IPage<SysUser> page, SysUser sysUser) {
        List<SysOrg> baseOrgs = sysOrgService.list();
        List<String> orgList = new ArrayList<>();
        for (SysOrg sysOrg : baseOrgs) {
            boolean contains = Arrays.asList(sysOrg.getOrgLevelCode().split(",")).contains(sysUser.getOrgId());
            if (contains) {
                orgList.add(sysOrg.getOrgId());
            }
        }
        sysUser.setOrgList(orgList);
        List<SysUser> records = baseMapper.queryUserByOrgList(page, sysUser);
        if (page == null) {
            page = new Page<>();
            page.setTotal(records != null ? records.size() : 0L);
        }
        return page.setRecords(records);
    }

    private String pathFormat(SysMenu menu) {
        String url = menu.getMenuUrl();
        return url.replaceAll(Constants.FORWARD_SLASH, "");
    }
}

package vip.xiaonuo.sys.modular.role.provider;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vip.xiaonuo.sys.api.SysRoleApi;
import vip.xiaonuo.sys.core.enums.SysBuildInEnum;
import vip.xiaonuo.sys.modular.relation.entity.SysRelation;
import vip.xiaonuo.sys.modular.relation.enums.SysRelationCategoryEnum;
import vip.xiaonuo.sys.modular.relation.service.SysRelationService;
import vip.xiaonuo.sys.modular.resource.entity.SysButton;
import vip.xiaonuo.sys.modular.resource.entity.SysMenu;
import vip.xiaonuo.sys.modular.resource.enums.SysResourceCategoryEnum;
import vip.xiaonuo.sys.modular.resource.service.SysButtonService;
import vip.xiaonuo.sys.modular.resource.service.SysMenuService;
import vip.xiaonuo.sys.modular.role.entity.SysRole;
import vip.xiaonuo.sys.modular.role.enums.SysRoleCategoryEnum;
import vip.xiaonuo.sys.modular.role.enums.SysRoleDataScopeCategoryEnum;
import vip.xiaonuo.sys.modular.role.param.SysRoleGrantPermissionParam;
import vip.xiaonuo.sys.modular.role.param.SysRoleGrantResourceParam;
import vip.xiaonuo.sys.modular.role.param.SysRoleSelectorRoleParam;
import vip.xiaonuo.sys.modular.role.service.SysRoleService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 角色API接口提供者
 *
 * @author xuyuxiang
 * @date 2022/7/22 14:57
 **/
@Service
public class SysRoleApiProvider implements SysRoleApi {

    @Resource
    private SysRoleService sysRoleService;

    @Resource
    private SysMenuService sysMenuService;

    @Resource
    private SysButtonService sysButtonService;

    @Resource
    private SysRelationService sysRelationService;

    @Override
    public boolean orgHasRole(List<String> orgIdList) {
        return sysRoleService.count(new LambdaQueryWrapper<SysRole>().in(SysRole::getOrgId, orgIdList)) > 0;
    }

    @SuppressWarnings("ALL")
    @Override
    public Page<JSONObject> roleSelector(String orgId, String category, String searchKey, List<String> dataScopeList) {
        SysRoleSelectorRoleParam sysRoleSelectorRoleParam = new SysRoleSelectorRoleParam();
        sysRoleSelectorRoleParam.setOrgId(orgId);
        sysRoleSelectorRoleParam.setCategory(category);
        sysRoleSelectorRoleParam.setSearchKey(searchKey);
        sysRoleSelectorRoleParam.setDataScopeList(dataScopeList);
        return BeanUtil.toBean(sysRoleService.roleSelector(sysRoleSelectorRoleParam), Page.class);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void grantForGenMenuAndButton(String menuId) {
        String superAdminRoleId = sysRoleService.getOne(new LambdaQueryWrapper<SysRole>().eq(SysRole::getCode, SysBuildInEnum.BUILD_IN_ROLE_CODE.getValue())
                .eq(SysRole::getCategory, SysRoleCategoryEnum.GLOBAL.getValue())).getId();
        SysRoleGrantResourceParam sysRoleGrantResourceParam = new SysRoleGrantResourceParam();
        sysRoleGrantResourceParam.setId(superAdminRoleId);
        SysMenu sysMenu = sysMenuService.queryEntity(menuId);
        SysRoleGrantResourceParam.SysRoleGrantResource sysRoleGrantResource = new SysRoleGrantResourceParam.SysRoleGrantResource();
        sysRoleGrantResource.setMenuId(sysMenu.getId());
        List<String> buttonIdList = sysButtonService.list(new LambdaQueryWrapper<SysButton>().eq(SysButton::getParentId,
                sysMenu.getId()).eq(SysButton::getCategory, SysResourceCategoryEnum.BUTTON.getValue())).stream()
                .map(SysButton::getId).collect(Collectors.toList());
        sysRoleGrantResource.setButtonInfo(buttonIdList);
        sysRoleGrantResourceParam.setGrantInfoList(CollectionUtil.newArrayList(sysRoleGrantResource));

        List<String> menuIdList = sysRoleGrantResourceParam.getGrantInfoList().stream()
                .map(SysRoleGrantResourceParam.SysRoleGrantResource::getMenuId).collect(Collectors.toList());
        List<String> extJsonList = sysRoleGrantResourceParam.getGrantInfoList().stream()
                .map(JSONUtil::toJsonStr).collect(Collectors.toList());

        List<String> existMenuIdList = sysMenuService.list(new LambdaQueryWrapper<SysMenu>().eq(SysMenu::getCategory,
                SysResourceCategoryEnum.MENU.getValue())).stream().map(SysMenu::getId).collect(Collectors.toList());
        if(ObjectUtil.isNotEmpty(existMenuIdList)) {
            sysRelationService.remove(new LambdaQueryWrapper<SysRelation>().eq(SysRelation::getObjectId, superAdminRoleId)
                    .eq(SysRelation::getCategory, SysRelationCategoryEnum.SYS_ROLE_HAS_RESOURCE.getValue()).notIn(SysRelation::getTargetId, existMenuIdList));
        }
        sysRelationService.saveRelationBatchWithAppend(superAdminRoleId, menuIdList, SysRelationCategoryEnum.SYS_ROLE_HAS_RESOURCE.getValue(), extJsonList);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void grantForGenPermission(String prefix) {
        List<String> targetIdList = Arrays.asList(prefix + "page", prefix + "add", prefix + "edit", prefix + "delete", prefix + "detail");
        List<String> extJsonList = new ArrayList<>(targetIdList.size());
        for (String targetId : targetIdList) {
            SysRoleGrantPermissionParam.SysRoleGrantPermission permission = new SysRoleGrantPermissionParam.SysRoleGrantPermission();
            permission.setApiUrl(targetId);
            permission.setScopeCategory(SysRoleDataScopeCategoryEnum.SCOPE_ALL.getValue());
            permission.setScopeDefineOrgIdList(new ArrayList<>());
            extJsonList.add(JSONUtil.toJsonStr(permission));
        }
        String superAdminRoleId = sysRoleService.getOne(new LambdaQueryWrapper<SysRole>().eq(SysRole::getCode, SysBuildInEnum.BUILD_IN_ROLE_CODE.getValue())
                .eq(SysRole::getCategory, SysRoleCategoryEnum.GLOBAL.getValue())).getId();
        sysRelationService.saveRelationBatchWithAppend(superAdminRoleId, targetIdList, SysRelationCategoryEnum.SYS_ROLE_HAS_PERMISSION.getValue(), extJsonList);
    }
}

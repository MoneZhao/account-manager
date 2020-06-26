package com.monezhao.common.permission.provider;

import com.monezhao.bean.sys.SysOrg;
import com.monezhao.bean.utilsVo.SessionObject;
import com.monezhao.common.permission.FilterGroup;
import com.monezhao.common.permission.FilterOperate;
import com.monezhao.common.permission.FilterRule;
import com.monezhao.common.util.CommonUtil;
import lombok.Getter;
import lombok.Setter;


/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:57
 * @Description: 机构权限
 */
@Getter
@Setter
public class OrgDataPermissionProvider extends AbstractDataPermissionProvider {
    public static final String TYPE_1 = "1";
    public static final String TYPE_2 = "2";
    public static final String TYPE_3 = "3";
    /**
     * 别名
     */
    private String alias;

    /**
     * 1-机构权限，查询自己及下辖机构的数据
     * <p>
     * 2-只查询当前机构
     * <p>
     * 3-只查询下辖机构不包括自己
     * <p>
     * others-如有需要可添加用户分管机构表等其他场景
     */
    private String type;

    @Override
    public FilterGroup filter(SessionObject sessionObject) {
        // 别名，默认 o
        String alias = CommonUtil.isEmptyDefault(this.alias, "o");
        // 机构数据权限类型，默认1
        String type = CommonUtil.isEmptyDefault(this.type, "1");
        SysOrg baseOrg = sessionObject.getSysOrg();
        FilterGroup result = null;
        // 机构权限，查询自己及下辖机构的数据
        if (TYPE_1.equals(type)) {
            FilterRule rule = new FilterRule(alias, "ORG_LEVEL_CODE", FilterOperate.LIKE.getValue(),
                    CommonUtil.addLikeRight(baseOrg.getOrgLevelCode()));
            result = new FilterGroup(rule);
        }
        // 只查询当前机构
        else if (TYPE_2.equals(type)) {
            FilterRule rule = new FilterRule(alias, "ORG_ID", FilterOperate.EQ.getValue(), baseOrg.getOrgId());
            result = new FilterGroup(rule);
        }
        // 查询下辖机构不包括自己
        else if (TYPE_3.equals(type)) {
            FilterRule rule = new FilterRule(alias, "ORG_LEVEL_CODE", FilterOperate.LIKE.getValue(),
                    CommonUtil.addLikeRight(baseOrg.getOrgLevelCode()));
            FilterRule rule2 = new FilterRule(alias, "ORG_ID", FilterOperate.NE.getValue(), baseOrg.getOrgId());
            result = new FilterGroup(rule);
            result.andRule(rule2);
        }
        return result;
    }
}

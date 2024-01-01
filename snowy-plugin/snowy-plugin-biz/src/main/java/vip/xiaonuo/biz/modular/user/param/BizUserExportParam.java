package vip.xiaonuo.biz.modular.user.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 人员导出参数
 *
 * @author xuyuxiang
 * @date 2022/7/26 16:00
 **/
@Getter
@Setter
public class BizUserExportParam {

    /** 人员状态 */
    @ApiModelProperty(value = "人员状态")
    private String userStatus;

    /** 账号、姓名、手机号关键词 */
    @ApiModelProperty(value = "账号、姓名、手机号关键词")
    private String searchKey;

    /** 人员id集合 */
    @ApiModelProperty(value = "人员id集合")
    private String userIds;
}

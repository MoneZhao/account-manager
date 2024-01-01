package vip.xiaonuo.biz.modular.balancecount.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

/**
 * 计入总资产编辑参数
 *
 * @author monezhao
 * @date  2023/12/23 21:12
 **/
@Getter
@Setter
public class BizBalanceCountEditParam {

    /** 主键ID */
    @ApiModelProperty(value = "主键ID", required = true, position = 1)
//    @NotBlank(message = "id不能为空")
    private String id;

    /** 账户类型ID */
    @ApiModelProperty(value = "账户类型ID", required = true, position = 2)
    @NotBlank(message = "codeInfoId不能为空")
    private String codeInfoId;

    /** 是否计入总资产 */
    @ApiModelProperty(value = "是否计入总资产", required = true, position = 3)
    @NotBlank(message = "countType不能为空")
    private String countType;

}

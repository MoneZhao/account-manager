package vip.xiaonuo.biz.modular.balancedetail.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

/**
 * 账户明细添加参数
 *
 * @author monezhao
 * @date  2023/12/25 16:57
 **/
@Getter
@Setter
public class BizBalanceDetailAddParam {

    /** 主表ID */
    @ApiModelProperty(value = "主表ID", required = true, position = 1)
    @NotNull(message = "balanceMainId不能为空")
    private String balanceMainId;

    /** 账户余额 */
    @ApiModelProperty(value = "账户余额", required = true, position = 2)
    @NotNull(message = "account不能为空")
    private BigDecimal account;

    /** 账户类型 */
    @ApiModelProperty(value = "账户类型", required = true, position = 3)
    @NotBlank(message = "balanceType不能为空")
    private String balanceType;

    /** 备注 */
    @ApiModelProperty(value = "备注", position = 6)
    private String remark;

}

package vip.xiaonuo.biz.modular.balancemain.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

/**
 * 账户余额Id参数
 *
 * @author monezhao
 * @date  2023/12/25 16:56
 **/
@Getter
@Setter
public class BizBalanceMainIdParam {

    /** 主键ID */
    @ApiModelProperty(value = "主键ID", required = true)
    @NotBlank(message = "id不能为空")
    private String id;
}

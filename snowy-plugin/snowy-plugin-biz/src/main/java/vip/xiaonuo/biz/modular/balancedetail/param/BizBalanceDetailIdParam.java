package vip.xiaonuo.biz.modular.balancedetail.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

/**
 * 账户明细Id参数
 *
 * @author monezhao
 * @date  2023/12/25 16:57
 **/
@Getter
@Setter
public class BizBalanceDetailIdParam {

    /** 主键ID */
    @ApiModelProperty(value = "主键ID", required = true)
    @NotBlank(message = "id不能为空")
    private String id;
}

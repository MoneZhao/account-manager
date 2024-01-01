package vip.xiaonuo.biz.modular.balancecount.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

/**
 * 计入总资产Id参数
 *
 * @author monezhao
 * @date  2023/12/23 21:12
 **/
@Getter
@Setter
public class BizBalanceCountIdParam {

    /** 主键ID */
    @ApiModelProperty(value = "主键ID", required = true)
    @NotBlank(message = "id不能为空")
    private String id;
}

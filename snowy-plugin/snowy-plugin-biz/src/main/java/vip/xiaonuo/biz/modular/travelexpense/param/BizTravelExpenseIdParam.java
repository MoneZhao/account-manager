package vip.xiaonuo.biz.modular.travelexpense.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

/**
 * 出差报销Id参数
 *
 * @author monezhao
 * @date  2023/12/23 19:25
 **/
@Getter
@Setter
public class BizTravelExpenseIdParam {

    /** 主键id */
    @ApiModelProperty(value = "主键id", required = true)
    @NotBlank(message = "id不能为空")
    private String id;
}

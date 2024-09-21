package vip.xiaonuo.biz.modular.balanceredpacket.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

/**
 * 红包记账Id参数
 *
 * @author monezhao
 * @date  2024/06/21 16:24
 **/
@Getter
@Setter
public class BizBalanceRedPacketIdParam {

    /** 主键ID */
    @ApiModelProperty(value = "主键ID", required = true)
    @NotBlank(message = "id不能为空")
    private String id;
}

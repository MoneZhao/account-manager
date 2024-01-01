package vip.xiaonuo.dev.modular.sms.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

/**
 * 短信Id参数
 *
 * @author xuyuxiang
 * @date 2022/7/31 15:25
 */
@Getter
@Setter
public class DevSmsIdParam {

    /** id */
    @ApiModelProperty(value = "id", required = true)
    @NotBlank(message = "id不能为空")
    private String id;
}

package vip.xiaonuo.sys.modular.index.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

/**
 * 日程列表查询参数
 *
 * @author xuyuxiang
 * @date 2022/9/2 11:06
 */
@Getter
@Setter
public class SysIndexScheduleListParam {

    /** 日程日期 */
    @ApiModelProperty(value = "日程日期", required = true)
    @NotBlank(message = "scheduleDate不能为空")
    private String scheduleDate;
}

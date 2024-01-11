package vip.xiaonuo.biz.modular.balancedetail.param;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * 账户明细添加参数
 *
 * @author monezhao
 * @date  2023/12/25 16:57
 **/
@Getter
@Setter
public class BizBalanceDetailCompareParam {

    /** 记录时间 */
    @ApiModelProperty(value = "记录时间", required = true, position = 3)
    @NotNull(message = "accountDate不能为空")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date accountDate;

    /** 账户类型 */
    @ApiModelProperty(value = "账户类型", required = true, position = 3)
    @NotBlank(message = "balanceType不能为空")
    private String balanceType;

}

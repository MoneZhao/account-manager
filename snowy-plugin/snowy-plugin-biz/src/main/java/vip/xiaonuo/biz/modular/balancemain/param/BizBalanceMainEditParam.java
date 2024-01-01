package vip.xiaonuo.biz.modular.balancemain.param;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * 账户余额编辑参数
 *
 * @author monezhao
 * @date  2023/12/25 16:56
 **/
@Getter
@Setter
public class BizBalanceMainEditParam {

    /** 主键ID */
    @ApiModelProperty(value = "主键ID", required = true, position = 1)
    @NotBlank(message = "id不能为空")
    private String id;

//    /** 账户余额 */
//    @ApiModelProperty(value = "账户余额", required = true, position = 2)
//    @NotNull(message = "account不能为空")
//    private BigDecimal account;

    /** 记录时间 */
    @ApiModelProperty(value = "记录时间", required = true, position = 3)
    @NotNull(message = "accountDate不能为空")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date accountDate;

    /** 备注 */
    @ApiModelProperty(value = "备注", position = 5)
    private String remark;

}

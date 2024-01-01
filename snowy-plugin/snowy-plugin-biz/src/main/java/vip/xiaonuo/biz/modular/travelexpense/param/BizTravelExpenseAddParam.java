package vip.xiaonuo.biz.modular.travelexpense.param;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 出差报销添加参数
 *
 * @author monezhao
 * @date  2023/12/23 19:25
 **/
@Getter
@Setter
public class BizTravelExpenseAddParam {

    /** 出差地点 */
    @ApiModelProperty(value = "出差地点", required = true, position = 2)
    @NotBlank(message = "travelPlace不能为空")
    private String travelPlace;

    /** 报销日期 */
    @ApiModelProperty(value = "报销日期", required = true, position = 3)
    @NotNull(message = "requestDate不能为空")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date requestDate;

    /** 到账日期 */
    @ApiModelProperty(value = "到账日期", position = 4)
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date getDate;

    /** 实际花费 */
    @ApiModelProperty(value = "实际花费", required = true, position = 6)
    @NotNull(message = "useNumber不能为空")
    private BigDecimal useNumber;

    /** 报销金额 */
    @ApiModelProperty(value = "报销金额", required = true, position = 7)
    @NotNull(message = "requestNumber不能为空")
    private BigDecimal requestNumber;

    /** 到账金额 */
    @ApiModelProperty(value = "到账金额", position = 8)
    private BigDecimal getNumber;

    /** 备注 */
    @ApiModelProperty(value = "备注", position = 10)
    private String remark;

}

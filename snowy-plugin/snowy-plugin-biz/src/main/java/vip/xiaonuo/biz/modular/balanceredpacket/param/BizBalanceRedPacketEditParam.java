package vip.xiaonuo.biz.modular.balanceredpacket.param;

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
 * 红包记账编辑参数
 *
 * @author monezhao
 * @date  2024/06/21 16:24
 **/
@Getter
@Setter
public class BizBalanceRedPacketEditParam {

    /** 主键ID */
    @ApiModelProperty(value = "主键ID", required = true, position = 1)
    @NotBlank(message = "id不能为空")
    private String id;

    /** 时间 */
    @ApiModelProperty(value = "时间", required = true, position = 2)
    @NotNull(message = "accountDate不能为空")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date accountDate;

    /** 事由 */
    @ApiModelProperty(value = "事由", required = true, position = 3)
    @NotBlank(message = "reason不能为空")
    private String reason;

    /** 是否发红包 */
    @ApiModelProperty(value = "是否发红包", required = true, position = 4)
    @NotBlank(message = "giveType不能为空")
    private String giveType;

    /** 对方名 */
    @ApiModelProperty(value = "对方名", required = true, position = 5)
    @NotBlank(message = "person不能为空")
    private String person;

    /** 金额 */
    @ApiModelProperty(value = "金额", required = true, position = 6)
    @NotNull(message = "account不能为空")
    private BigDecimal account;

    /** 备注 */
    @ApiModelProperty(value = "备注", position = 9)
    private String remark;

}

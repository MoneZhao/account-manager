package vip.xiaonuo.biz.modular.balancemain.param;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import vip.xiaonuo.biz.modular.balancedetail.entity.BizBalanceDetail;

import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

/**
 * 账户余额添加参数
 *
 * @author monezhao
 * @date  2023/12/25 16:56
 **/
@Getter
@Setter
public class BizBalanceMainAddParam {

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

    @TableField(exist = false)
    @ApiModelProperty(value = "账户明细", position = 5)
    private List<BizBalanceDetail> details;

}

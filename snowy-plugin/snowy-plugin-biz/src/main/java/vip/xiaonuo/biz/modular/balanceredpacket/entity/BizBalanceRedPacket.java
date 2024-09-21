package vip.xiaonuo.biz.modular.balanceredpacket.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import vip.xiaonuo.common.pojo.CommonEntity;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 红包记账实体
 *
 * @author monezhao
 * @date  2024/06/21 16:24
 **/
@Getter
@Setter
@TableName("biz_balance_red_packet")
public class BizBalanceRedPacket extends CommonEntity {

    /** 主键ID */
    @TableId
    @ApiModelProperty(value = "主键ID", position = 1)
    private String id;

    /** 时间 */
    @ApiModelProperty(value = "时间", position = 2)
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date accountDate;

    /** 事由 */
    @ApiModelProperty(value = "事由", position = 3)
    private String reason;

    /** 是否发红包 */
    @ApiModelProperty(value = "是否发红包", position = 4)
    private String giveType;

    /** 对方名 */
    @ApiModelProperty(value = "对方名", position = 5)
    private String person;

    /** 金额 */
    @ApiModelProperty(value = "金额", position = 6)
    private BigDecimal account;

    /** 关联发红包ID */
    @ApiModelProperty(value = "关联发红包ID", position = 7)
    private String relativeId;

    /** 所属用户ID */
    @ApiModelProperty(value = "所属用户ID", position = 8)
    private String userId;

    /** 备注 */
    @ApiModelProperty(value = "备注", position = 9)
    private String remark;
}

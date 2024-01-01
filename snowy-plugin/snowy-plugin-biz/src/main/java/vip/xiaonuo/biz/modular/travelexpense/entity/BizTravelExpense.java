package vip.xiaonuo.biz.modular.travelexpense.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import vip.xiaonuo.common.pojo.CommonEntity;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 出差报销实体
 *
 * @author monezhao
 * @date  2023/12/23 19:25
 **/
@Getter
@Setter
@TableName("biz_travel_expense")
public class BizTravelExpense extends CommonEntity {

    /** 主键id */
    @TableId
    @ApiModelProperty(value = "主键id", position = 1)
    private String id;

    /** 出差地点 */
    @ApiModelProperty(value = "出差地点", position = 2)
    private String travelPlace;

    /** 报销日期 */
    @ApiModelProperty(value = "报销日期", position = 3)
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date requestDate;

    /** 到账日期 */
    @ApiModelProperty(value = "到账日期", position = 4)
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date getDate;

    /** 报账天数 */
    @ApiModelProperty(value = "报账天数", position = 5)
    private Integer useDay;

    /** 实际花费 */
    @ApiModelProperty(value = "实际花费", position = 6)
    private BigDecimal useNumber;

    /** 报销金额 */
    @ApiModelProperty(value = "报销金额", position = 7)
    private BigDecimal requestNumber;

    /** 到账金额 */
    @ApiModelProperty(value = "到账金额", position = 8)
    private BigDecimal getNumber;

    /** 得利 */
    @ApiModelProperty(value = "得利", position = 9)
    private BigDecimal addNumber;

    /** 备注 */
    @ApiModelProperty(value = "备注", position = 10)
    private String remark;

    /** 删除标志 */
    @ApiModelProperty(value = "删除标志", position = 11)
    @TableLogic
    @TableField(fill = FieldFill.INSERT)
    private Date deleteFlag;

    /** 创建时间 */
    @ApiModelProperty(value = "创建时间", position = 12)
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    /** 创建用户 */
    @ApiModelProperty(value = "创建用户", position = 13)
    @TableField(fill = FieldFill.INSERT)
    private String createUser;

    /** 修改时间 */
    @ApiModelProperty(value = "修改时间", position = 14)
    @TableField(fill = FieldFill.UPDATE)
    private Date updateTime;

    /** 修改用户 */
    @ApiModelProperty(value = "修改用户", position = 15)
    @TableField(fill = FieldFill.UPDATE)
    private String updateUser;
}

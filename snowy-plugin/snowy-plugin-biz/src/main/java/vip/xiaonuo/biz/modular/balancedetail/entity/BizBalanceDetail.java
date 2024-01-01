package vip.xiaonuo.biz.modular.balancedetail.entity;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import vip.xiaonuo.common.pojo.CommonEntity;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 账户明细实体
 *
 * @author monezhao
 * @date  2023/12/25 16:57
 **/
@Getter
@Setter
@TableName("biz_balance_detail")
public class BizBalanceDetail extends CommonEntity {

    /** 主键ID */
    @TableId
    @ApiModelProperty(value = "主键ID", position = 1)
    private String id;

    /** 账户余额 */
    @ApiModelProperty(value = "账户余额", position = 2)
    private BigDecimal account;

    /** 账户类型 */
    @ApiModelProperty(value = "账户类型", position = 3)
    private String balanceType;

    /** 主表ID */
    @ApiModelProperty(value = "主表ID", position = 4)
    private String balanceMainId;

    /** 所属用户ID */
    @ApiModelProperty(value = "所属用户ID", position = 5)
    private String userId;

    /** 备注 */
    @ApiModelProperty(value = "备注", position = 6)
    private String remark;

    /** 删除标志 */
    @ApiModelProperty(value = "删除标志", position = 7)
    @TableLogic
    @TableField(fill = FieldFill.INSERT)
    private Date deleteFlag;

    /** 创建时间 */
    @ApiModelProperty(value = "创建时间", position = 8)
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    /** 创建用户 */
    @ApiModelProperty(value = "创建用户", position = 9)
    @TableField(fill = FieldFill.INSERT)
    private String createUser;

    /** 修改时间 */
    @ApiModelProperty(value = "修改时间", position = 10)
    @TableField(fill = FieldFill.UPDATE)
    private Date updateTime;

    /** 修改用户 */
    @ApiModelProperty(value = "修改用户", position = 11)
    @TableField(fill = FieldFill.UPDATE)
    private String updateUser;

    /** 账户类型名 */
    @ApiModelProperty(value = "账户类型名", position = 12)
    @TableField(exist = false)
    private String balanceName;

    /**
     * 记录时间
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "记录时间", position = 13)
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @ExcelProperty("记录时间")
    private Date accountDate;

    /**
     * 是否计入总资产
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "记录时间", position = 14)
    @ExcelIgnore
    private String countType = "1";
}

package vip.xiaonuo.biz.modular.balancemain.entity;

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
 * 账户余额实体
 *
 * @author monezhao
 * @date  2023/12/25 16:56
 **/
@Getter
@Setter
@TableName("biz_balance_main")
public class BizBalanceMain extends CommonEntity {

    /** 主键ID */
    @TableId
    @ApiModelProperty(value = "主键ID", position = 1)
    private String id;

    /** 账户余额 */
    @ApiModelProperty(value = "账户余额", position = 2)
    private BigDecimal account = BigDecimal.valueOf(0);

    /** 记录时间 */
    @ApiModelProperty(value = "记录时间", position = 3)
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date accountDate;

    /** 所属用户 */
    @ApiModelProperty(value = "所属用户", position = 4)
    private String userId;

    /** 备注 */
    @ApiModelProperty(value = "备注", position = 5)
    private String remark;

    /** 删除标志 */
    @ApiModelProperty(value = "删除标志", position = 6)
    @TableLogic
    @TableField(fill = FieldFill.INSERT)
    private Date deleteFlag;

    /** 创建时间 */
    @ApiModelProperty(value = "创建时间", position = 7)
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    /** 创建用户 */
    @ApiModelProperty(value = "创建用户", position = 8)
    @TableField(fill = FieldFill.INSERT)
    private String createUser;

    /** 修改时间 */
    @ApiModelProperty(value = "修改时间", position = 9)
    @TableField(fill = FieldFill.UPDATE)
    private Date updateTime;

    /** 修改用户 */
    @ApiModelProperty(value = "修改用户", position = 10)
    @TableField(fill = FieldFill.UPDATE)
    private String updateUser;

    /** 用户名 */
    @ApiModelProperty(value = "用户名", position = 11)
    @TableField(exist = false)
    private String userName;
}

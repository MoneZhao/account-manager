package vip.xiaonuo.biz.modular.balancecount.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * 计入总资产实体
 *
 * @author monezhao
 * @date  2023/12/23 21:12
 **/
@Getter
@Setter
@TableName("biz_balance_count")
public class BizBalanceCount {

    /** 主键ID */
    @TableId
    @ApiModelProperty(value = "主键ID", position = 1)
    private String id;

    /** 账户类型ID */
    @ApiModelProperty(value = "账户类型ID", position = 2)
    private String codeInfoId;

    /** 是否计入总资产 */
    @ApiModelProperty(value = "是否计入总资产", position = 3)
    private String countType;

    /** 所属用户 */
    @ApiModelProperty(value = "所属用户", position = 4)
    private String userId;

    /** 创建时间 */
    @ApiModelProperty(value = "创建时间", position = 5)
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    /** 创建用户 */
    @ApiModelProperty(value = "创建用户", position = 6)
    @TableField(fill = FieldFill.INSERT)
    private String createUser;

    /** 修改时间 */
    @ApiModelProperty(value = "修改时间", position = 7)
    @TableField(fill = FieldFill.UPDATE)
    private Date updateTime;

    /** 修改用户 */
    @ApiModelProperty(value = "修改用户", position = 8)
    @TableField(fill = FieldFill.UPDATE)
    private String updateUser;

    /** 字典Label */
    @ApiModelProperty(value = "字典Label", position = 9)
    @TableField(exist = false)
    private String dictLabel;

    /** 字典值 */
    @ApiModelProperty(value = "字典值", position = 9)
    @TableField(exist = false)
    private String dictValue;
}

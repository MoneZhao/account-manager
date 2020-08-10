package com.monezhao.bean.sys;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:48
 * @Description: 岗位
 */
@Getter
@Setter
@TableName("t_sys_post")
@ApiModel(value = "岗位")
public class SysPost extends BaseEntity {

    private static final long serialVersionUID = -8494479595234006247L;

    /**
     * 岗位ID
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @LengthForUtf8(max = 32)
    @ApiModelProperty(value = "主键id")
    private String postId;

    /**
     * 岗位名称
     */
    @NotNull
    @LengthForUtf8(max = 255)
    @ApiModelProperty(value = "岗位名称")
    private String postName;

    /**
     * 排序号
     */
    @Max(9999)
    @ApiModelProperty(value = "排序号")
    private Integer sortNo;

    /**
     * 备注
     */
    @LengthForUtf8(max = 255)
    @ApiModelProperty(value = "备注")
    private String remark;

}

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

import javax.validation.constraints.NotNull;

/**
 * 【图片上传下载】实体类
 *
 * @author monezhao@163.com
 */
@Getter
@Setter
@TableName("t_sys_pic_up_down")
@ApiModel(value = "图片上传下载")
public class SysPicUpDown extends BaseEntity {

    private static final long serialVersionUID = -9014254551394334147L;

    /**
     * 主键id
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @ApiModelProperty(value = "主键id")
    @LengthForUtf8(max = 32)
    private String picUpDownId;

    /**
     * 图片名
     */
    @ApiModelProperty(value = "图片名")
    @LengthForUtf8(max = 50)
    private String picName;

    /**
     * 图片
     */
    @NotNull
    @ApiModelProperty(value = "图片")
    private byte[] pic;

    /**
     * md5
     */
    @ApiModelProperty(value = "md5")
    @LengthForUtf8(max = 200)
    private String md5;

}
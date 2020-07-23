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
 * 【代码在线生成】实体类
 *
 * @author monezhao@163.com
 */
@Getter
@Setter
@TableName("t_sys_code_create")
@ApiModel(value = "代码在线生成")
public class SysCodeCreate extends BaseEntity {

    private static final long serialVersionUID = -5798952109797512941L;

    /**
     * 主键id
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @ApiModelProperty(value = "主键id")
    @LengthForUtf8(max = 32)
    private String codeCreateId;

    /**
     * 表名
     */
    @NotNull
    @ApiModelProperty(value = "表名")
    @LengthForUtf8(max = 50)
    private String codeCreateTablename;

    /**
     * 模块名
     */
    @NotNull
    @ApiModelProperty(value = "模块名")
    @LengthForUtf8(max = 200)
    private String codeCreateModule;

    /**
     * 文件名
     */
    @NotNull
    @ApiModelProperty(value = "文件名")
    @LengthForUtf8(max = 200)
    private String codeCreateFilename;

}
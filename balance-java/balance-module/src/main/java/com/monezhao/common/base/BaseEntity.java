package com.monezhao.common.base;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:58
 * @Description:
 */
@Getter
@Setter
public class BaseEntity implements Serializable {

    private static final long serialVersionUID = 6433634024315315400L;

    @TableField(fill = FieldFill.INSERT)
    @ExcelIgnore
    @ApiModelProperty(hidden = true)
    private String createBy;

    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @ExcelIgnore
    @ApiModelProperty(hidden = true)
    private Date createDate;

    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ExcelIgnore
    @ApiModelProperty(hidden = true)
    private Date createTime;

    @TableField(fill = FieldFill.UPDATE)
    @ExcelIgnore
    @ApiModelProperty(hidden = true)
    private String updateBy;

    @TableField(fill = FieldFill.UPDATE)
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @ExcelIgnore
    @ApiModelProperty(hidden = true)
    private Date updateDate;

    @TableField(fill = FieldFill.UPDATE)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ExcelIgnore
    @ApiModelProperty(hidden = true)
    private Date updateTime;
}

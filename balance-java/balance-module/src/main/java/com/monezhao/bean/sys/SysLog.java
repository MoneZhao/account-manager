package com.monezhao.bean.sys;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:47
 * @Description: 系统日志
 */
@Getter
@Setter
@TableName("t_sys_log")
@ApiModel(value = "系统日志")
public class SysLog extends BaseEntity {

    private static final long serialVersionUID = 4421875099563322912L;

    /**
     * UUID
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @LengthForUtf8(max = 32)
    @ApiModelProperty(value = "主键id")
    @ExcelProperty("主键id")
    private String logId;

    /**
     * 日志类型
     */
    @NotNull
    @LengthForUtf8(max = 2)
    @ApiModelProperty(value = "日志类型")
    @ExcelProperty("日志类型")
    private String logType;

    /**
     * 日志内容
     */
    @NotNull
    @LengthForUtf8(max = 100)
    @ApiModelProperty(value = "日志内容")
    @ExcelProperty("日志内容")
    private String logContent;

    /**
     * 操作类型
     */
    @LengthForUtf8(max = 2)
    @ApiModelProperty(value = "操作类型")
    @ExcelIgnore
    private String operateType;

    /**
     * 操作用户
     */
    @LengthForUtf8(max = 32)
    @ApiModelProperty(value = "操作用户")
    @ExcelProperty("操作用户")
    private String userId;

    /**
     * 操作用户姓名
     */
    @LengthForUtf8(max = 100)
    @ApiModelProperty(value = "操作用户姓名")
    @ExcelProperty("操作用户姓名")
    private String userName;

    /**
     * IP地址
     */
    @LengthForUtf8(max = 100)
    @ApiModelProperty(value = "IP地址")
    @ExcelProperty("IP地址")
    private String ip;

    /**
     * 请求方法
     */
    @LengthForUtf8(max = 255)
    @ApiModelProperty(value = "请求方法")
    @ExcelProperty("请求方法")
    private String method;

    /**
     * 请求路径
     */
    @LengthForUtf8(max = 255)
    @ApiModelProperty(value = "请求路径")
    @ExcelProperty("请求路径")
    private String requestUrl;

    /**
     * 请求参数
     */
    @ApiModelProperty(value = "请求参数")
    @ExcelProperty("请求参数")
    private String requestParam;

    /**
     * 请求类型
     */
    @LengthForUtf8(max = 10)
    @ApiModelProperty(value = "请求类型")
    @ExcelProperty("请求类型")
    private String requestType;

    /**
     * 操作结果
     */
    @ApiModelProperty(value = "操作结果")
    @ExcelProperty("操作结果")
    private String operateResult;

    /**
     * 操作结果是否成功 0否 1是
     */
    @ApiModelProperty(value = "操作结果是否成功")
    @ExcelProperty("操作结果是否成功")
    private String success;

    /**
     * 耗时
     */
    @ApiModelProperty(value = "耗时")
    @ExcelProperty("耗时")
    private Long costTime;

    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(hidden = true)
    @ExcelProperty("操作人")
    private String createBy;

    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @ApiModelProperty(hidden = true)
    @ExcelProperty("操作日期")
    private Date createDate;

    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(hidden = true)
    @ExcelProperty("操作时间")
    private Date createTime;
}

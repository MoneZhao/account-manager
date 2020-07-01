package com.monezhao.bean.sys;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import java.util.Date;


/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:47
 * @Description: 定时任务执行日志
 */
@Getter
@Setter
@TableName("t_sys_job_log")
public class SysJobLog extends BaseEntity {

    private static final long serialVersionUID = 2894129710015053413L;

    /**
     * 日志ID
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @NotNull
    @LengthForUtf8(max = 32)
    private String jobLogId;

    /**
     * 任务名称
     */
    @NotNull
    @LengthForUtf8(max = 64)
    private String jobName;

    /**
     * 任务组名
     */
    @NotNull
    @LengthForUtf8(max = 64)
    private String jobGroup;

    /**
     * 调用目标字符串
     */
    @NotNull
    @LengthForUtf8(max = 500)
    private String invokeTarget;

    /**
     * 日志信息
     */
    @LengthForUtf8(max = 500)
    private String jobMessage;

    /**
     * 是否正常执行
     */
    @LengthForUtf8(max = 20)
    private String status;

    /**
     * 异常信息
     */
    private String exceptionInfo;

    /**
     * 开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /**
     * 结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date stopTime;

}

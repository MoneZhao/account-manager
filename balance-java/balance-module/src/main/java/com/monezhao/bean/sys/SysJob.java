package com.monezhao.bean.sys;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
import io.swagger.annotations.ApiModel;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:47
 * @Description: 定时任务
 */
@Getter
@Setter
@TableName("t_sys_job")
@ApiModel(value = "定时任务")
public class SysJob extends BaseEntity {

    private static final long serialVersionUID = -1197429938396957764L;

    /**
     * 任务ID
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @LengthForUtf8(max = 32)
    private String jobId;

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
     * cron执行表达式
     */
    @LengthForUtf8(max = 255)
    private String cronExpression;

    /**
     * 计划执行错误策略
     */
    @LengthForUtf8(max = 20)
    private String misfirePolicy;

    /**
     * 是否并发执行
     */
    @LengthForUtf8(max = 1)
    private String concurrent;

    /**
     * 是否正常状态
     */
    @LengthForUtf8(max = 1)
    private String status;

    /**
     * 备注
     */
    @LengthForUtf8(max = 500)
    private String remark;

}

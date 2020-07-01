package com.monezhao.bean.sys;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:47
 * @Description: 系统日志
 */
@Getter
@Setter
@TableName("t_sys_log")
public class SysLog extends BaseEntity {

    private static final long serialVersionUID = 4421875099563322912L;

    /**
     * UUID
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @LengthForUtf8(max = 32)
    private String logId;

    /**
     * 日志类型
     */
    @NotNull
    @LengthForUtf8(max = 2)
    private String logType;

    /**
     * 日志内容
     */
    @NotNull
    @LengthForUtf8(max = 100)
    private String logContent;

    /**
     * 操作类型
     */
    @LengthForUtf8(max = 2)
    private String operateType;

    /**
     * 操作用户
     */
    @LengthForUtf8(max = 32)
    private String userId;

    /**
     * 操作用户姓名
     */
    @LengthForUtf8(max = 100)
    private String userName;

    /**
     * IP地址
     */
    @LengthForUtf8(max = 100)
    private String ip;

    /**
     * 请求方法
     */
    @LengthForUtf8(max = 255)
    private String method;

    /**
     * 请求路径
     */
    @LengthForUtf8(max = 255)
    private String requestUrl;

    /**
     * 请求参数
     */
    private String requestParam;

    /**
     * 请求类型
     */
    @LengthForUtf8(max = 10)
    private String requestType;

    /**
     * 操作结果
     */
    private String operateResult;

    /**
     * 耗时
     */
    private Long costTime;

}

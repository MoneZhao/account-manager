package com.monezhao.common;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:50
 * @Description: 接口返回结果
 */
@Data
@ApiModel(value = "返回说明")
public class Result implements Serializable {

    private static final long serialVersionUID = 3571474161883509228L;

    private static Integer SC_INTERNAL_SERVER_ERROR = 500;
    private static Integer SC_OK = 200;

    @ApiModelProperty(value = "返回状态码；200:成功")
    private Integer code = 0;
    @ApiModelProperty(value = "返回信息")
    private String msg = "操作成功";

    @ApiModelProperty(value = "返回数据")
    private Object data;

    public Result() {
    }

    public Result(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Result(String msg) {
        this.code = SC_OK;
        this.msg = msg;
    }

    public Result(Integer code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static Result error(String msg) {
        return error(SC_INTERNAL_SERVER_ERROR, msg);
    }

    public static Result error(int code, String msg) {
        if (msg == null || msg.length() == 0) {
            msg = "交易执行失败";
        }
        Result r = new Result(code, msg);
        return r;
    }

    public static Result error(int code, String msg, Object data) {
        if (msg == null || msg.length() == 0) {
            msg = "交易执行失败";
        }
        Result r = new Result(code, msg, data);
        return r;
    }

    public static Result ok() {
        Result r = new Result();
        r.setCode(SC_OK);
        return r;
    }

    public static Result ok(String msg) {
        Result r = new Result(msg);
        return r;
    }

    public static Result ok(Object data) {
        Result r = new Result();
        r.setCode(SC_OK);
        r.setData(data);
        return r;
    }

    public static Result ok(String msg, Object data) {
        Result r = new Result();
        r.setCode(SC_OK);
        if (msg != null && msg.length() != 0) {
            r.setMsg(msg);
        }
        r.setData(data);
        return r;
    }
}

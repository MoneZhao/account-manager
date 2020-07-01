package com.monezhao.common.exception;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:58
 * @Description:
 */
public class BaseException extends RuntimeException {

    private static final long serialVersionUID = 2367542322611473587L;

    protected String errCode;

    protected String errMsg;

    public BaseException() {
    }

    public BaseException(Throwable e) {
        super(e);
    }

    public BaseException(String errMsg) {
        super(errMsg);
        this.errMsg = errMsg;
    }

    public BaseException(String errMsg, Throwable e) {
        super(errMsg, e);
        this.errMsg = errMsg;
    }

    public String getErrCode() {
        return errCode;
    }

    public void setErrCode(String errCode) {
        this.errCode = errCode;
    }

    public String getErrMsg() {
        return errMsg;
    }

    public void setErrMsg(String errMsg) {
        this.errMsg = errMsg;
    }
}

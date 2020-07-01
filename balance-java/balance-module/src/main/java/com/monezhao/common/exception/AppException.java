package com.monezhao.common.exception;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:58
 * @Description:
 */
public class AppException extends BaseException {

    private static final long serialVersionUID = 2714985158837181914L;

    public AppException() {
    }

    public AppException(Throwable cause) {
        super(cause);
    }

    public AppException(String errMsg) {
        super(errMsg);
    }

    public AppException(String errMsg, Throwable cause) {
        super(errMsg, cause);
    }

    public AppException(String errCode, String errMsg, Throwable cause) {
        super(errMsg, cause);
        this.errCode = errCode;
    }
}

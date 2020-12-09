package com.monezhao.common.exception;

import org.flowable.common.engine.api.FlowableException;

/**
 * @author monezhao@163.com
 * @date 2020年10月24日
 */
public class FlowableNoPermissionException extends FlowableException {

    private static final long serialVersionUID = 1L;

    public FlowableNoPermissionException(String message) {
        super(message);
    }

    public FlowableNoPermissionException(String message, Throwable cause) {
        super(message, cause);
    }
}

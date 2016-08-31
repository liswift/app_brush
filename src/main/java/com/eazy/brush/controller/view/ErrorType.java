package com.eazy.brush.controller.view;


import com.google.common.collect.Maps;

import java.util.Map;

/**
 * User: edwin
 * Email: fuye.wang@yinyuetai.com
 * Date: 12-5-30
 */

public enum ErrorType {
    _10001(400, 10001, "System error", "用户名密码不能为空");

    private int statusCode;
    private int errorCode;
    private String error;
    private String displayMessage;

    ErrorType(int statusCode, int errorCode, String error, String displayMessage) {
        this.statusCode = statusCode;
        this.errorCode = errorCode;
        this.error = error;
        this.displayMessage = displayMessage;
        ErrorTypeHelper.map.put(errorCode, this);
    }

    public static ErrorType valueOf(int errorCode) {
        return ErrorTypeHelper.map.get(errorCode);
    }

    public int getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public String getError() {
        return error;
    }

    public String getDisplayMessage() {
        return displayMessage;
    }

    public void setDisplayMessage(String displayMessage) {
        this.displayMessage = displayMessage;
    }

    static class ErrorTypeHelper {
        static Map<Integer, ErrorType> map = Maps.newHashMap();
    }
}

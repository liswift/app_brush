package com.eazy.brush.controller.common.models;

import java.io.Serializable;


public class ResultDataModel implements Serializable {

    private boolean success;
    private String message;

    public ResultDataModel() {}

	public ResultDataModel(boolean success, String message) {
		this.success = success;
		this.message = message;
	}

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}

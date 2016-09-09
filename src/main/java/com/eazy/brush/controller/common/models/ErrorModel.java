package com.eazy.brush.controller.common.models;

import org.codehaus.jackson.annotate.JsonProperty;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.Serializable;

public class ErrorModel implements Serializable {
	private static final Logger logger = LoggerFactory.getLogger(ErrorModel.class);
	private String request;
	private String error_code;
	private String error;
	@JsonProperty("display_message")
	private String displayMessage;

	public ErrorModel(String request, ErrorType errorType, Object... args) {
		this(request, errorType.getDisplayMessage(), String.valueOf(errorType.getErrorCode()), errorType.getError());
		try {
			String error = String.format(errorType.getError(), args);
			this.error = error;
		} catch (Exception ex) {
			logger.error("ErrorModel format error:" + errorType.getErrorCode() + "," + args.length);
		}
	}

	public ErrorModel(String request, String displayMessage, ErrorType errorType, Object... args) {
		this(request, displayMessage, String.valueOf(errorType.getErrorCode()), errorType.getError());
		try {
			String error = String.format(errorType.getError(), args);
			String message = String.format(displayMessage, args);
			this.error = error;
			this.displayMessage = message;
		} catch (Exception ex) {
			logger.error("ErrorModel format error:" + errorType.getErrorCode() + "," + args.length);
		}
	}

	public ErrorModel(String request, String displayMessage, String error_code, String error) {
		this.request = request;
		this.error_code = error_code;
		this.error = error;
		this.displayMessage = displayMessage;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getError_code() {
		return error_code;
	}

	public void setError_code(String error_code) {
		this.error_code = error_code;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getDisplayMessage() {
		return displayMessage;
	}

	public void setDisplayMessage(String displayMessage) {
		this.displayMessage = displayMessage;
	}

	@Override
	public String toString() {
		return String.format("ErrorModel[request=%s,error_code=%s,error=%s,displayMessage=%s]", request, error_code, error, displayMessage);
	}
}

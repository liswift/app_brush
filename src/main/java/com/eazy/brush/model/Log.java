package com.eazy.brush.model;

import lombok.Data;

import java.sql.Timestamp;


/**
 * 日志entity
 *
 * @author ty
 * @date 2015年1月13日
 */
@Data
public class Log implements java.io.Serializable {

    private static final long serialVersionUID = 1L;
    private Integer id;
    private String operationCode;
    private String creater;
    private Timestamp createDate;
    private Integer type;
    private String os;
    private String browser;
    private String ip;
    private String mac;
    private Integer executeTime;
    private String description;
    private String requestParam;


    public Log() {
    }

    public Log(String operationCode, Timestamp createDate) {
        this.operationCode = operationCode;
        this.createDate = createDate;
    }

    public Log(String operationCode, String creater, Timestamp createDate,
               Integer type, String os, String browser, String ip, String mac,
               Integer executeTime, String description, String requestParam) {
        this.operationCode = operationCode;
        this.creater = creater;
        this.createDate = createDate;
        this.type = type;
        this.os = os;
        this.browser = browser;
        this.ip = ip;
        this.mac = mac;
        this.executeTime = executeTime;
        this.description = description;
        this.requestParam = requestParam;
    }
}
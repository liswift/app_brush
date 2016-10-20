package com.eazy.brush.core.enums;

/**
 * Created by yuekuapp on 16-9-20.
 * 留存任务:当天的任务留存
 * 激活任务:当天的新增任务
 * 唤醒任务:当天的唤醒启动任务
 */
public enum  SubTaskType {
    RETAIN("留存任务", 0),ACTIVE("激活任务", 1),SETUP("唤醒任务",2);

    private String name;
    private int code;

    SubTaskType(String name, int code) {
        this.name = name;
        this.code = code;
    }

    public static SubTaskType valueOf(int code) {
        for (SubTaskType t : SubTaskType.values()) {
            if (t.getCode() == code) {
                return t;
            }
        }
        return null;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}

package com.eazy.brush.core.enums;

/**
 * Created by yuekuapp on 16-9-20.
 */
public enum  SubTaskType {
    RETAIN("留存任务", 0),ACTIVE("激活任务", 1);

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

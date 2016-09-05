package com.eazy.brush.core.enums;

/**
 * 任务投放速度枚举
 *
 * @author feng.liu
 * @date 2016/9/5 13:35
 */
public enum TaskSpeedType {

    make_immediate("立即投放", 0), make_banlance("均匀投放", 1);

    private String name;
    private int code;

    TaskSpeedType(String name, int code) {
        this.name = name;
        this.code = code;
    }

    public static TaskState valueOf(int code) {
        for (TaskState t : TaskState.values()) {
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

package com.eazy.brush.core.enums;

/**
 * author : liufeng
 * create time:2016/9/4 10:52
 */
public enum TaskState {
    confirm_ing("审核中", -1),
    confirm_failed("审核失败", 0),
    stoped("已停止", 1),
    confirm_passed("审核通过", 2),
    running("运行中", 3);

    public static boolean isEnable(int state){
        TaskState[] values = TaskState.values();
        for(TaskState value:values){
            if(value.code==state){
                return  true;
            }
        }
        return false;
    }

    private String name;
    private int code;

    TaskState(String name, int code) {
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

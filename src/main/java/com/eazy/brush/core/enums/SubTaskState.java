package com.eazy.brush.core.enums;

/**
 * Created by yuekuapp on 16-9-20.
 */
public enum SubTaskState {
    INIT("初始化",0),RUNNING("运行中",1),FINISHED("完成",2);
    private int state;
    private String msg;
    SubTaskState(String msg,int state){
        this.state=state;
        this.msg=msg;
    }
    public int getState(){
        return state;
    }
}

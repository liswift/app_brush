package com.eazy.brush.core.utils;

/**
 * Created by yuekuapp on 16-9-20.
 */
public class RetainPercentUtil {

    public static double calcRetainPercent(int retainPercent,int retainDay) {
        if(retainDay==0){
            return 0;
        }
        //Math.pow(27,1d/3) == 27 开 3 次方
        return Math.pow(retainPercent * 1.0 / 100, 1d / retainDay);
    }

}

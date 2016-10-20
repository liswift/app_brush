package com.eazy.brush.core.utils;

import java.io.File;

/**
 * Created by yuekuapp on 16-9-27.
 * 文件路径的规则:年/月/日/2位uuid/3位uuid/
 */
public class PathUtil {

    /**
     *
     * @param UUid  00c1e88c-9984-4278-b595-d83dd8d260d0
     * @return
     */
    public static String getPathByCreateDayAndUuid(String UUid){
        StringBuilder builder=new StringBuilder();
        String uuid=UUid.replaceAll("-","");
        builder.append(uuid.substring(0,2)+File.separator);
        builder.append(uuid.substring(2,4)+File.separator);
        builder.append(uuid.substring(4,7)+File.separator);
        return builder.toString();
    }


}

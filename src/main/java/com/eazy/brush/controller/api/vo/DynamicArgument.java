package com.eazy.brush.controller.api.vo;

import lombok.Data;
import org.apache.commons.collections.map.HashedMap;

import java.util.Map;

/**
 * Created by yuekuapp on 16-10-18.
 * type:argument
 */
@Data
public class DynamicArgument {

    private String type;
    private Map<String, String> arguments;

    public DynamicArgument(String type, Map<String, String> defaultKeyValues) {
        this.type = type;
        this.arguments = defaultKeyValues;
    }

    /**
     * getMobilenum_key=value&key=value
     * @param argument
     * @return
     */
    public static DynamicArgument trans2Dynamic(String argument) {
        String[] result = argument.split("_");
        String type = result[0];
        String keyvalue = result[1];
        Map<String, String> map = new HashedMap();
        String[] args = keyvalue.split("&");
        for (String arg : args) {
            String[] split = arg.split("=");
            map.put(split[0], split[1]);
        }
        return new DynamicArgument(type, map);
    }

    public Map<String,String> getArguments(){
        return arguments;
    }

    public String getValue(String key) {
        return arguments.get(key);
    }
}

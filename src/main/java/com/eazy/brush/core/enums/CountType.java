package com.eazy.brush.core.enums;

public enum CountType {
    Unknown(0, "Unknown"), //
    taskSubDayNum(1, "taskSubDayNum"), //任务每日子任务总数量
    ;

    private int value;

    private String cacheKey;

    CountType(int value, String cacheKey) {
        this.value = value;
        this.cacheKey = cacheKey;
    }

    public int getValue() {
        return value;
    }

    public String build(Object param) {
        if (param != null) {
            return cacheKey + param.toString();
        } else {
            return cacheKey;
        }
    }

    private static final java.util.Map<Integer, CountType> map = new java.util.HashMap<Integer, CountType>();

    static {
        for (CountType e : CountType.values()) {
            map.put(e.getValue(), e);
        }
    }

    public static final CountType fromValue(int status) {
        return map.get(status);
    }
}

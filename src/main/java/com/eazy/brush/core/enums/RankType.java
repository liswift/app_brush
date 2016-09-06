package com.eazy.brush.core.enums;

public enum RankType {
    Unknown(0, "Unknown"), //
    ;

    private int value;

    private String cacheKey;

    private RankType(int value, String cacheKey) {
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

    private static final java.util.Map<Integer, RankType> map = new java.util.HashMap<Integer, RankType>();

    static {
        for (RankType e : RankType.values()) {
            map.put(e.getValue(), e);
        }
    }

    public static final RankType fromValue(int status) {
        return map.get(status);
    }


}

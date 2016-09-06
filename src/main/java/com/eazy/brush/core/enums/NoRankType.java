package com.eazy.brush.core.enums;

public enum NoRankType {
    Unknown(0, "Unknown"), //
    ;

    private int value;

    private String cacheKey;

    NoRankType(int value, String cacheKey) {
        this.value = value;
        this.cacheKey = cacheKey;
    }

    public int getValue() {
        return value;
    }

    public String build(Object param) {
        if (param != null) {
            return this.cacheKey + param.toString();
        } else {
            return this.cacheKey;
        }
    }

    private static final java.util.Map<Integer, NoRankType> map = new java.util.HashMap<Integer, NoRankType>();

    static {
        for (NoRankType e : NoRankType.values()) {
            map.put(e.getValue(), e);
        }
    }

    public static final NoRankType fromValue(int status) {
        return map.get(status);
    }
}

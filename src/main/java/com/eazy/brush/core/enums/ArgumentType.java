package com.eazy.brush.core.enums;

/**
 * 元动作参数类型
 * author : liufeng
 * create time:2016/9/11 11:54
 */
public enum ArgumentType {

    ACTION_ARGUMENT_MOVEMENT_GRANULARITY_INT(0, "ACTION_ARGUMENT_MOVEMENT_GRANULARITY_INT"),
    ACTION_ARGUMENT_HTML_ELEMENT_STRING(1, "ACTION_ARGUMENT_HTML_ELEMENT_STRING"),
    ACTION_ARGUMENT_EXTEND_SELECTION_BOOLEAN(2, "ACTION_ARGUMENT_EXTEND_SELECTION_BOOLEAN"),
    ACTION_ARGUMENT_SELECTION_START_INT(3, "ACTION_ARGUMENT_SELECTION_START_INT"),
    ACTION_ARGUMENT_SELECTION_END_INT(4, "ACTION_ARGUMENT_SELECTION_END_INT"),
    ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE(5, "ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE"),
    ACTION_ARGUMENT_ROW_INT(6, "android.view.accessibility.action.ARGUMENT_ROW_INT"),
    ACTION_ARGUMENT_COLUMN_INT(7, "android.view.accessibility.action.ARGUMENT_COLUMN_INT");

    private int value;
    private String key;

    ArgumentType(int value, String key) {
        this.value = value;
        this.key = key;
    }

    public int getValue() {
        return value;
    }

    private static final java.util.Map<Integer, ArgumentType> map = new java.util.HashMap<Integer, ArgumentType>();

    static {
        for (ArgumentType e : ArgumentType.values()) {
            map.put(e.getValue(), e);
        }
    }

    public static final ArgumentType fromValue(int status) {
        return map.get(status);
    }
}

package com.eazy.brush.core.enums;

/**
 * 元动作分类
 * author : liufeng
 * create time:2016/9/11 11:40
 */
public enum ActionType {

    ACTION_FOCUS(0x00000001, "ACTION_FOCUS"),
    ACTION_CLEAR_FOCUS(0x00000002, "ACTION_CLEAR_FOCUS"),
    ACTION_SELECT(0x00000004, "ACTION_SELECT"),
    ACTION_CLEAR_SELECTION(0x00000008, "ACTION_CLEAR_SELECTION"),
    ACTION_CLICK(0x00000010, "ACTION_CLICK"),
    ACTION_LONG_CLICK(0x00000020, "ACTION_LONG_CLICK"),
    ACTION_ACCESSIBILITY_FOCUS(0x00000040, "ACTION_ACCESSIBILITY_FOCUS"),
    ACTION_CLEAR_ACCESSIBILITY_FOCUS(0x00000080, "ACTION_CLEAR_ACCESSIBILITY_FOCUS"),
    ACTION_NEXT_AT_MOVEMENT_GRANULARITY(0x00000100, "ACTION_NEXT_AT_MOVEMENT_GRANULARITY"),
    ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY(0x00000200, "ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY"),
    ACTION_NEXT_HTML_ELEMENT(0x00000400, "ACTION_NEXT_HTML_ELEMENT"),
    ACTION_PREVIOUS_HTML_ELEMENT(0x00000800, "ACTION_PREVIOUS_HTML_ELEMENT"),
    ACTION_SCROLL_FORWARD(0x00001000, "ACTION_SCROLL_FORWARD"),
    ACTION_SCROLL_BACKWARD(0x00002000, "ACTION_SCROLL_BACKWARD"),
    ACTION_COPY(0x00004000, "ACTION_COPY"),
    ACTION_PASTE(0x00008000, "ACTION_PASTE"),
    ACTION_CUT(0x00010000, "ACTION_CUT"),
    ACTION_SET_SELECTION(0x00020000, "ACTION_SET_SELECTION"),
    ACTION_EXPAND(0x00040000, "ACTION_EXPAND"),
    ACTION_COLLAPSE(0x00080000, "ACTION_COLLAPSE"),
    ACTION_DISMISS(0x00100000, "ACTION_DISMISS"),
    ACTION_SET_TEXT(0x00200000, "ACTION_SET_TEXT"),;

    private int value;
    private String key;

    ActionType(int value, String key) {
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

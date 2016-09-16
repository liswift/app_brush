package com.eazy.brush.controller.converter;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.convert.converter.Converter;

/**
 * author : liufeng
 * create time:2016/9/16 11:54
 */
public class IntegerConverter implements Converter<String, Integer> {

    @Override
    public Integer convert(String text) {
        if (StringUtils.isEmpty(text)) {
            return 0;
        }
        try {
            return Integer.parseInt(text);
        } catch (Exception e) {
        }
        return 0;
    }
}

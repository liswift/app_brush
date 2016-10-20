package com.eazy.brush.controller.converter;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.convert.converter.Converter;

/**
 * author : liufeng
 * create time:2016/9/16 11:51
 */
public class LongConverter implements Converter<String, Long> {

    @Override
    public Long convert(String text) {
        if (StringUtils.isEmpty(text)) {
            return 0l;
        }
        try {
            return Long.parseLong(text);
        } catch (Exception e) {
        }
        return 0l;
    }
}

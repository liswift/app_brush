package com.eazy.brush.controller.converter;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.core.convert.converter.Converter;

import java.util.Date;

/**
 * author : liufeng
 * create time:2016/9/16 12:13
 */
public class DateConverter implements Converter<String, Date> {

    @Override
    public Date convert(String text) {
        if (StringUtils.isEmpty(text)) {
            return new Date();
        }
        try {
            DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
            DateTime dateTime = DateTime.parse(text, format);
            return dateTime.toDate();
        } catch (Exception e) {
        }
        return new Date();
    }
}

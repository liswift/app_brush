package com.eazy.brush.core.utils;

import org.joda.time.DateTime;

/**
 * DateTimeUtil
 * author : liufeng
 * create time:2016/8/28 16:26
 */
public class DateTimeUitl {

    /**
     * 获取任务开始时间
     *
     * @param startHour 任务开始时间
     * @param dayIndex  第几天的任务
     * @return
     */
    public static DateTime getStartTime(int startHour, int dayIndex) {
        DateTime startTime = DateTime.now().plusDays(dayIndex).
                withHourOfDay(startHour)
                .withMinuteOfHour(0);

        if (dayIndex == 0) { //当天
            startTime = getNowPerTime(DateTime.now());
        }
        return startTime;
    }

    /**
     * 获取给定时间属于什么粒度
     *
     * @return
     */
    public static DateTime getNowPerTime(DateTime dateTime) {
        DateTime startTime;
        int minute = (dateTime.getMinuteOfHour() / Constants.TASK_SUB_PER_MINITE + 1)
                * Constants.TASK_SUB_PER_MINITE;
        startTime = DateTime.now().withMinuteOfHour(minute);
        if (minute == 60) {
            startTime = DateTime.now().withMinuteOfHour(0).plusHours(1);
        }
        return startTime;
    }


}

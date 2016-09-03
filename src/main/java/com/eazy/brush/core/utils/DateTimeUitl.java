package com.eazy.brush.core.utils;

import org.joda.time.DateTime;
import org.joda.time.Period;
import org.joda.time.PeriodType;

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
            startTime = getPerTime(DateTime.now());
        }
        return startTime;
    }

    /**
     * 获取给定时间属于什么粒度
     *
     * @return
     */
    public static DateTime getPerTime(DateTime dateTime) {
        DateTime startTime;
        int minute = (dateTime.getMinuteOfHour() / Constants.TASK_SUB_PER_MINITE + 1)
                * Constants.TASK_SUB_PER_MINITE;
        if (minute == 60) {
            startTime = DateTime.now().withMinuteOfHour(0).plusHours(1);
        } else {
            startTime = DateTime.now().withMinuteOfHour(minute);
        }
        return startTime;
    }

    /**
     * 获取给定的时间距离多少天
     *
     * @param start
     * @param end
     * @return
     */
    public static int getDayInter(DateTime start, DateTime end) {
        Period p = new Period(start.withHourOfDay(0).withMinuteOfHour(0).withSecondOfMinute(0),
                end.withHourOfDay(0).withMinuteOfHour(0).withSecondOfMinute(0), PeriodType.days());
        return p.getDays();
    }
}

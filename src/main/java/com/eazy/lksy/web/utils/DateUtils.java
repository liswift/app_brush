package com.eazy.lksy.web.utils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {

	public static String yyyyMMdd = "YYYY-MM-dd";
	public static String yyyyMMddHHMMSS = "YYYY-MM-dd HH:mm:ss";
	private static DateFormat format = new SimpleDateFormat(yyyyMMdd);
	
	String date;
	public DateUtils(String date) {
		this.date = date;
	}
	
	public static String [] getHour() {
		String [] hour = new String[24];
		for(int i =24 - 1; i>= 0 ; i--) {
			if(i == 0)
			hour [i] =  "00:00";
			else
			hour [i] = i + ":00";				
		}
		return hour;
	}
	
	public static void main(String[] args) {
		Calendar c2 = Calendar.getInstance();
		c2.add(Calendar.DAY_OF_MONTH, 1);
		String startTime = new SimpleDateFormat("yyyy-MM-dd").format(c2.getTime());
		System.out.println(startTime);
	}
	
	public static String getNowTime() {
		Calendar cd = Calendar.getInstance();
		return format.format(cd.getTime());
	}
	
	public static String getNowTime(String dateType) {
		Calendar cd = Calendar.getInstance();
		format = new SimpleDateFormat(dateType);
		return format.format(cd.getTime());
	}
	
	/**
	 * 指定任意日期格式化
	 * @param dataType 日期类型
	 * @param anotherDay 任意日期
	 * @return 
	 */
	public static String parseDate(String dataType, String anotherDay) {
		try {
			format = new SimpleDateFormat(dataType);
			Date date = format.parse(anotherDay);
			return format.format(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取系统时间Timestamp
	 * @return
	 */
	public static Timestamp getSysTimestamp(){
		return new Timestamp(new Date().getTime());
	}
	
	public static String[] getStartEnd() {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, -6);// 得到前7
		String startTime = new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
		Calendar c2 = Calendar.getInstance();
		c2.add(Calendar.DAY_OF_MONTH, 1);
		String endTime = new SimpleDateFormat("yyyy-MM-dd").format(c2.getTime());
		return new String[]{startTime,endTime};
	}
	
	public static String[] getEmailTime() {
		String[] email = new String[6]; 
	    //得到当前时间，+3天
		// rightNow.add(java.util.Calendar.DAY_OF_MONTH, 3);   
	    for(int i = 5; i>= 0; i --) {
	    	java.util.Calendar rightNow = java.util.Calendar.getInstance();
		    java.text.SimpleDateFormat sim = new java.text.SimpleDateFormat("yyyy-MM-dd");
	    	rightNow.add(java.util.Calendar.DAY_OF_MONTH, -i);
	    	email [i] = sim.format(rightNow.getTime()); 
	    }
	    return email;
	}
	
}

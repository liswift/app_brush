package com.eazy.brush.core.utils;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class HighCharts {

	public static Map<String, Object> weekArray(List<Map<String, Object>> data) {
		// 1.计算开始时间和结束时间（一周）
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, -6);// 得到前7
		String startTime = new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
		String endTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		Map<String, Object> result = new HashMap<String, Object>();

		int[] arr = new int[7];
		String[] cateArr = new String[7];// 初始化X轴的时间
		for (int i = 0; i < 7; i++) {
			Calendar c1 = Calendar.getInstance();
			c1.add(Calendar.DAY_OF_MONTH, -(6 - i));// 得到前7
			String showTime = new SimpleDateFormat("yyyy-MM-dd").format(c1.getTime());
			for (Map<String, Object> o : data) {
				String createTime = new SimpleDateFormat("yyyy-MM-dd").format(o.get("CREATE_DATE"));
				if (showTime.equals(createTime)) {
					arr[i]++;
				}
			}
			cateArr[i] = "'" + showTime + "'";
		}
		String xArray = Arrays.toString(arr);
		String categories = Arrays.toString(cateArr);

		result.put("subheading", startTime + " 至 " + endTime);
		result.put("xArray", xArray);
		result.put("categories", categories);
		// 计算y轴显示的最大值
		Arrays.sort(arr);
		Integer max = getMax(arr[arr.length - 1]);
		result.put("max", max);
		return result;
	}

	public static Map<String, Object> daysArray(List<Map<String, Object>> data) {
		Map<String, Object> result = new HashMap<String, Object>();
		int[] arr = new int[24];
		String[] cateArr = new String[] { "00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12",
				"13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23" };
		for (int i = 0; i < 24; i++) {
			for (Map<String, Object> o : data) {
				String create_time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(o.get("CREATE_DATE"))
						.substring(11, 13);
				if (cateArr[i].equals(create_time)) {
					arr[i]++;
				}
			}
			cateArr[i] = "'" + cateArr[i] + "'";
		}
		String xArray = Arrays.toString(arr);
		String categories = Arrays.toString(cateArr);
		result.put("subheading", DateUtils.getNowTime());// 副标题
		result.put("xArray", xArray);// y轴数据
		result.put("categories", categories);// x轴刻度
		// 计算y轴显示的最大值
		Arrays.sort(arr);
		Integer max = getMax(arr[arr.length - 1]);
		result.put("max", max);
		return result;
	}

	/**
	 * y轴显示的最大值
	 */
	private static Integer getMax(Integer max) {
		if (max.toString().length() == 1) {
			return 50;
		} else if (max.toString().length() == 2) {
			return (max / 10 + 1) * 10;
		} else if (max.toString().length() == 3) {
			return (max / 100 + 1) * 100;
		} else {
			return (max / 1000 + 1) * 1000;
		}
	}
}

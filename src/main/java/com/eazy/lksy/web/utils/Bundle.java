package com.eazy.lksy.web.utils;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;

public class Bundle {
	
	public static int convInt(String key) {
		return Integer.valueOf(key);
	}
	
	public static double convDouble(String key) {
		return Double.valueOf(key);
	}
	
	public static long convLong(String key) {
		return Long.valueOf(key);
	}
	
	public static float convFloat(String key) {
		return Float.valueOf(key);
	}
	
	public static String convStr(Object obj) {
		return Integer.valueOf(obj.toString()).toString();
	} 
	
	public static String convBigDecimalStr(String key) {
		return new BigDecimal(key).toString();
	}
	
	public static long convBigDecimalLong(String key) {
		return new BigDecimal(key).longValue();
	}
	
	public static int convBigDecimalInt(String key) {
		return new BigDecimal(key).intValue();
	}
	
	public static float convBigDecimalFloat(String key) {
		return new BigDecimal(key).floatValue();
	}
	
	public static double convBigDecimalDouble(String key) {
		return new BigDecimal(key).doubleValue();
	}
	
	public static String convUTF8(byte bytes[], String charsetName) {
		try {
			return new String(bytes, charsetName);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}
}

package com.eazy.brush.core.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * @date 2015/1/30
 * @author jzx
 * @desc json 操作工具类
 */
public class JsonKsy {
	
	static Map<String,JSONObject> map = Maps.newHashMap();
	
	public static void put(String key,Object value) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put(key, value);
		map.put(key, jsonObject);
	}
	
	public static String parseJSON(String json) {
		return JSONObject.toJSONString(json);
	}
	
	public static String converMapToJson(Object map) {
		return JSON.toJSONString(map);
	}
	
	// 2016/2/19 新添加
	public static Map<String,Object> converJsonToMap(String data) {
		return JsonToMap.toMap(JsonToMap.parseJson(data));
	}
	
	public static String get(String key) {
		JSONObject js = map.get(key);
		return js.getString(key);
	}
	
	public static String parseObj(String data,String param) {
		JSONObject jsonObject = JSONObject.parseObject(data);
		String result = jsonObject.getString(param); // 处理结果
		return result;
	}
	
	
	public static String [] parseArr(String data,String param) {
		JSONArray jsonArray = JSONArray.parseArray(data);
		List<String> lists = Lists.newArrayList();
		for(int i=0; i< jsonArray.size(); i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			lists.add(jsonObject.getString(param));
		}
		return StrKit.converStr(lists);
	}
	
	public static String [] parseArr(String data,String ... param) {
		JSONArray jsonArray = JSONArray.parseArray(data);
		List<String> lists = Lists.newArrayList();
		for(int i=0; i< jsonArray.size(); i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			for(int j =0; j< param.length; j++) {
				lists.add(jsonObject.getString(param[j]));	
			}
		}
		return StrKit.converStr(lists);
	}
	
	static class JsonToMap {
		
	    /** 
	     * 获取JsonObject 
	     */  
	    public static JsonObject parseJson(String json){  
	        JsonParser parser = new JsonParser();  
	        JsonObject jsonObj = parser.parse(json).getAsJsonObject();  
	        return jsonObj;  
	    }  
	    
		/**
		 * 将JSONObjec对象转换成Map-List集合
		 */
		public static Map<String, Object> toMap(JsonObject json) {
			Map<String, Object> map = new HashMap<String, Object>();
			Set<Entry<String, JsonElement>> entrySet = json.entrySet();
			for (Iterator<Entry<String, JsonElement>> iter = entrySet.iterator(); iter.hasNext();) {
				Entry<String, JsonElement> entry = iter.next();
				String key = entry.getKey();
				Object value = entry.getValue();
				if (value instanceof JsonArray)
					map.put((String) key, toList((JsonArray) value));
				else if (value instanceof JsonObject)
					map.put((String) key, toMap((JsonObject) value));
				else
					map.put((String) key, value);
			}
			return map;
		}

		/**
		 * 将JSONArray对象转换成List集合
		 */
		public static List<Object> toList(JsonArray json) {
			List<Object> list = new ArrayList<Object>();
			for (int i = 0; i < json.size(); i++) {
				Object value = json.get(i);
				if (value instanceof JsonArray) {
					list.add(toList((JsonArray) value));
				} else if (value instanceof JsonObject) {
					list.add(toMap((JsonObject) value));
				} else {
					list.add(value);
				}
			}
			return list;
		}
	}
}
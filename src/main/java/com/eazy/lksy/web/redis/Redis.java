package com.eazy.lksy.web.redis;

import java.io.IOException;
import java.util.Map;
import java.util.Set;

import com.eazy.lksy.web.utils.RedisUtil;

import redis.clients.jedis.Jedis;

public final class Redis {
   
    public static void put(String key,String value) {
    	put(key, (Object)value);
    }
    
    public static void put(String key,String value, int exprise) {
    	put(key, (Object)value);
    	put(key, exprise);
    }
    
    public static void put(String key,Object value) {
    	Jedis jedis = RedisUtil.getJedis();
    	try{
    		jedis.set(key, value + "");
    	} catch (Exception e) {
    		RedisUtil.returnBrokenResource(jedis);
    	} finally {
    		RedisUtil.returnResource(jedis);
    	}
    }
    
    public static void put(String key,Map<String,String> value) {
    	RedisUtil.getJedis().hmset(key, value);
    }

    public static void put(String key,int exprise) {
    	RedisUtil.getJedis().expire(key, exprise);
    }
    public static String get(String key) {
    	Jedis jedis = RedisUtil.getJedis();
    	try{
    		return jedis.get(key);
    	} catch (Exception e) {
    		RedisUtil.returnBrokenResource(jedis);
    	} finally {
    		RedisUtil.returnResource(jedis);
    	}
    	return null;
    } 
    
    public static Set<String> getKeys() throws IOException {
    	Jedis jedis = RedisUtil.getJedis();
    	return jedis.keys("*");
    }
    
    public static void remove(String key) {
    	Jedis jedis = RedisUtil.getJedis();
    	try{
    		jedis.del(key);
    	} catch (Exception e) {
    		RedisUtil.returnBrokenResource(jedis);
    	} finally {
    		RedisUtil.returnResource(jedis);
    	}
    }
    
    public static void removeAll() {
    	RedisUtil.getJedis().flushDB();
    }
    
    public static boolean exists(String key) {
    	Jedis jedis = RedisUtil.getJedis();
    	try{
    		return jedis.exists(key);
    	} catch (Exception e) {
    		RedisUtil.returnBrokenResource(jedis);
    	} finally {
    		RedisUtil.returnResource(jedis);
    	}
    	return false;
    }
    
}
package com.eazy.brush.cache;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.RedisZSetCommands;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.io.UnsupportedEncodingException;
import java.util.*;
import java.util.concurrent.TimeUnit;

@Service
public class CommonRedisCache {

    private static final Logger logger = LoggerFactory.getLogger(CommonRedisCache.class);
    private static final String CHARSET = "UTF-8";
    private static final int DEFAULT_SINGLE_EXPIRE_TIME = 3;

    public interface CacheNotFoundRedisCallback<T> {
        T get();
    }

    @Autowired
    RedisTemplate redisTemplate;

    public RedisTemplate getRedisTemplate() {
        return redisTemplate;
    }

    public void setRedisTemplate(RedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
    }


    public static final byte[] rawString(String value) {
        try {
            return value.getBytes(CHARSET);
        } catch (Exception e) {
            logger.error("## error.", e);
        }
        return null;
    }

    public static final String newString(byte[] value) {
        try {
            return new String(value, CHARSET);
        } catch (Exception e) {
            logger.error("## error.", e);
        }
        return null;
    }


    /**
     * 锁在给定的等待时间内空闲，则获取锁成功 返回true， 否则返回false
     */
    public boolean tryLock(String key, String value, long timeout, long seconds) {

        try {
            long nano = System.nanoTime();
            do {
                logger.debug("## try lock key: " + key);
                Boolean lock = setNX(key, value);// 获取锁
                if (lock == true) {
                    seconds = seconds > 0 ? seconds : DEFAULT_SINGLE_EXPIRE_TIME;
                    expire(key, seconds);// 设置过期时间
                    logger.debug("## get lock, key: " + key + " , expire in " + seconds + " seconds.");
                    return Boolean.TRUE;
                } else { // 存在锁
                    if (logger.isDebugEnabled()) {
                        String desc = get(key);
                        logger.debug("## key: " + key + " locked by another business：" + desc);
                    }
                }
                if (timeout == 0) {
                    break;
                }
                TimeUnit.MILLISECONDS.sleep(300);
            } while ((System.nanoTime() - nano) < TimeUnit.MILLISECONDS.toNanos(timeout));
            return Boolean.FALSE;
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return Boolean.FALSE;
    }

    //setNX
    public Boolean setNX(final String key, final String value) {
        return (Boolean) redisTemplate.execute(new RedisCallback<Boolean>() {
            public Boolean doInRedis(RedisConnection connection)
                    throws DataAccessException {
                return connection.setNX(rawString(key), rawString(value));
            }
        });
    }

    //hMGet
    public List<String> hMGet(final String cacheKey, final String key) {
        return (List<String>) redisTemplate.execute(new RedisCallback<List<String>>() {
            public List<String> doInRedis(RedisConnection connection)
                    throws DataAccessException {
                List<byte[]> temp = connection.hMGet(rawString(cacheKey), rawString(key));
                List<String> result = Lists.newArrayList();
                for (byte[] item : temp) {
                    result.add(newString(item));
                }
                return result;
            }
        });
    }

    //hMGet
    public void hMGet(final String cacheKey, final Map<String, String> valuesMap) {
        redisTemplate.execute(new RedisCallback<Void>() {
            public Void doInRedis(RedisConnection connection)
                    throws DataAccessException {
                Map<byte[], byte[]> hashes = Maps.newHashMap();
                Iterator<Map.Entry<String, String>> it = valuesMap.entrySet().iterator();
                while (it.hasNext()) {
                    Map.Entry<String, String> entry = it.next();
                    hashes.put(rawString(entry.getKey()), rawString(entry.getValue()));
                }
                connection.hMSet(rawString(cacheKey), hashes);
                return null;
            }
        });
    }


    // expire
    public Boolean expire(final String key, final long seconds) {
        return (Boolean) redisTemplate.execute(new RedisCallback<Boolean>() {
            public Boolean doInRedis(RedisConnection connection)
                    throws DataAccessException {
                return connection.expire(rawString(key), seconds);
            }
        });
    }

    //
    private boolean set(final byte[] key, final byte[] value,
                        final long seconds) {
        return (Boolean) redisTemplate.execute(new RedisCallback<Boolean>() {
            public Boolean doInRedis(RedisConnection connection)
                    throws DataAccessException {
                boolean rs = true;
                connection.set(key, value);
                if (seconds > 0) {
                    rs = connection.expire(key, seconds);
                }
                return rs;
            }
        });
    }

    //
    private boolean set(final byte[] key, final byte[] value,
                        final Date expireDate) {
        return (Boolean) redisTemplate.execute(new RedisCallback<Boolean>() {
            public Boolean doInRedis(RedisConnection connection)
                    throws DataAccessException {
                boolean rs = true;
                connection.set(key, value);
                if (expireDate != null) {
                    rs = connection.expireAt(key, expireDate.getTime());
                }
                return rs;
            }
        });
    }

    //
    public boolean set(String key, String value, long activeTime) {
        return this.set(rawString(key), rawString(value), activeTime);
    }

    //
    public boolean set(String key, String value, Date expireDate) {
        return this.set(rawString(key), rawString(value), expireDate);
    }

    //
    public boolean set(String key, String value) {
        return this.set(key, value, 0L);
    }

    //
    public boolean set(byte[] key, byte[] value) {
        return this.set(key, value, 0L);
    }

    //
    public String get(final String key) {
        return (String) redisTemplate.execute(new RedisCallback<String>() {
            public String doInRedis(RedisConnection connection)
                    throws DataAccessException {
                try {
                    byte[] value = connection.get(rawString(key));
                    return value == null ? "" : new String(value, CHARSET);
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                return "";
            }
        });
    }

    //
    public <T> T getObjectCache(String cacheKey, Class<T> valueType, long expireSeconds, CacheNotFoundRedisCallback<T> cacheCallback) {

        if (StringUtils.isEmpty(cacheKey)) {
            return null;
        }

        String value = this.get(cacheKey);

        T objectValue = null;
        if (StringUtils.isNotBlank(value)) {
            objectValue = JSON.parseObject(value, valueType);
            return objectValue;
        }

        objectValue = cacheCallback.get();
        if (objectValue != null) {
            setObjectCache(cacheKey, objectValue, expireSeconds);
            return objectValue;
        }

        return null;
    }

    public <T> void setObjectCache(String cacheKey, T cacheValue, long expireSeconds) {
        if (StringUtils.isBlank(cacheKey) || cacheValue == null) {
            return;
        }
        String value = JSON.toJSONString(cacheValue);
        if (StringUtils.isNotBlank(value) && StringUtils.length(value) > 2) {
            set(cacheKey, value, expireSeconds);
        }
    }

    // getInt
    public int getInt(final String key) {
        return getInt(key, 0);
    }

    // getInt
    public int getInt(final String key, int defaultValue) {
        String value = get(key);
        return StringUtils.isNotBlank(value) ? NumberUtils.toInt(value, defaultValue) : defaultValue;
    }

    // getLong
    public long getLong(final String key) {
        return getLong(key, 0);
    }

    // getLong
    public long getLong(final String key, long defaultValue) {
        String value = get(key);
        return StringUtils.isNotBlank(value) ? NumberUtils.toLong(value, defaultValue) : defaultValue;
    }

    // getDouble
    public double getDouble(final String key) {
        return getDouble(key, 0);
    }

    // getDouble
    public double getDouble(final String key, double defaultValue) {
        String value = get(key);
        return StringUtils.isNotBlank(value) ? NumberUtils.toDouble(value, defaultValue) : defaultValue;
    }

    // getBoolean
    public Boolean getBoolean(final String key, Boolean defaultValue) {
        String value = get(key);
        if (StringUtils.isNotBlank(value)) {
            if ("true".equals(value)) {
                return true;
            } else if ("false".equals(value)) {
                return false;
            }
        }

        return defaultValue;
    }

    //
    public Set<String> matchKeys(String pattern) {
        return redisTemplate.keys(pattern);

    }

    // 判断某个键是否存在
    public boolean exists(final String key) {
        return (Boolean) redisTemplate.execute(new RedisCallback<Boolean>() {
            public Boolean doInRedis(RedisConnection connection)
                    throws DataAccessException {
                return connection.exists(rawString(key));
            }
        });
    }

    public boolean flushDB() {
        return (Boolean) redisTemplate.execute(new RedisCallback<Boolean>() {
            public Boolean doInRedis(RedisConnection connection)
                    throws DataAccessException {
                connection.flushDb();
                return true;
            }
        });
    }

    // 清理所有集合键
    public long delete(final String... keys) {
        return (Long) redisTemplate.execute(new RedisCallback<Long>() {
            public Long doInRedis(RedisConnection connection)
                    throws DataAccessException {
                long result = 0;
                for (String key : keys) {
                    result = connection.del(rawString(key));
                }
                return result;
            }
        });
    }

    public Long incr(final String key) {
        return (Long) redisTemplate.execute(new RedisCallback<Long>() {
            public Long doInRedis(RedisConnection connection)
                    throws DataAccessException {
                return connection.incr(rawString(key));
            }
        });
    }

    public Long incrBy(final String key, final long amount) {
        return (Long) redisTemplate.execute(new RedisCallback<Long>() {
            public Long doInRedis(RedisConnection connection)
                    throws DataAccessException {
                return connection.incrBy(rawString(key), amount);
            }
        });
    }

    public Double incrBy(final String key, final double amount) {
        return (Double) redisTemplate.execute(new RedisCallback<Double>() {
            public Double doInRedis(RedisConnection connection)
                    throws DataAccessException {
                return connection.incrBy(rawString(key), amount);
            }
        });
    }

    public Long decr(final String key) {
        return (Long) redisTemplate.execute(new RedisCallback<Long>() {
            public Long doInRedis(RedisConnection connection)
                    throws DataAccessException {
                return connection.decr(rawString(key));
            }
        });
    }

    public boolean setHash(final String name, final String key, final String value) {
        return (Boolean) redisTemplate.execute(new RedisCallback<Boolean>() {
            public Boolean doInRedis(RedisConnection connection)
                    throws DataAccessException {
                return connection.hSet(rawString(name), rawString(key), rawString(value));
            }
        });
    }

    public String getHash(final String name, final String key) {
        final byte[] rawName = rawString(name);
        final byte[] rawValue = rawString(key);
        return (String) redisTemplate.execute(new RedisCallback<String>() {
            public String doInRedis(RedisConnection connection)
                    throws DataAccessException {
                try {
                    byte[] value = connection.hGet(rawName, rawValue);
                    return value == null ? "" : new String(value, CHARSET);
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                    return "";
                }
            }
        });
    }

    public Long delHash(final String name, final String key) {
        final byte[] rawName = rawString(name);
        final byte[] rawValue = rawString(key);
        return (Long) redisTemplate.execute(new RedisCallback<Long>() {
            public Long doInRedis(RedisConnection connection)
                    throws DataAccessException {
                Long value = connection.hDel(rawName, rawValue);
                return value;
            }
        });
    }

    public Long hashLen(final String name) {
        final byte[] rawName = rawString(name);
        return (Long) redisTemplate.execute(new RedisCallback<Long>() {
            public Long doInRedis(RedisConnection connection)
                    throws DataAccessException {
                return connection.hLen(rawName);
            }
        });
    }

    public Set<byte[]> getHashKeys(final String name) {
        final byte[] rawName = rawString(name);
        return (Set<byte[]>) redisTemplate.execute(new RedisCallback<Set<byte[]>>() {
            public Set<byte[]> doInRedis(RedisConnection connection)
                    throws DataAccessException {
                return connection.hKeys(rawName);
            }
        });
    }

    public List<String> mGet(final List<String> keys) {
        return (List<String>) this.redisTemplate.execute(new RedisCallback<List<String>>() {
            @Override
            public List<String> doInRedis(RedisConnection connection) throws DataAccessException {

                byte[][] byteKeys = new byte[keys.size()][];
                for (int i = 0; i < keys.size(); i++) {
                    String key = keys.get(i);
                    byteKeys[i] = rawString(key);
                }
                List<byte[]> values = connection.mGet(byteKeys);
                List<String> result = Lists.newArrayListWithExpectedSize(values.size());
                for (byte[] value : values) {
                    result.add(newString(value));
                }
                return result;
            }
        });
    }

    public void mSet(final Map<String, String> keyValues) {
        this.redisTemplate.execute(new RedisCallback<Void>() {
            @Override
            public Void doInRedis(RedisConnection connection) throws DataAccessException {
                Map<byte[], byte[]> tupes = Maps.newHashMap();
                for (Map.Entry<String, String> entry : keyValues.entrySet()) {
                    byte[] key = rawString(entry.getKey());
                    byte[] value = rawString(entry.getValue());
                    tupes.put(key, value);
                }

                connection.mSet(tupes);
                return null;
            }
        });
    }

    // zset add
    public Boolean zAdd(final String key, final double score, final String value) {
        if (StringUtils.isBlank(key) || StringUtils.isBlank(value)) {
            return false;
        }
        final byte[] rawKey = rawString(key);
        final byte[] rawValue = rawString(value);
        return (Boolean) this.redisTemplate.execute(new RedisCallback<Boolean>() {
            @Override
            public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
                return connection.zAdd(rawKey, score, rawValue);
            }
        });
    }

    // zset incrby
    public Double zIncrby(final String key, final double increment, final String memberValue) {
        if (StringUtils.isBlank(key) || StringUtils.isBlank(memberValue)) {
            return .0;
        }

        final byte[] rawKey = rawString(key);
        final byte[] rawValue = rawString(memberValue);
        return (Double) this.redisTemplate.execute(new RedisCallback() {
            @Override
            public Double doInRedis(RedisConnection redisConnection) throws DataAccessException {
                return redisConnection.zIncrBy(rawKey, increment, rawValue);
            }
        });
    }

    //zset remove
    public Boolean zRem(final String key, final String value) {
        if (StringUtils.isBlank(key) || StringUtils.isBlank(value)) {
            return false;
        }
        final byte[] rawKey = rawString(key);
        final byte[] rawValue = rawString(value);
        return (Boolean) this.redisTemplate.execute(new RedisCallback<Boolean>() {
            @Override
            public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
                Long result = connection.zRem(rawKey, rawValue);
                return result != null;
            }
        });
    }

    // hash incrby
    public Double hIncrby(final String key, final String field, final double increment) {
        if (StringUtils.isBlank(key) || StringUtils.isBlank(field)) {
            return .0;
        }
        final byte[] rawKey = rawString(key);
        final byte[] rawValue = rawString(field);
        return (Double) this.redisTemplate.execute(new RedisCallback() {
            @Override
            public Double doInRedis(RedisConnection redisConnection) throws DataAccessException {
                return redisConnection.hIncrBy(rawKey, rawValue, increment);
            }
        });
    }

    // zset get with range order by score asc
    public Set<RedisZSetCommands.Tuple> zRangeByScoreWithScores(final String key, final double minScore, final double maxScore, final long offset, final long limit) {

        if (StringUtils.isBlank(key)) {
            return Collections.emptySet();
        }
        final byte[] rawKey = rawString(key);
        return (Set<RedisZSetCommands.Tuple>) this.redisTemplate.execute(new RedisCallback<Set<RedisZSetCommands.Tuple>>() {
            @Override
            public Set<RedisZSetCommands.Tuple> doInRedis(RedisConnection connection) throws DataAccessException {
                return connection.zRangeByScoreWithScores(rawKey, minScore, maxScore, offset, limit);
            }
        });
    }


    // zset get with range order by score desc
    public Set<RedisZSetCommands.Tuple> zRevRangeByScoreWithScores(final String key, final double maxScore, final double minScore, final long offset, final long limit) {

        if (StringUtils.isBlank(key)) {
            return Collections.emptySet();
        }
        final byte[] rawKey = rawString(key);
        return (Set<RedisZSetCommands.Tuple>) this.redisTemplate.execute(new RedisCallback<Set<RedisZSetCommands.Tuple>>() {
            @Override
            public Set<RedisZSetCommands.Tuple> doInRedis(RedisConnection connection) throws DataAccessException {
                return connection.zRevRangeByScoreWithScores(rawKey, minScore, maxScore, offset, limit);
            }
        });
    }

    // zset get with range order desc
    public Set<RedisZSetCommands.Tuple> zRevRangeWithScores(final String key, final long offset, final long limit) {

        if (StringUtils.isBlank(key)) {
            return Collections.emptySet();
        }
        final byte[] rawKey = rawString(key);
        return (Set<RedisZSetCommands.Tuple>) this.redisTemplate.execute(new RedisCallback<Set<RedisZSetCommands.Tuple>>() {
            @Override
            public Set<RedisZSetCommands.Tuple> doInRedis(RedisConnection connection) throws DataAccessException {
                return connection.zRevRangeWithScores(rawKey, offset, limit);
            }
        });
    }

    // zset get with range order as long list desc
    public List<Long> zRevRangeWithScoresAsLongList(final String key, final long start, final long end) {
        if (StringUtils.isBlank(key)) {
            return Collections.emptyList();
        }
        final byte[] rawKey = rawString(key);
        Set<RedisZSetCommands.Tuple> tuples = (Set<RedisZSetCommands.Tuple>) this.redisTemplate.execute(new RedisCallback<Set<RedisZSetCommands.Tuple>>() {
            @Override
            public Set<RedisZSetCommands.Tuple> doInRedis(RedisConnection connection) throws DataAccessException {
                return connection.zRevRangeWithScores(rawKey, start, end);
            }
        });

        Iterator<RedisZSetCommands.Tuple> iterator = tuples.iterator();
        List<Long> result = new ArrayList<Long>();
        while (iterator.hasNext()) {
            byte[] value = iterator.next().getValue();
            result.add(Long.parseLong(newString(value)));
        }
        return result;
    }

    // zset count
    public Long zCard(final String key) {
        if (StringUtils.isBlank(key)) {
            return 0l;
        }
        final byte[] rawKey = rawString(key);
        return (Long) this.redisTemplate.execute(new RedisCallback<Long>() {
            @Override
            public Long doInRedis(RedisConnection connection) throws DataAccessException {
                Long result = connection.zCard(rawKey);
                return (result == null) ? 0l : result;
            }
        });
    }

    // zset total count
    public long zCard(final String key, long defaultValue) {
        Long result = zCard(key);
        return result == null ? defaultValue : result;
    }

    // zscore
    public Double zScore(final String key, final String value) {
        if (StringUtils.isBlank(key)) {
            return null;
        }
        return (Double) this.redisTemplate.execute(new RedisCallback<Double>() {
            @Override
            public Double doInRedis(RedisConnection connection) throws DataAccessException {
                return connection.zScore(rawString(key), rawString(value));
            }
        });
    }

    // zrevrank
    public Long zRevRank(final String key, final String value) {
        if (StringUtils.isBlank(key)) {
            return null;
        }
        return (Long) this.redisTemplate.execute(new RedisCallback<Long>() {
            @Override
            public Long doInRedis(RedisConnection connection) throws DataAccessException {
                return connection.zRevRank(rawString(key), rawString(value));
            }
        });
    }

    // zrank
    public Long zRank(final String key, final String value) {
        if (StringUtils.isBlank(key)) {
            return null;
        }
        return (Long) this.redisTemplate.execute(new RedisCallback<Long>() {
            @Override
            public Long doInRedis(RedisConnection connection) throws DataAccessException {
                return connection.zRank(rawString(key), rawString(value));
            }
        });
    }

    // set zset is member
    public Boolean sIsMember(final String key, final String value) {
        if (StringUtils.isBlank(key)) {
            return false;
        }
        final byte[] rawKey = rawString(key);
        final byte[] rawValue = rawString(value);
        return (Boolean) this.redisTemplate.execute(new RedisCallback<Boolean>() {
            @Override
            public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
                return connection.sIsMember(rawKey, rawValue);
            }
        });
    }

    // set zset is members1
    public <T> Map<T, Boolean> sIsMembers(final String key, final Collection<T> values) {
        if (StringUtils.isBlank(key) || CollectionUtils.isEmpty(values)) {
            return Collections.emptyMap();
        }
        final byte[] rawKey = rawString(key);
        final Map<T, Boolean> result = Maps.newHashMap();
        this.redisTemplate.execute(new RedisCallback<Void>() {
            @Override
            public Void doInRedis(RedisConnection connection) throws DataAccessException {
                Boolean isExist = null;
                for (T value : values) {
                    byte[] rawValue = rawString(value + "");
                    isExist = connection.sIsMember(rawKey, rawValue);
                    result.put(value, isExist != null ? isExist : false);
                }
                return null;
            }
        });

        return result;
    }

    // set zset is members2
    public <T> Map<T, Boolean> sIsMembers(final Collection<T> keys, final String value) {
        if (CollectionUtils.isEmpty(keys) || StringUtils.isBlank(value)) {
            return Collections.emptyMap();
        }

        final byte[] rawValue = rawString(value);
        final Map<T, Boolean> result = Maps.newHashMap();
        this.redisTemplate.execute(new RedisCallback<Void>() {
            @Override
            public Void doInRedis(RedisConnection connection) throws DataAccessException {
                Boolean isExist = null;
                for (T key : keys) {
                    byte[] rawKey = rawString(key + "");
                    isExist = connection.sIsMember(rawKey, rawValue);
                    result.put(key, isExist != null ? isExist : false);
                }
                return null;
            }
        });

        return result;
    }

    // set add
    public Boolean sAdd(final String key, final String value) {
        if (StringUtils.isBlank(key) || StringUtils.isBlank(value)) {
            return false;
        }
        final byte[] rawKey = rawString(key);
        final byte[] rawValue = rawString(value);
        return (Boolean) this.redisTemplate.execute(new RedisCallback<Boolean>() {
            @Override
            public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
                Long result = connection.sAdd(rawKey, rawValue);
                return result != null;
            }
        });
    }

    //set remove
    public Boolean sRem(final String key, final String value) {
        if (StringUtils.isBlank(key) || StringUtils.isBlank(value)) {
            return false;
        }
        final byte[] rawKey = rawString(key);
        final byte[] rawValue = rawString(value);
        return (Boolean) this.redisTemplate.execute(new RedisCallback<Boolean>() {
            @Override
            public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
                Long result = connection.sRem(rawKey, rawValue);
                return result != null;
            }
        });
    }

    // set count
    public Long sCard(final String key) {
        if (StringUtils.isBlank(key)) {
            return 0l;
        }
        final byte[] rawKey = rawString(key);
        return (Long) this.redisTemplate.execute(new RedisCallback<Long>() {
            @Override
            public Long doInRedis(RedisConnection connection) throws DataAccessException {
                Long result = connection.sCard(rawKey);
                return (result == null) ? 0l : result;
            }
        });
    }

    // set count1
    public <T> Map<T, Long> sCard(final Collection<T> keys) {
        if (CollectionUtils.isEmpty(keys)) {
            return Collections.emptyMap();
        }

        final Map<T, Long> result = Maps.newHashMap();
        this.redisTemplate.execute(new RedisCallback<Void>() {
            @Override
            public Void doInRedis(RedisConnection connection) throws DataAccessException {
                for (T key : keys) {
                    byte[] rawKey = rawString(key + "");
                    Long count = connection.sCard(rawKey);
                    result.put(key, count);
                }
                return null;
            }
        });

        return result;
    }

    // llen
    public Long lLen(final String key) {
        return (Long) this.redisTemplate.execute(new RedisCallback<Long>() {
            @Override
            public Long doInRedis(RedisConnection connection) throws DataAccessException {
                try {
                    return connection.lLen(rawString(key));
                } catch (Exception e) {
                    logger.error(e.getMessage(), e);
                    return null;
                }
            }
        });
    }

    // lPush
    public void lPush(final String key, final String value) {
        this.redisTemplate.execute(new RedisCallback<Long>() {
            @Override
            public Long doInRedis(RedisConnection connection) throws DataAccessException {
                try {
                    return connection.lPush(rawString(key), rawString(value));
                } catch (Exception e) {
                    logger.error(e.getMessage(), e);
                    return null;
                }
            }
        });
    }


    // bRPop
    public List<String> bRPop(final int popWait, final String key) {
        return (List<String>) this.redisTemplate.execute(new RedisCallback<List<String>>() {
            @Override
            public List<String> doInRedis(RedisConnection connection) throws DataAccessException {
                List<byte[]> temp = null;
                try {
                    temp = connection.bRPop(popWait, rawString(key));
                    List<String> result = Lists.newArrayList();
                    if (!CollectionUtils.isEmpty(temp)) {
                        for (byte[] b : temp) {
                            result.add(newString(b));
                        }
                    }
                    return result;
                } catch (Exception e) {
                    logger.error("## error.", e);
                }

                return null;
            }
        });
    }

    // rPop
    public String rPop(final String key) {
        return (String) this.redisTemplate.execute(new RedisCallback<String>() {
            @Override
            public String doInRedis(RedisConnection connection) throws DataAccessException {
                try {
                    byte[] temp = connection.rPop(rawString(key));
                    if (ArrayUtils.isNotEmpty(temp)) {
                        return newString(temp);
                    }
                } catch (Exception e) {
                    logger.error("## error.", e);
                }

                return null;
            }
        });
    }

    // executePipelined
    public List<Object> executePipelined(final RedisCallback<?> action) {
        return this.redisTemplate.executePipelined(action);
    }

}

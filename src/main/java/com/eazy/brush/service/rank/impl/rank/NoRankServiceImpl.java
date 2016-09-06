package com.eazy.brush.service.rank.impl.rank;

import com.eazy.brush.cache.CommonRedisCache;
import com.eazy.brush.core.enums.NoRankType;
import com.eazy.brush.core.enums.PersistRedisKey;
import com.eazy.brush.service.rank.NoRankService;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Collections;
import java.util.Map;

@Service
public class NoRankServiceImpl implements NoRankService {

    @Autowired
    private CommonRedisCache redisCache;

    // ¹¹½¨cacheKey
    private <S> String buildKey(NoRankType nrt, S subId) {
        return PersistRedisKey.NoRankSetByObjectKey.of(nrt.build(subId));
    }

    @Override
    public <S, I> void addToSet(NoRankType nrt, S subId, I itemId) {
        redisCache.sAdd(buildKey(nrt, subId), itemId + "");
    }

    @Override
    public <S, I> void addToSet(NoRankType nrt, S subId, final Collection<I> itemIds) {
        final byte[] rawKey = redisCache.rawString(buildKey(nrt, subId));
        redisCache.getRedisTemplate().execute(new RedisCallback<Void>() {

            @Override
            public Void doInRedis(RedisConnection connection) throws DataAccessException {
                for (I itemId : itemIds) {
                    byte[] rawValue = redisCache.rawString(itemId + "");
                    connection.sAdd(rawKey, rawValue);
                }

                return null;
            }
        });
    }

    @Override
    public <S, I> void remFromSet(NoRankType nrt, S subId, I itemId) {
        redisCache.sRem(buildKey(nrt, subId), itemId + "");
    }

    @Override
    public <S, I> void remFromSet(NoRankType nrt, S subId, final Collection<I> itemIds) {
        final byte[] rawKey = redisCache.rawString(buildKey(nrt, subId));
        redisCache.getRedisTemplate().execute(new RedisCallback<Void>() {

            @Override
            public Void doInRedis(RedisConnection connection) throws DataAccessException {
                for (I itemId : itemIds) {
                    byte[] rawValue = redisCache.rawString(itemId + "");
                    connection.sRem(rawKey, rawValue);
                }

                return null;
            }
        });
    }

    @Override
    public <S, I> Map<S, Boolean> isExist(final I itemId, final Collection<S> subIds, final NoRankType nrt) {
        final Map<S, Boolean> result = Maps.newHashMap();
        final byte[] rawValue = redisCache.rawString(itemId + "");
        redisCache.getRedisTemplate().execute(new RedisCallback<Void>() {
            @Override
            public Void doInRedis(RedisConnection connection) throws DataAccessException {
                Boolean isExist = null;
                for (S subId : subIds) {
                    byte[] rawKey = redisCache.rawString(buildKey(nrt, subId));
                    isExist = connection.sIsMember(rawKey, rawValue);
                    result.put(subId, isExist != null ? isExist : false);
                }
                return null;
            }
        });

        return result;
    }

    @Override
    public <S, I> Boolean isExist(I itemId, S subId, NoRankType nrt) {
        return isExist(itemId, Collections.singleton(subId), nrt).get(subId);
    }

    @Override
    public <S, I> Map<I, Boolean> isExist(S subId, NoRankType nrt, Collection<I> itemIds) {
        return redisCache.sIsMembers(buildKey(nrt, subId), itemIds);
    }

    @Override
    public <S> Map<S, Integer> getCounts(final Collection<S> subIds, final NoRankType nrt) {
        final Map<S, Integer> result = Maps.newHashMap();
        redisCache.getRedisTemplate().execute(new RedisCallback<Void>() {

            @Override
            public Void doInRedis(RedisConnection connection) throws DataAccessException {
                for (S subId : subIds) {
                    Long count = connection.sCard(redisCache.rawString(buildKey(nrt, subId)));
                    result.put(subId, count != null ? count.intValue() : 0);
                }

                return null;
            }
        });

        return result;
    }

    @Override
    public <S> int getCount(S subId, NoRankType nrt) {
        Integer r = getCounts(Collections.singleton(subId), nrt).get(subId);
        if (r == null) {
            r = 0;
        }
        return r;
    }

    @Override
    public <S> void delete(NoRankType nrt, S subId) {
        redisCache.delete(buildKey(nrt, subId));
    }
}

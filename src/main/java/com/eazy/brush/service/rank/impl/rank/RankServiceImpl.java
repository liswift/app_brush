package com.eazy.brush.service.rank.impl.rank;

import com.eazy.brush.cache.CommonRedisCache;
import com.eazy.brush.cache.ResultView;
import com.eazy.brush.core.enums.PersistRedisKey;
import com.eazy.brush.core.enums.RankType;
import com.eazy.brush.service.rank.RankService;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.RedisZSetCommands;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class RankServiceImpl implements RankService {

    private final Logger logger = LoggerFactory.getLogger(RankServiceImpl.class);

    @Autowired
    private CommonRedisCache redisCache;

    // 构建key
    private <S> String buildKey(RankType rt, S subId) {
        return PersistRedisKey.RankListByObjectKey.of(rt.build(subId));
    }

    @Override
    public <S, I> Double incrby(RankType rt, S subId, I itemId, double amount) {
        return redisCache.zIncrby(buildKey(rt, subId), amount, itemId + "");
    }

    @Override
    public <S, I> void addToList(RankType rt, S subId, I itemId, double score) {
        redisCache.zAdd(buildKey(rt, subId), score, itemId + "");
    }

    @Override
    public <S, I> void remFromList(RankType rt, S subId, I itemId) {
        redisCache.zRem(buildKey(rt, subId), itemId + "");
    }

    @Override
    public <S, I> Double getItemScoreDouble(RankType rt, S subId, I itemId) {
        Double temp = redisCache.zScore(buildKey(rt, subId), itemId + "");
        return temp != null ? temp : 0;
    }

    @Override
    public <S, I> Long getItemScoreLong(RankType rt, S subId, I itemId) {
        Double temp = getItemScoreDouble(rt, subId, itemId);
        return temp.longValue();
    }

    @Override
    public <S, I> Long getItemRank(RankType rt, S subId, I itemId) {
        Long result = redisCache.zRevRank(buildKey(rt, subId), itemId + "");
        return result != null ? result + 1 : null;
    }

    @Override
    public <S> Set<RedisZSetCommands.Tuple> getByCursorAndScoreDesc(double maxScore, double minScore, long offset, long limit, RankType rt, S subId) {
        return redisCache.zRevRangeByScoreWithScores(PersistRedisKey.RankListByObjectKey.of(rt.build(subId)), maxScore, minScore, offset, limit);
    }

    @Override
    public <S> Set<RedisZSetCommands.Tuple> getByPageScoreDesc(long offset, long limit, RankType rt, S subId) {
        return redisCache.zRevRangeWithScores(PersistRedisKey.RankListByObjectKey.of(rt.build(subId)), offset, limit);
    }

    // 此处返回的列表是string类型，上层根据传入item类型自行转换
    @Override
    public <S> ResultView<String, Double> getItemsByCursorDouble(Double cursor, int limit, RankType rt, S subId) {
        Set<RedisZSetCommands.Tuple> tuples = null;
        if (cursor == null) {
            tuples = getByCursorAndScoreDesc(Double.MAX_VALUE, 0.0, 0, limit + 1, rt, subId);
        } else {
            tuples = getByCursorAndScoreDesc(cursor, 0.0, 0, limit + 1, rt, subId);
        }
        List<String> items = Lists.newArrayList();
        Double nextCursor = null;
        if (CollectionUtils.isNotEmpty(tuples)) {
            for (RedisZSetCommands.Tuple tuple : tuples) {
                if (items.size() == limit) {
                    nextCursor = tuple.getScore();
                    break;
                } else {
                    try {
                        items.add(redisCache.newString(tuple.getValue()));
                    } catch (Throwable e) {
                        logger.error("## error.", e);
                    }
                }
            }
        }

        return new ResultView<String, Double>(items, nextCursor);
    }

    @Override
    public <S> ResultView<String, Long> getItemsByCursorLong(Long cursor, int limit, RankType rt, S subId) {

        Set<RedisZSetCommands.Tuple> tuples = null;
        if (cursor == null) {
            tuples = getByCursorAndScoreDesc(Double.MAX_VALUE, 0l, 0, limit + 1, rt, subId);
        } else {
            tuples = getByCursorAndScoreDesc(cursor, 0l, 0, limit + 1, rt, subId);
        }
        List<String> items = Lists.newArrayList();
        Long nextCursor = null;
        if (CollectionUtils.isNotEmpty(tuples)) {
            for (RedisZSetCommands.Tuple tuple : tuples) {
                if (items.size() == limit) {
                    nextCursor = tuple.getScore().longValue();
                    break;
                } else {
                    try {
                        items.add(redisCache.newString(tuple.getValue()));
                    } catch (Throwable e) {
                        logger.error("## error.", e);
                    }
                }
            }
        }

        return new ResultView<String, Long>(items, nextCursor);
    }

    @Override
    public <S> ResultView<RedisZSetCommands.Tuple, Double> getItemTuplesByCursorDouble(Double cursor, int limit, RankType rt, S subId) {
        Set<RedisZSetCommands.Tuple> tuples = null;
        if (cursor == null) {
            tuples = getByCursorAndScoreDesc(Double.MAX_VALUE, 0.0, 0, limit + 1, rt, subId);
        } else {
            tuples = getByCursorAndScoreDesc(cursor, 0.0, 0, limit + 1, rt, subId);
        }
        List<RedisZSetCommands.Tuple> items = Lists.newArrayList();
        Double nextCursor = null;
        if (CollectionUtils.isNotEmpty(tuples)) {
            for (RedisZSetCommands.Tuple tuple : tuples) {
                if (items.size() == limit) {
                    nextCursor = tuple.getScore();
                    break;
                } else {
                    items.add(tuple);
                }
            }
        }

        return new ResultView<RedisZSetCommands.Tuple, Double>(items, nextCursor);
    }

    @Override
    public <S> ResultView<RedisZSetCommands.Tuple, Long> getItemTuplesByCursorLong(Long cursor, int limit, RankType rt, S subId) {
        Set<RedisZSetCommands.Tuple> tuples = null;
        if (cursor == null) {
            tuples = getByCursorAndScoreDesc(Long.MAX_VALUE, 0l, 0, limit + 1, rt, subId);
        } else {
            tuples = getByCursorAndScoreDesc(cursor, 0l, 0, limit + 1, rt, subId);
        }
        List<RedisZSetCommands.Tuple> items = Lists.newArrayList();
        Long nextCursor = null;
        if (CollectionUtils.isNotEmpty(tuples)) {
            for (RedisZSetCommands.Tuple tuple : tuples) {
                if (items.size() == limit) {
                    nextCursor = tuple.getScore().longValue();
                    break;
                } else {
                    items.add(tuple);
                }
            }
        }

        return new ResultView<RedisZSetCommands.Tuple, Long>(items, nextCursor);
    }

    @Override
    public <S> ResultView<RedisZSetCommands.Tuple, Integer> getItemTuplesByPage(int offset, int limit, RankType rt, S subId) {
        Set<RedisZSetCommands.Tuple> tuples = getByCursorAndScoreDesc(Double.MAX_VALUE, Integer.MAX_VALUE, offset, limit + 1, rt, subId);
        List<RedisZSetCommands.Tuple> items = Lists.newArrayList();
        Integer nextCursor = null;
        if (CollectionUtils.isNotEmpty(tuples)) {
            for (RedisZSetCommands.Tuple tuple : tuples) {
                if (items.size() == limit) {
                    nextCursor = (offset + limit);
                    break;
                } else {
                    items.add(tuple);
                }
            }
        }

        return new ResultView<RedisZSetCommands.Tuple, Integer>(items, nextCursor);
    }

    @Override
    public <S, I> Map<S, Boolean> isExist(final I itemId, final Collection<S> subIds, final RankType rt) {
        final Map<S, Boolean> result = Maps.newHashMap();
        final byte[] rawValue = redisCache.rawString(itemId + "");
        redisCache.getRedisTemplate().execute(new RedisCallback<Void>() {

            @Override
            public Void doInRedis(RedisConnection connection) throws DataAccessException {
                Boolean isExist = null;
                for (S subId : subIds) {
                    isExist = (connection.zScore(redisCache.rawString(buildKey(rt, subId)), rawValue) != null);
                    result.put(subId, isExist);
                }

                return null;
            }
        });

        return result;
    }

    @Override
    public <S, I> Boolean isExist(I itemId, S subId, RankType rt) {
        return isExist(itemId, Collections.singleton(subId), rt).get(subId);
    }

    @Override
    public <S> Map<S, Integer> getCounts(final Collection<S> subIds, final RankType rt) {
        final Map<S, Integer> result = Maps.newHashMap();
        redisCache.getRedisTemplate().execute(new RedisCallback<Void>() {

            @Override
            public Void doInRedis(RedisConnection connection) throws DataAccessException {
                for (S subId : subIds) {
                    Long count = connection.zCard(redisCache.rawString(buildKey(rt, subId)));
                    result.put(subId, count != null ? count.intValue() : 0);
                }

                return null;
            }
        });

        return result;
    }

    @Override
    public <S> int getCount(S subId, RankType rt) {
        Integer r = getCounts(Collections.singleton(subId), rt).get(subId);
        if (r == null) {
            r = 0;
        }
        return r;
    }

    @Override
    public <S> void delete(RankType rt, S subId) {
        redisCache.delete(buildKey(rt, subId));
    }

    @Override
    public <S> void expire(RankType rt, S subId, long seconds) {
        redisCache.expire(buildKey(rt, subId), seconds);
    }
}

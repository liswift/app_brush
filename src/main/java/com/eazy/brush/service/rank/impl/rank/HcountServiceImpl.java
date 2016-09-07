package com.eazy.brush.service.rank.impl.rank;

import com.eazy.brush.cache.CommonRedisCache;
import com.eazy.brush.core.enums.CountType;
import com.eazy.brush.core.enums.PersistRedisKey;
import com.eazy.brush.service.rank.HcountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * Hash count Service impl
 *
 * @author feng.liu
 * @date 2016/9/6 15:43
 */
@Service
public class HcountServiceImpl implements HcountService {

    @Autowired
    private CommonRedisCache redisCache;

    private <S> String buildKey(CountType ct, S subId) {
        return PersistRedisKey.HashtByObjectKey.of(ct.build(subId));
    }

    @Override
    public <S, I> Double incrBy(S subId, I itemId, CountType ct, double amount) {
        return redisCache.hIncrby(buildKey(ct, subId), itemId + "", amount);
    }

    @Override
    public <S, I> Double getCount(S subId, I itemId, CountType ct) {
        String value = redisCache.getHash(buildKey(ct, subId), itemId + "");
        if (StringUtils.isEmpty(value)) {
            return 0.0;
        }
        return Double.parseDouble(value);
    }

    @Override
    public <S, I> void remCount(S subId, I itemId, CountType ct) {
        redisCache.delHash(buildKey(ct, subId), itemId + "");
    }
}

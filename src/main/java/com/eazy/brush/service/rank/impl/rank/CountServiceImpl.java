package com.eazy.brush.service.rank.impl.rank;

import com.eazy.brush.cache.CommonRedisCache;
import com.eazy.brush.core.enums.CountType;
import com.eazy.brush.core.enums.PersistRedisKey;
import com.eazy.brush.service.rank.CountService;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CountServiceImpl implements CountService {

    @Autowired
    private CommonRedisCache redisCache;

    @Override
    public <S> Double incrBy(S subId, CountType ct, double amount) {
        Double result = redisCache.incrBy(PersistRedisKey.ObjectCountByObjectKey.of(ct.build(subId)), amount);
        return result != null ? result : 0;
    }

    @Override
    public <S> Double getCount(S subId, CountType ct) {
        String value = redisCache.get(PersistRedisKey.ObjectCountByObjectKey.of(ct.build(subId)));
        return StringUtils.isEmpty(value) ? 0 : NumberUtils.toDouble(value);
    }

    @Override
    public <S> void remCount(S subId, CountType ct) {
        redisCache.delete(PersistRedisKey.ObjectCountByObjectKey.of(ct.build(subId)));
    }
}

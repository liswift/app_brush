package com.eazy.brush.service.rank;

import com.eazy.brush.core.enums.CountType;

/**
 * Hash count Service
 *
 * @author feng.liu
 * @date 2016/9/6 15:41
 */
public interface HcountService {

    <S, I> Double incrBy(S subId, I itemId, CountType ct, double amount);

    <S, I> Double getCount(S subId, I itemId, CountType ct);

    <S, I> void remCount(S subId, I itemId, CountType ct);
}

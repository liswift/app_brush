package com.eazy.brush.service.rank;

import com.eazy.brush.core.enums.CountType;

public interface CountService {

    <S> Double incrBy(S subId, CountType ct, double amount);

    <S> Double getCount(S subId, CountType ct);

    <S> void remCount(S subId, CountType ct);


}

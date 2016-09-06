package com.eazy.brush.service.rank;

import com.eazy.brush.cache.ResultView;
import com.eazy.brush.core.enums.RankType;
import org.springframework.data.redis.connection.RedisZSetCommands;

import java.util.Collection;
import java.util.Map;
import java.util.Set;

public interface RankService {

    <S, I> Double incrby(RankType rt, S subId, I itemId, double amount);

    <S, I> void addToList(RankType rt, S subId, I itemId, double score);

    <S, I> void remFromList(RankType rt, S subId, I itemId);

    <S, I> Double getItemScoreDouble(RankType rt, S subId, I itemId);

    <S, I> Long getItemScoreLong(RankType rt, S subId, I itemId);

    <S, I> Long getItemRank(RankType rt, S subId, I itemId);

    <S> Set<RedisZSetCommands.Tuple> getByCursorAndScoreDesc(double maxScore, double minScore, long offset, long limit, RankType rt, S subId);

    <S> Set<RedisZSetCommands.Tuple> getByPageScoreDesc(long offset, long limit, RankType rt, S subId);

    <S> ResultView<String, Double> getItemsByCursorDouble(Double cursor, int limit, RankType rt, S subId);

    <S> ResultView<String, Long> getItemsByCursorLong(Long cursor, int limit, RankType rt, S subId);

    <S> ResultView<RedisZSetCommands.Tuple, Double> getItemTuplesByCursorDouble(Double cursor, int limit, RankType rt, S subId);

    <S> ResultView<RedisZSetCommands.Tuple, Long> getItemTuplesByCursorLong(Long cursor, int limit, RankType rt, S subId);

    <S> ResultView<RedisZSetCommands.Tuple, Integer> getItemTuplesByPage(int offset, int limit, RankType rt, S subId);

    <S, I> Map<S, Boolean> isExist(final I itemId, final Collection<S> subIds, final RankType rt);

    <S, I> Boolean isExist(I itemId, S subId, RankType rt);

    <S> Map<S, Integer> getCounts(final Collection<S> subIds, final RankType rt);

    <S> int getCount(S subId, RankType rt);

    <S> void delete(RankType rt, S subId);

    <S> void expire(RankType rt, S subId, long seconds);
}

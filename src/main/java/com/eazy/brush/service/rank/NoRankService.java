package com.eazy.brush.service.rank;

import com.eazy.brush.core.enums.NoRankType;

import java.util.Collection;
import java.util.Map;

public interface NoRankService {

    <S, I> void addToSet(NoRankType nrt, S subId, I itemId);

    <S, I> void addToSet(NoRankType nrt, S subId, Collection<I> itemIds);

    <S, I> void remFromSet(NoRankType nrt, S subId, I itemId);

    <S, I> void remFromSet(NoRankType nrt, S subId, Collection<I> itemIds);

    <S, I> Map<S, Boolean> isExist(final I itemId, final Collection<S> subIds, final NoRankType nrt);

    <S, I> Boolean isExist(I itemId, S subId, NoRankType nrt);

    <S, I> Map<I, Boolean> isExist(final S subId, final NoRankType nrt, final Collection<I> itemIds);

    <S> int getCount(S subId, NoRankType nrt);

    <S> Map<S, Integer> getCounts(Collection<S> subIds, NoRankType nrt);

    <S> void delete(NoRankType nrt, S subId);
}

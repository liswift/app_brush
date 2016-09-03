package com.eazy.brush.core.lottery;

import com.google.common.collect.Lists;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.List;

/**
 * 概率抽奖算法
 * author : liufeng
 * create time:2016/9/3 16:22
 */
public class LotteryUtil {

    /**
     * 抽奖
     *
     * @param awards 原始的概率列表，保证顺序和实际物品对应
     * @return 物品的索引
     */
    public static <T extends Award> T lottery(List<T> awards) {
        if (CollectionUtils.isEmpty(awards)) {
            throw new NullPointerException("awards can not be empty");
        }

        // 计算总概率，这样可以保证不一定总概率是1
        double sumRate = 0d;
        for (Award award : awards) {
            sumRate += award.getRate();
        }

        // 计算每个物品在总概率的基础下的概率情况
        List<Double> sortOrignalRates = Lists.newArrayList();
        Double tempSumRate = 0d;
        for (Award award : awards) {
            tempSumRate += award.getRate();
            sortOrignalRates.add(tempSumRate / sumRate);
        }

        // 根据区块值来获取抽取到的物品索引
        double nextDouble = Math.random();
        sortOrignalRates.add(nextDouble);
        Collections.sort(sortOrignalRates);
        int index = sortOrignalRates.indexOf(nextDouble);
        return awards.get(index);
    }
}

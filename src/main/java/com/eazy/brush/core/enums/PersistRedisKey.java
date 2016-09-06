package com.eazy.brush.core.enums;

import java.util.HashSet;
import java.util.Set;

public enum PersistRedisKey implements RedisKey {
    Test("app_brush."), //
    ObjectCountByObjectKey("app_brush_ocbok."), // 通用计数
    HashtByObjectKey("app_brush_hsbok."), //+object key value->hash(object id) 通用计数排行列表
    NoRankSetByObjectKey("app_brush_nrsbok."), //+object key value->set(object id) 通用无序集合
    RankListByObjectKey("app_brush_rlbok."), //+object key value->zset(object id) 通用计数排行列表
    ;
    public final String prefix;

    /**
     * @param prefix
     */
    PersistRedisKey(String prefix) {
        this.prefix = prefix;
    }

    @Override
    public String of(Object key) {
        if (key != null) {
            return this.prefix + key;
        } else {
            return this.prefix;
        }
    }

    @Override
    public String ofNone() {
        return this.prefix;
    }

    static {
        Set<String> keys = new HashSet<String>();
        for (PersistRedisKey prefix : PersistRedisKey.values()) {
            boolean add = keys.add(prefix.prefix);
            if (!add) {
                throw new RuntimeException("duplicate redis key prefix found:" + prefix);
            }
        }
    }

}

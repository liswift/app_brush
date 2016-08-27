package com.eazy.brush.dao.common;

import java.util.List;
import java.util.Map;

public interface CommonDao {

    List<Map<String, Object>> getListMap(String sql);

    Map<String, Object> getMap(String sql);

    Map<String, Object> findViewById(String tableName, String id);

    List<Map<String, Object>> select();

    Map<String, Object> getResultFromId(String id);
}

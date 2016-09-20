package com.eazy.brush.dao.provider;

import com.eazy.brush.dao.entity.TaskHistory;
import com.eazy.brush.dao.mapper.TaskHistoryMapper;

import java.text.MessageFormat;
import java.util.List;
import java.util.Map;

/**
 * author : liufeng
 * create time:2016/8/28 17:37
 */
public class TaskHistoryProvider {

    /**
     *
     * #{userId},#{taskId},#{appName},#{remarkName},#{incrDay},#{incrFail},#{incrUnfinish},#{retainDay},#{retainFail},#{retainUnfinish},#{retainPercent},#{createDate}
     *
     * @param map
     * @return
     */
    public String insertTaskHistoryBatch(Map map) {

        List<TaskHistory> taskSubs = (List<TaskHistory>) map.get("histories");

        StringBuilder sb = new StringBuilder();
        sb.append("INSERT INTO task_sub ");
        sb.append("(" + TaskHistoryMapper.INSERT_FEILDS + ") ");
        sb.append("VALUES ");

        MessageFormat mf = new MessageFormat("" +
                "(" +
                "#'{'taskSubs[{0}].userId'}',#'{'taskSubs[{0}].taskId'}',#'{'taskSubs[{0}].appName'}'," +
                "#'{'taskSubs[{0}].remarkName'}'," +
                "#'{'taskSubs[{0}].incrDay'}'#'{'taskSubs[{0}].incrFail'}',,#'{'taskSubs[{0}].incrUnfinish'}',#'{'taskSubs[{0}].retainDay'}'," +
                "#'{'taskSubs[{0}].retainFail'}',#'{'taskSubs[{0}].retainUnfinish'}'," +
                "#'{'taskSubs[{0}].retainPercent'}',#'{'taskSubs[{0}].retainStayday'}',#'{'taskSubs[{0}].createDate'}'" +
                ")");
        for (int i = 0; i < taskSubs.size(); i++) {
            sb.append(mf.format(new Object[]{i}));
            if (i < taskSubs.size() - 1) {
                sb.append(",");
            }
        }
        return sb.toString();
    }
}

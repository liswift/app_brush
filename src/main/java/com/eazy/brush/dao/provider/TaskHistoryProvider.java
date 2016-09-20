package com.eazy.brush.dao.provider;

import com.eazy.brush.dao.entity.TaskHistory;
import com.eazy.brush.dao.mapper.TaskHistoryMapper;
import lombok.extern.slf4j.Slf4j;

import java.text.MessageFormat;
import java.util.List;
import java.util.Map;

/**
 * author : liufeng
 * create time:2016/8/28 17:37
 */
@Slf4j
public class TaskHistoryProvider {

    /**
     *
     * #{userId},#{taskId},#{appName},#{remarkName},#{incrDay},#{incrFail},#{incrUnfinish},#{retainDay},#{retainFail},#{retainUnfinish},#{retainPercent},#{retainStayday},#{createDay}
     *
     * @param map
     * @return
     */
    public String insertTaskHistoryBatch(Map map) {

        List<TaskHistory>  taskHistories= (List<TaskHistory>) map.get("histories");

        StringBuilder sb = new StringBuilder();
        sb.append("INSERT INTO task_sub ");
        sb.append("(" + TaskHistoryMapper.INSERT_FEILDS + ") ");
        sb.append("VALUES ");

        MessageFormat mf = new MessageFormat("" +
                "(" +
                "#'{'taskHistories[{0}].userId'}',#'{'taskHistories[{0}].taskId'}',#'{'taskHistories[{0}].appName'}'," +
                "#'{'taskHistories[{0}].remarkName'}'," +
                "#'{'taskHistories[{0}].incrDay'}'#'{'taskHistories[{0}].incrFail'}',,#'{'taskHistories[{0}].incrUnfinish'}',#'{'taskHistories[{0}].retainDay'}'," +
                "#'{'taskHistories[{0}].retainFail'}',#'{'taskHistories[{0}].retainUnfinish'}'," +
                "#'{'taskHistories[{0}].retainPercent'}',#'{'taskHistories[{0}].retainStayday'}',#'{'taskHistories[{0}].createDay'}'" +
                ")");
        for (int i = 0; i < taskHistories.size(); i++) {
            sb.append(mf.format(new Object[]{i}));
            if (i < taskHistories.size() - 1) {
                sb.append(",");
            }
        }
        log.info(">>>>>>>>"+sb.toString());
        return sb.toString();
    }
}

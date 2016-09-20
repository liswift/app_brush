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

        List<TaskHistory>  histories= (List<TaskHistory>) map.get("histories");

        StringBuilder sb = new StringBuilder();
        sb.append("INSERT INTO task_history ");
        sb.append("(" + TaskHistoryMapper.INSERT_FEILDS + ") ");
        sb.append("VALUES ");

        MessageFormat mf = new MessageFormat("" +
                "(" +
                "#'{'histories[{0}].userId'}',#'{'histories[{0}].taskId'}',#'{'histories[{0}].appName'}'," +
                "#'{'histories[{0}].remarkName'}'," +
                "#'{'histories[{0}].incrDay'}',#'{'histories[{0}].incrFail'}',#'{'histories[{0}].incrUnfinish'}',#'{'histories[{0}].retainDay'}'," +
                "#'{'histories[{0}].retainFail'}',#'{'histories[{0}].retainUnfinish'}'," +
                "#'{'histories[{0}].retainPercent'}',#'{'histories[{0}].retainStayday'}',#'{'histories[{0}].createDay'}'" +
                ")");
        for (int i = 0; i < histories.size(); i++) {
            sb.append(mf.format(new Object[]{i}));
            if (i < histories.size() - 1) {
                sb.append(",");
            }
        }
        log.info(">>>>>>>>"+sb.toString());
        return sb.toString();
    }
}

package com.eazy.brush.dao.provider;

import com.eazy.brush.dao.mapper.TaskSubMapper;
import com.eazy.brush.model.TaskSub;

import java.text.MessageFormat;
import java.util.List;
import java.util.Map;

/**
 * author : liufeng
 * create time:2016/8/28 17:37
 */
public class TaskSubProvider {

    public String insertTaskSubBatch(Map map) {

        List<TaskSub> taskSubs = (List<TaskSub>) map.get("taskSubs");

        StringBuilder sb = new StringBuilder();
        sb.append("INSERT INTO task_sub ");
        sb.append("(" + TaskSubMapper.INSERT_FEILDS + ") ");
        sb.append("VALUES " + TaskSubMapper.INSERT_VALUES);

        MessageFormat mf = new MessageFormat("" +
                "(" +
                "#'{'list[{0}].taskId},#'{'list[{0}].perTime}," +
                "#'{'list[{0}].actionId},#'{'list[{0}].deviceInfoId}," +
                "#'{'list[{0}].netInfoId},#'{'list[{0}].runTime}" +
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

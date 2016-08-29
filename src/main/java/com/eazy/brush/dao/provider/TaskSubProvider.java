package com.eazy.brush.dao.provider;

import com.eazy.brush.dao.mapper.TaskSubMapper;
import com.eazy.brush.dao.entity.TaskSub;

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
        sb.append("VALUES ");

        MessageFormat mf = new MessageFormat("" +
                "(" +
                "#'{'taskSubs[{0}].taskId},#'{'taskSubs[{0}].perTime}," +
                "#'{'taskSubs[{0}].actionId},#'{'taskSubs[{0}].deviceInfoId}," +
                "#'{'taskSubs[{0}].netInfoId},#'{'taskSubs[{0}].runTime}" +
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

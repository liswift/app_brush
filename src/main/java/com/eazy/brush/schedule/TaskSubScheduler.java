package com.eazy.brush.schedule;

import com.eazy.brush.core.enums.TaskState;
import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.dao.entity.TaskHistory;
import com.eazy.brush.dao.entity.TaskSetup;
import com.eazy.brush.service.TaskHistoryService;
import com.eazy.brush.service.TaskService;
import com.eazy.brush.service.TaskSetupService;
import com.eazy.brush.service.TaskSubService;
import com.google.common.base.Stopwatch;
import lombok.extern.slf4j.Slf4j;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * author :sunpengshuai
 * create time:2016/8/31 23:47
 */
@Component
@Slf4j
public class TaskSubScheduler {

    @Autowired
    TaskService taskService;

    @Autowired
    TaskSubService taskSubService;

    @Autowired
    TaskHistoryService taskHistoryService;

    @Autowired
    TaskSetupService taskSetupService;


    /**
     * 秒 分 时 日 月
     * 30分钟跑一次检查,每天检查48次。
     * 进行唤醒任务生成
     */
    @Scheduled(cron = "0 0/30 *  * * ? ")
    public void resetTaskState() {
        log.info("### start check tasksetUP ###");
        List<TaskSetup> taskSetups=taskSetupService.getAllTaskSetup();
        for(TaskSetup taskSetup:taskSetups){
            taskSubService.makeSetupTaskSub(taskSetup);
        }
        log.info("### end check tasksetup ###");
    }

    /**
     * 每日凌晨进行旧任务的统计以及新任务的重新生成评估,需要做以下事情
     * //旧任务的统计工作
     * 1.统计昨日新增数据/失败数据/阻塞数据
     * 2.统计昨日留存数据/失败数据/阻塞数据
     * 3.重置计算剩余的新的留存率
     * 4.将新增上面数据更新进任务历史记录
     * 3.删除所有的留存任务数据(留存没有用,只有首日新增数据有用,后续留存是根据新增来的)
     * 4.删除所有的新增失败阻塞任务数据(失败的新增不能为后续做留存,故直接删除)
     * //新任务的开启生成工作
     * 5.通过task重新生成新增Tasksub并写入数据库
     * 6.通过扫描历史记录,找到需要做留存的任务,生成留存数据,并且更改历史记录中的留存率,方便下次任务扫描
     * <p>
     * 注意:
     * 1.如果当日新增留存失败率过高,以后的留存也会同步减少
     * 2.留存不受新增时间的时间段限制。新增我保证投递时间,别人安装上了,我如何保证他什么时候打开?
     */
    @Scheduled(cron = "0 0 0 * * ?")
    public void invokeAllSubTask() {
        Stopwatch stopwatch = Stopwatch.createStarted();
        log.info("### start invokeMakeTaskSub ###");
        int historyDay = Integer.parseInt(DateTime.now().minusDays(1).toString("yyyyMMdd"));//上一天
        //这里进行上一天的历史数据计算
        List<TaskHistory> historys = taskSubService.getHistoryByCreateDay(historyDay);
        log.info("### end get historys ###" + historys);
        for (TaskHistory history : historys) {
            Task task = taskService.getById(history.getTaskId());
            history.setAppName(task.getRemarkName());
            history.setRemarkName(task.getRemarkName());
            history.setUserId(task.getUserId());
            history.setRetainStayday(task.getRetainDay());//这里不要写错!
            history.setRetainPercent(task.getRetainPercent());
            history.setCreateDay(historyDay);
        }
        log.info("### begin insert historys ###" + historys);
        taskHistoryService.insert(historys);
        log.info("### end insert history,cost {} s ###", stopwatch.elapsed(TimeUnit.SECONDS));
        taskSubService.deleteOldUnUseData(historyDay);//删除所有的留存数据,没有做完的数据
        log.info("### end delete unused subtask,cost {} s ###", stopwatch.elapsed(TimeUnit.SECONDS));

        //获取所有运行中的任务,进行新的sub生成
        List<Task> tasks = taskService.getByState(TaskState.running.getCode());
        for (Task item : tasks) {
            taskSubService.makeIncrDayTaskSub(item);
        }
        log.info("### end make incrday subtask,cost {} s ###", stopwatch.elapsed(TimeUnit.SECONDS));

        //这里是获取还有留存的历史TaskHistory,根据留存率进行判断
        List<TaskHistory> activeTask = taskHistoryService.getActiveTask();
        log.info("### end getActivt history Task,cost {} s ###", stopwatch.elapsed(TimeUnit.SECONDS));
        for (TaskHistory taskHistory : activeTask) {
            taskSubService.makeRetainDayTaskSub(taskHistory);
            taskHistoryService.changeRetainPercent(taskHistory);
        }
        log.info("### end make retain day subtask,cost {} s ###", stopwatch.elapsed(TimeUnit.SECONDS));

        log.info("### end invokeMakeTaskSub,cost {} s ###", stopwatch.elapsed(TimeUnit.SECONDS));
        stopwatch.stop();
    }


}

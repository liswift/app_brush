package com.easy.brush.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * author : liufeng
 * create time:2016/9/2 22:58
 */
@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/applicationContext.xml")
public class TaskSubServiceImplTest {

//    @Autowired
//    TaskSubService taskSubService;
//
//    @Autowired
//    TaskService taskService;

    public void invokeMakeIncrDayTaskSub() {



//
//        StopWatch stopWatch = new StopWatch();
//        stopWatch.start();
//        log.info("### start invokeMakeTaskSub ###");
//
//        Task task = taskService.getByState(TaskState.confirm_passed.getCode());
//
//        if (null != task) {
//            taskService.changeState(task.getId(), TaskState.running.getCode(),"");
//            taskSubService.makeIncrDayTaskSub(task);
//            taskService.changeState(task.getId(), TaskState.run_end.getCode(),"");
//            log.info("### make tasksubs success！,task_id {} ###", task.getId());
//        }
//
//        log.info("### end invokeMakeTaskSub,cost {} s ###", stopWatch.getTotalTimeSeconds());
//        stopWatch.stop();
    }

    @Test
    public void testInvokeMakeTaskSub() {
        invokeMakeIncrDayTaskSub();
    }

    @Test
    public void testMakeRetainDayTaskSub() {
//        StopWatch stopWatch = new StopWatch();
//        stopWatch.start();
//        log.info("### start makeRetainDayTaskSub ###");
//
//        List<Task> list = taskService.getEnableList(TaskState.stoped.getCode(), 0, Integer.MAX_VALUE);
//        for (Task task : list) {
//            log.info("### start makeRetainDayTaskSub ###");
//            taskSubService.makeRetainDayTaskSub(task);
//            log.info("### end makeRetainDayTaskSub,cost {} s ###", stopWatch.getTotalTimeSeconds());
//        }
//
//        log.info("### end makeRetainDayTaskSub,cost {} s ###", stopWatch.getTotalTimeSeconds());
//        stopWatch.stop();
    }

    @Test
    public void test(){
        replaceAll();
        Map map=new HashedMap();
        StringUtils.join(map.keySet(),"");
    }

    private static final String CONTENT="aababaaaab";
    /**
     * 替换字符串
     */
    private void replaceAll()
    {
        String input = "(\\b|\\B)(m+|g+)e(\\b|\\B)";

        Pattern p = Pattern.compile(input);
        Matcher m = p.matcher(CONTENT);

        String mCONTENT= m.replaceAll("_TEST_CONTENT_");

        log.info("---replaceAll()后的内容---", "replaceAll() = "+ mCONTENT);
    }

    /**
     * 只替换首次匹配到的字符串
     */
    private void replaceFirst()
    {
        String input = "(\\b|\\B)(m+|g+)e(\\b|\\B)";

        Pattern p = Pattern.compile(input);
        Matcher m = p.matcher(CONTENT);

        String mCONTENT= m.replaceFirst("_TEST_CONTENT_");

        log.info("---replaceFirst()后的内容---", "replaceAll() = "+ mCONTENT);
    }

}

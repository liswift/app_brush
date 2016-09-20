package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.TaskHistory;
import com.eazy.brush.dao.provider.TaskSubProvider;
import com.eazy.brush.dao.entity.TaskSub;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * private String id;
 private int taskId;              //任务id
 private long perTime;             //时间粒度
 private int deviceInfoId;        //设备信息,例如三星/索尼/...
 private int runTime;             //任务执行时间
 private int state;              //三种状态 0 init,1 running,2 finish
 private int taskType;

 //cardInfo 信息
 private String telAndroidId;       //android_id 唯一
 private String subscriberId;       //跟operator有关系，前5位时operator
 private String operator;           //运营商标志码
 private String operatorName;       //中国联通\\中国电信\\中国移动
 private String line1Number;        //联通手机的手机号码
 private String simSerialNumber;    //sim卡串号
 private int networkType;        //手机卡网络类型
 private String phoneType;             //手机通话类型

 //netInfo 信息
 private String mac;                //mac地址 唯一
 private int type;                  //网络类型 0 手机网络 1 wifi

 //deviceinfo 信息
 private String versionIncremental;
 private String buildId;
 private String secureId;
 private String serial;
 * 元任务Mapper
 * Select * from (Select (@rowNo :=@rowNo+1) AS rowno, task_sub.* from task_sub, (Select @rowNo := 0) b) tmp where rowno=(Select Round(Rand() * (Select Count(*) from task_sub))) limit 1;
 * author : liufeng
 * create time:2016/8/28 16:07
 */
public interface TaskSubMapper {

    String INSERT_FEILDS = "task_id,per_time,device_info_id,run_time,create_day,state,task_type,tel_android_id," +
            "subscriber_id,operator,operator_name,line1_number,simSerial_number,network_type," +
            "phone_type,mac,type,version_incremental,build_id,secure_id,serial";

    String INSERT_VALUES = "#{taskId},#{perTime},#{deviceInfoId},#{runTime},#{createDay},#{state},#{taskType},#{telAndroidId}," +
            "#{subscriberId},#{operator},#{operatorName},#{line1Number},#{simSerialNumber},#{networkType}," +
            "#{phoneType},#{mac},#{type},#{versionIncremental},#{buildId},#{secureId},#{serial}";

    String FEILDS = "id,"+INSERT_FEILDS;

    /**
     * 这里应该是根据当前的时间点,随机获取未完成的任务
     * select (@i:=@i+1) as i,task_sub.* from task_sub,(select @i:=0) as it
     * Select * from (Select (@rowNo :=@rowNo+1) AS rowno, * from task_sub, (Select @rowNo := 0) b) tmp where rowno=(Select Round(Rand() * 10000000 % (Select Count(*) from task_sub))) limit 1;
     * @param perTime
     * @param size
     * @see #getRandomCount(long)
     * @return
     */
    @Select("Select "+FEILDS+" from (Select (@rowNo :=@rowNo+1) AS rowno, task_sub.* from task_sub, (Select @rowNo := 0) b where state=0 and per_time<=#{perTime}) tmp where rowNo>=#{randomCount} limit #{size}")
    List<TaskSub> getRandomList(@Param("perTime") long perTime, @Param("randomCount")long randomCount, @Param("size") int size);

    @Select("Select count(*) from task_sub where state=0 and per_time<=#{perTime}")
    int getRandomCount(@Param("perTime")long perTime);

    @Select("Select "+FEILDS+" from task_sub where task_id=#{taskId},create_day=#{createDay} and state=2 and task_type=1 limit  #{offset},#{number}")
    List<TaskSub> getListByCreateDay(@Param("taskId")int taskId,@Param("createDay") int createDay,@Param("offset")int offset,@Param("number")int number);

    @Select("Select count(*) from task_sub where task_id=#{taskId},create_day=#{createDay} and state=#{state} and task_type<=#{taskType}")
    int getCountByTaskId(@Param("taskId")int taskId,@Param("createDay") int createDay,@Param("state")int state,@Param("taskType")int taskType);

    @Select("Select count(*) from task_sub where create_day=#{createDay} and state=#{state} and task_type<=#{taskType}")
    int getCount(@Param("createDay") int createDay,@Param("state")int state,@Param("taskType")int taskType);

    @Delete("delete from task_sub where create_day=#{createDay} and state=#{state} and task_type<=#{taskType}")
    int deleteGetCount(@Param("createDay") int createDay,@Param("state")int state,@Param("taskType")int taskType);

    /**
     * 删除所有留存数据,以及删除所有新增失败的数据
     * 此条只能每日凌晨进行运算,其余时间不能跑!
     */
    @Delete("delete from task_sub where task_type=0 or state in (0,1)")
    void deleteUnUserData();

    @InsertProvider(type = TaskSubProvider.class, method = "insertTaskSubBatch")
    void insertTaskSubBatch(@Param("taskSubs") List<TaskSub> taskSubs);


    @Update("update task_sub set state=#{state} where id in (#{ids})")
    void changeTaskSubState(@Param("state") int state,@Param("ids") String ids);


    /**
     *     private int id;
           private int userId;//记录对应的用户id
           private int taskId;//当前记录对应的taskid
           private String appName;//当前记录对应的应用名称
           private String remarkName;//当前应用对应的应用备注名称

           private int incrDay;//当前新增数字 t
           private int incrFail;//当天失败的量,一般来说是客户端没有成功回调
           private int incrUnfinish;//当天未来及做的量,一般来说是阻塞量

           private int retainDay;//当前留存数字
           private int retainFail;//当天的失败量,一般来说是客户端没有回调成功
           private int retainUnfinish;//当前的阻塞量

           private int retainPercent;//当前的留存率,(用于计算当前新任务的留存数据)重要
           private Date createDate;//任务对应的日期
     注意:留存率这里就不做聚合了,如果此用户当前更改了留存率,则当天计算留存率的时候,就按照最后设置的留存率,进行凌晨计算次日留存
     */
    @Select("select task_id," +
            "MAX(CASE WHEN task_type=1 and state=2 then ocount else 0 end) as incr_day," +//新增数字
            "MAX(CASE WHEN task_type=1 and state=1 then ocount else 0 end) as incr_fail,"+//新增失败
            "MAX(CASE WHEN task_type=1 and state=0 then ocount else 0 end) as incr_unfinish," +//新增未做任务
            "MAX(CASE WHEN task_type=0 and state=2 then ocount else 0 end) as retain_day," +//留存成功
            "MAX(CASE WHEN task_type=0 and state=1 then ocount else 0 end) as retain_fail," +//留存失败
            "MAX(CASE WHEN task_type=0 and state=0 then ocount else 0 end) as retain_unfinish" +//留存未做
            " from (select create_day,task_id,task_type,state,count(*) as ocount from task_sub where create_day=#{createDay} group by task_id,task_type,state) as newtable group by task_id")
    List<TaskHistory> getHistoryCount(@Param("createDay")int createDay);//
    /**
     *     private int state;              //三种状态 0 init,1 running,2 finish
           private int taskType;           //有两种类型,一种是留存任务0,一种是激活任务1
     */


}
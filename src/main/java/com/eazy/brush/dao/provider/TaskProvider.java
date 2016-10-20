package com.eazy.brush.dao.provider;

import com.eazy.brush.dao.entity.Task;
import org.apache.commons.lang.StringUtils;

import static org.apache.ibatis.jdbc.SqlBuilder.*;

/**
 * Desc
 *
 * user_id,audit_user_id,app_name,package_name,version_code,app_version,apk_url,remark_name,incr_day,day_limit," +
 "incr_up_down,run_time,run_up_down,run_start_time," +
 "run_end_time,run_speed,retain_day,retain_percent,state,create_time,msg,deleted"
 *
 * @author feng.liu
 * @date 2016/9/14 15:27
 */
public class TaskProvider {

    /**
     *
     */
    private static final String tableName = "task";

    public String update(final Task task) {
        BEGIN();
        UPDATE(tableName);
        if(task.getUserId()>0){
            SET("user_id=#{userId}");
        }
        if(task.getAuditUserId()>0){
            SET("audit_user_id=#{auditUserId}");
        }
        if(task.getMinSdkVersion()>0){
            SET("min_sdk_version=#{minSdkVersion}");
        }
        if (StringUtils.isNotEmpty(task.getPackageName())) {
            SET("package_name=#{packageName}");
        }
        if (task.getVersionCode() > 0) {
            SET("version_code=#{versionCode}");
        }
        if (StringUtils.isNotEmpty(task.getAppVersion())) {
            SET("app_version=#{appVersion}");
        }
        if (StringUtils.isNotEmpty(task.getApkUrl())) {
            SET("apk_url=#{apkUrl}");
        }
        if (StringUtils.isNotEmpty(task.getRemarkName())) {
            SET("remark_name=#{remarkName}");
        }
        if (task.getIncrDay() > 0) {
            SET("incr_day=#{incrDay}");
        }
        if (task.getDayLimit() > 0) {
            SET("day_limit=#{dayLimit}");
        }
        if (task.getIncrUpDown() > 0) {
            SET("incr_up_down=#{incrUpDown}");
        }
        if (task.getRunTime() > 0) {
            SET("run_time=#{runTime}");
        }
        if (task.getRunUpDown() > 0) {
            SET("run_up_down=#{runUpDown}");
        }
        if (task.getRunStartTime() > 0) {
            SET("run_start_time=#{runStartTime}");
        }
        if (task.getRunEndTime() > 0) {
            SET("run_end_time=#{runEndTime}");
        }
        if (task.getRunSpeed() > 0) {
            SET("run_speed=#{runSpeed}");
        }
        if (task.getRetainDay() > 0) {
            SET("retain_day=#{retainDay}");
        }
        if (task.getRetainPercent() > 0) {
            SET("retain_percent=#{retainPercent}");
        }
        WHERE("id=#{id}");
        return SQL();
    }
}

package com.eazy.brush.dao.provider;

import com.eazy.brush.dao.entity.Task;
import org.apache.commons.lang.StringUtils;

import static org.apache.ibatis.jdbc.SqlBuilder.*;

/**
 * Desc
 *
 * @author feng.liu
 * @date 2016/9/14 15:27
 */
public class TaskProvider {

    private static final String tableName = "task";

    public String update(final Task task) {
        BEGIN();
        UPDATE(tableName);
        if (StringUtils.isNotEmpty(task.getAppName())) {
            SET("app_name=#{task.appName}");
        }
        if (StringUtils.isNotEmpty(task.getPackageName())) {
            SET("package_name=#{task.packageName}");
        }
        if (task.getVersionCode() > 0) {
            SET("version_code=#{task.versionCode}");
        }
        if (StringUtils.isNotEmpty(task.getAppVersion())) {
            SET("app_version=#{task.appVersion}");
        }
        if (StringUtils.isNotEmpty(task.getApkUrl())) {
            SET("app_url=#{task.apkUrl}");
        }
        if (StringUtils.isNotEmpty(task.getRemarkName())) {
            SET("app_url=#{task.remarkName}");
        }
        if (task.getIncrDay() > 0) {
            SET("incr_day=#{task.IncrDay}");
        }
        if (task.getDayLimit() > 0) {
            SET("day_limit=#{task.dayLimit}");
        }
        if (task.getIncrUpDown() > 0) {
            SET("day_limit=#{task.dayLimit}");
        }
        if (task.getRunTime() > 0) {
            SET("run_time=#{task.runTime}");
        }
        if (task.getRunUpDown() > 0) {
            SET("incr_up_down=#{task.runUpDown}");
        }
        if (task.getRunStartTime() > 0) {
            SET("run_start_time=#{task.runStartTime}");
        }
        if (task.getRunEndTime() > 0) {
            SET("run_end_time=#{task.runEndTime}");
        }
        if (task.getRunSpeed() > 0) {
            SET("run_speed=#{task.runSpeed}");
        }
        if (task.getRetainDay() > 0) {
            SET("retain_day=#{task.retainDay}");
        }
        if (task.getRetainPercent() > 0) {
            SET("retain_percent=#{task.retainPercent}");
        }
        if (StringUtils.isNotEmpty(task.getActionPageId())) {
            SET("action_page_id=#{task.actionPageId}");
        }
        WHERE("id=#{task.id}");
        return SQL();
    }
}

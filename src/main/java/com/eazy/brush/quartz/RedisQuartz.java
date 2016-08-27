package com.eazy.brush.quartz;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.eazy.brush.component.redis.Redis;

/**
 * @author jzx
 * @date 2016.3.23
 * @desc linux redis 搭建参考博客 http://www.cnblogs.com/_popc/p/3684835.html
 */
public class RedisQuartz implements Job {

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		// 个人认为最好是局部的，也可以定在1个星欺flush 下所有缓存
		//Redis.removeAll();
		Redis.remove("welcome");
	}

}

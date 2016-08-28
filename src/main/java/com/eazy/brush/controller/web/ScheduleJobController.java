package com.eazy.brush.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.model.ScheduleJob;
import com.eazy.brush.service.impl.ScheduleJobService;

/**
 * @date 2016/2/2
 * @author jzx 
 * @desc 任务调度
 */
@Controller
@RequestMapping("/schedule")
public class ScheduleJobController extends BaseController {

	@Autowired
	private ScheduleJobService scheduleJobService;
	
	@RequestMapping("list")
	public ModelAndView getAllJobs(Model model){
		List<ScheduleJob> scheduleJobs = scheduleJobService.getAllScheduleJob();
		return new ModelAndView("sys/schedule_list","data",scheduleJobs);
	}
	
	@RequestMapping(value = "addSchedule", method = RequestMethod.POST)
	public String addSchedule(ScheduleJob scheduleJob) {
		scheduleJob.setStatus("1");
		scheduleJobService.add(scheduleJob);
		return "redirect:/schedule/list";
	}
	
	@RequestMapping(value= "/stop" , method = RequestMethod.GET)
	public String stop()  {
		String name = getPara("name");
		String group = getPara("group");
		scheduleJobService.stopJob(name, group);
		return "redirect:/schedule/list";
	}
	
	@RequestMapping("/resume")
	public String resume() {
		String name = getPara("name");
		String group = getPara("group");
		scheduleJobService.restartJob(name, group);
		return "redirect:/schedule/list";
	}
	
	@RequestMapping("/delete")
	public String delete() {
		String name = getPara("name");
		String group = getPara("group");
		scheduleJobService.delJob(name, group);
		return "redirect:/schedule/list";
	}

	
	@RequestMapping("/startNow")
	public String stratNow() {
		String name = getPara("name");
		String group = getPara("group");
		scheduleJobService.startNowJob(name, group);
		return "redirect:/schedule/list";
	}
	
	@RequestMapping(value = "toAddSchedule", method = RequestMethod.GET)
	public ModelAndView toAddSchedule() {
		return new ModelAndView("sys/schedule_add");
	}
}

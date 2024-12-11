package com.mehmetvasfi.controller.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mehmetvasfi.controller.IActivityController;
import com.mehmetvasfi.entites.Activity;
import com.mehmetvasfi.service.IActivityService;

@RestController
@RequestMapping("/rest/api/activity")
public class ActivityControllerImpl implements IActivityController {

	@Autowired IActivityService activityService;
	@GetMapping(path = "/list")
	@Override
	public List<Activity> getAllActivity()  {
		
		return activityService.getAllActivity() ;
	}
	@Override
	@PostMapping(path = "/save")
	public Activity saveActivity(@RequestBody Activity activity) {
		activityService.saveActivity(activity);
		return activity;
	}

	
}

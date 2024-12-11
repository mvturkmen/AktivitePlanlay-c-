package com.mehmetvasfi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mehmetvasfi.entites.Activity;
import com.mehmetvasfi.repository.ActivityRepository;
import com.mehmetvasfi.service.IActivityService;

@Service
public class ActivityServiceImpl implements IActivityService {
	
	@Autowired
	private ActivityRepository activityRepository;

	@Override
	public List<Activity> getAllActivity() {
		List<Activity> activities = activityRepository.findAll();
		return activities;
	}

	@Override
	public Activity saveActivity(Activity activity) {
		activityRepository.save(activity);
		return activity;
	}

}

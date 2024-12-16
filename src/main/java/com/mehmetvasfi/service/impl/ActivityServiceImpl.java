package com.mehmetvasfi.service.impl;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mehmetvasfi.entites.Activity;

import com.mehmetvasfi.repository.ActivityRepository;
import com.mehmetvasfi.repository.UserRepository;
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

	@Override
	public Activity getActivityById(Integer id) {
		Optional<Activity> optional = activityRepository.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	@Override
	public boolean deleteActivity(Integer id) {
		Optional<Activity> optional = activityRepository.findById(id);
		if(optional.isPresent()) {
			activityRepository.delete(optional.get());
			return true;
		}
		return false;
	}

	@Override
	public Activity updateActivity(Integer id, Activity activity) {
	    Optional<Activity> optional = activityRepository.findById(id);
	    if (optional.isPresent()) {
	        Activity dbActivity = optional.get();

	        dbActivity.setTitle(
	            activity.getTitle() != null ? activity.getTitle() : dbActivity.getTitle()
	        );

	        dbActivity.setCategory(
	            activity.getCategory() != null ? activity.getCategory() : dbActivity.getCategory()
	        );

	        dbActivity.setDescription(
	            activity.getDescription() != null ? activity.getDescription() : dbActivity.getDescription()
	        );

	        dbActivity.setTeamSize(
	            activity.getTeamSize() != null ? activity.getTeamSize() : dbActivity.getTeamSize()
	        );
	        
	        dbActivity.setTimeOfActivity(
	            activity.getTimeOfActivity() != null ? activity.getTimeOfActivity() : dbActivity.getTimeOfActivity()
	        );

	        return activityRepository.save(dbActivity);
	    }
	    return null;
	}


	



	
}

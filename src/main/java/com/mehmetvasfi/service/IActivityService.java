package com.mehmetvasfi.service;

import java.util.List;

import com.mehmetvasfi.entites.Activity;
import com.mehmetvasfi.entites.User;

public interface IActivityService {
	
	public List<Activity> getAllActivity();
	
	public Activity saveActivity(Activity activity);
	
	public Activity getActivityById(Integer id);
	
	public boolean deleteActivity(Integer id);

	public Activity updateActivity(Integer id,Activity activity);
	
	

}

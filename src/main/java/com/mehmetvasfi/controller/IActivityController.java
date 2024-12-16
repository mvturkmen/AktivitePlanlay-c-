package com.mehmetvasfi.controller;

import java.util.List;



import com.mehmetvasfi.entites.Activity;

public interface IActivityController {
	public List<Activity> getAllActivity();
	
	public Activity saveActivity(Activity activity);
	
	public Activity getActivityById(Integer id);
	
	public boolean deleteActivity(Integer id);
	
	public Activity updateActivity(Integer id, Activity activity);
	
}

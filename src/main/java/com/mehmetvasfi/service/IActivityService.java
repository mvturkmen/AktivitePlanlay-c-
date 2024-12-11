package com.mehmetvasfi.service;

import java.util.List;

import com.mehmetvasfi.entites.Activity;

public interface IActivityService {
	
	public List<Activity> getAllActivity();
	public Activity saveActivity(Activity activity);

}

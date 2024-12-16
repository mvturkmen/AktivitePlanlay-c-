package com.mehmetvasfi.controller;

import java.util.List;

import com.mehmetvasfi.entites.Activity;
import com.mehmetvasfi.entites.User;



public interface IUserController {
	
	public List<User> getAllUser();

	public User saveUser(User user);

	public User getUserById(Integer id);

	public boolean deleteUser(Integer id);

	public User updateUser(Integer id, User updateUser);
	
	public String verifyUserEmail(String token);

	public User findUserById(Integer id);

	public boolean delUser(Integer userid,Integer activityid);

	public Activity upUser(Integer userid,Integer activityid,Activity updatedActivity );

	public Activity saUser(Integer id,Activity activity);
	
}

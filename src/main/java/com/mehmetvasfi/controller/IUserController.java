package com.mehmetvasfi.controller;

import java.util.List;

import com.mehmetvasfi.entites.User;

public interface IUserController {
	
	public List<User> getAllUser();

	public User saveUser(User user);

	public User getUserById(Integer id);

	public boolean deleteUser(Integer id);

	public User updateUser(Integer id, User updateUser);
	
}

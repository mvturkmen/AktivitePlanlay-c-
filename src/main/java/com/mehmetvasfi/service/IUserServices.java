package com.mehmetvasfi.service;

import java.util.List;

import com.mehmetvasfi.entites.User;

public interface IUserServices {

	public User saveUser(User user);

	public List<User> getAllUser();

	public User getUserById(Integer id);

    public boolean deleteUser(Integer id);

    public User updateUser(Integer id, User dtoUserIU);
    
    boolean verifyUserEmail(String token);
}

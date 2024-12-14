package com.mehmetvasfi.service;

import java.util.List;

import com.mehmetvasfi.entites.Activity;
import com.mehmetvasfi.entites.User;

public interface IUserServices {

	public User saveUser(User user);

	public List<User> getAllUser();

	public User getUserById(Integer id);

    public boolean deleteUser(Integer id);

    public User updateUser(Integer id, User dtoUserIU);
    
    boolean verifyUserEmail(String token);

    public User findUserById(Integer id);

    //onetomany silme işlemleri
    public boolean delUser(Integer userid, Integer activityid);

    public Activity upUser(Integer userid, Integer activityid,Activity updatedActivity);

    public Activity saUser(Integer id,Activity activity);



}

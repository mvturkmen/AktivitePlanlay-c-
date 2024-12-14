package com.mehmetvasfi.controller.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mehmetvasfi.controller.IUserController;
import com.mehmetvasfi.entites.Activity;
import com.mehmetvasfi.entites.User;
import com.mehmetvasfi.service.IUserServices;


import jakarta.validation.Valid;

@RestController
@RequestMapping("/rest/api/user")
public class UserControllerImpl implements IUserController {

   @Autowired
    private IUserServices userServices;

	@Override
	@GetMapping(path="/list")
	public List<User> getAllUser() {
		
		return userServices.getAllUser();
	}

	@PostMapping(path = "/save")
	@Override
	public User saveUser(@RequestBody @Valid User user){
		return userServices.saveUser(user);
	}


	@GetMapping(path = "/list/{id}")
	@Override
	public User getUserById(@PathVariable(name="id") Integer id){
		return userServices.getUserById(id);
	}

	@DeleteMapping(path = "/delete/{id}")
	@Override
	public boolean deleteUser(@PathVariable(name = "id") Integer id){

		return userServices.deleteUser(id);
	}

	@PutMapping(path="/update/{id}")
	@Override
	public User updateUser(@PathVariable(name="id") Integer id,@RequestBody User updateUser){
		return userServices.updateUser(id, updateUser);
	}
	
	@GetMapping("/verify")
    public String verifyUserEmail(@RequestParam(name = "token") String token) {
        boolean isVerified = userServices.verifyUserEmail(token);
        if (isVerified) {
            return token;
        } 
        else {
            return null;
        }
    }

	@GetMapping(path = "onetomany/get/{id}")
	@Override
	public User findUserById(@PathVariable (name = "id") Integer id){
		return userServices.findUserById(id);
	}

	@DeleteMapping(path="onetomany/delete/{userid}/{activityid}")
	@Override
	public boolean delUser(@PathVariable(name="userid") Integer userid,@PathVariable(name="activityid") Integer activityid){
		return userServices.delUser(userid, activityid);
	}

    @PutMapping(path="/update/{userid}/{activityid}")
	@Override
	public Activity upUser(@PathVariable(name="userid") Integer userid,@PathVariable(name = "activityid") Integer activityid,@RequestBody   Activity updatedActivity){
		return userServices.upUser(userid,activityid, updatedActivity);
	}

	@PostMapping(path="/onetomany/save/{id}")
	@Override
	public Activity saUser(@PathVariable(name = "id")Integer id,@RequestBody Activity activity){
		return userServices.saUser(id, activity);

		
	}

	

	
	
	
}

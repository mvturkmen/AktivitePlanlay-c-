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
	
	
	
}

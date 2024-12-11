package com.mehmetvasfi.controller.impl;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mehmetvasfi.controller.IUserController;
import com.mehmetvasfi.entites.User;

@RestController
@RequestMapping("/rest/api/user")
public class UserControllerImpl implements IUserController {

	@Override
	@GetMapping("/list")
	public List<User> getAllUser() {
		
		return null;
	}
	
}

package com.mehmetvasfi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mehmetvasfi.entites.User;
import com.mehmetvasfi.repository.UserRepository;
import com.mehmetvasfi.service.IUserServices;

@Service
public class UserServicesImpl implements IUserServices{
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public List<User> getAllUser() {
		List<User> users = userRepository.findAll();
		return users;
	}
	
}

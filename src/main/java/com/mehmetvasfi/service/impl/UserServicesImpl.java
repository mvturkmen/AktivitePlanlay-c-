package com.mehmetvasfi.service.impl;

import java.util.List;
import java.util.Optional;

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

	@Override
	public User saveUser(User user){

		return userRepository.save(user);
	}

	@Override
	public User getUserById(Integer id){

		Optional<User> optional=userRepository.findById(id);
		if(optional.isPresent()){
			return optional.get();
		}
		return null;
	}

	@Override
	public void  deleteUser(Integer id){

		User dbUser=getUserById(id);
		if(dbUser!=null)
		{
			userRepository.delete(dbUser);
		}

	}

	@Override
	public User updateUser(Integer id,User updateUser){

		User dbUser=getUserById(id);
		if(dbUser!=null){
			dbUser.setFirstName(updateUser.getFirstName());
			dbUser.setLastName(updateUser.getLastName());
			dbUser.setBirthOfDate(updateUser.getBirthOfDate());
			dbUser.setMailProperties(updateUser.getMailProperties());
			dbUser.setBio(updateUser.getBio());
			dbUser.setPasswordString(updateUser.getPasswordString());

			return userRepository.save(dbUser);
		}


		return null;
	}
	
}

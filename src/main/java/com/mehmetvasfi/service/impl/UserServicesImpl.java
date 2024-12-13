package com.mehmetvasfi.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.UUID;
import com.mehmetvasfi.entites.User;
import com.mehmetvasfi.repository.UserRepository;
import com.mehmetvasfi.service.IUserServices;

@Service
public class UserServicesImpl implements IUserServices{
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired 
	private EmailService emailService;
	
	@Override
	public List<User> getAllUser() {
		return userRepository.findAll();
		
	}

	@Override
	public User saveUser(User user){
		String token = UUID.randomUUID().toString();
		user.setVerificationToken(token);
		user.setEmailVerified(false);
		
		userRepository.save(user);
		
		emailService.sendVerificationEmail(user);
		
		return user;
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
	public boolean  deleteUser(Integer id){

		User dbUser=getUserById(id);
		if(dbUser!=null)
		{
			userRepository.delete(dbUser);
			return true;
		}
		return false;
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

	@Override
    public boolean verifyUserEmail(String token) {
        
        Optional<User> optionalUser = userRepository.findByVerificationToken(token);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            user.setEmailVerified(true);  
            userRepository.save(user);  
            return true;
        }
        return false; 
    }
	
}

package com.mehmetvasfi.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.UUID;

import com.mehmetvasfi.entites.Activity;
import com.mehmetvasfi.entites.User;
import com.mehmetvasfi.repository.ActivityRepository;
import com.mehmetvasfi.repository.UserRepository;
import com.mehmetvasfi.service.IUserServices;

@Service
public class UserServicesImpl implements IUserServices{
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired 
	private EmailService emailService;

	@Autowired
	private ActivityServiceImpl activityService;

	@Autowired ActivityRepository activityRepository;
	
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
			dbUser.setPassword(updateUser.getPassword());

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

	public User findUserById(Integer id)
	{

		Optional<User>optional=userRepository.findById(id);
		if(optional.isEmpty()){

			throw new RuntimeException("User not found with id: " + id);
			
		}

		User dbUser=optional.get();
		List<Activity>dbActivity=optional.get().getActivity();

		if(dbActivity!=null && dbActivity.isEmpty()){
			for (Activity activity : dbActivity) {
				
				Activity activity2=new Activity();
				dbUser.getActivity().add(activity2);
			}
		}
		return dbUser;
	}


	@Override
    public boolean delUser(Integer userId, Integer activityId) {

		User dbUser = findUserById(userId);
		if (dbUser != null) {
			
			List<Activity> activities = dbUser.getActivity();
			
			
			Activity activityToRemove = null;
			for (Activity activity : activities) {
				if (activity.getId().equals(activityId)) {  
					activityToRemove = activity;
					break;
				}
			}

			
			if (activityToRemove != null) {
				activities.remove(activityToRemove);
				activityRepository.delete(activityToRemove);
				dbUser.setActivity(activities);  
				userRepository.save(dbUser);
				return true;  
			}
		}
		return false;  
    }

    public Activity upUser(Integer userid, Integer activityid, Activity updatedActivity) {
		User dbUser = findUserById(userid); // Kullanıcıyı bul
		if (dbUser != null) {
			List<Activity> activities = dbUser.getActivity(); // Kullanıcının aktivitelerini al
	
			Activity activityToUpdate = null;
			for (Activity activity : activities) {
				if (activity.getId().equals(activityid)) {
					activityToUpdate = activity;
					break;
				}
			}
	
			if (activityToUpdate != null) {
				// Aktiviteyi güncellemeden önce ID'yi koruyalım
				updatedActivity.setId(activityToUpdate.getId());
	
				// Aktiviteyi güncelle
				Activity dbActivity = activityService.updateActivity(activityToUpdate.getId(), updatedActivity);
				if (dbActivity != null) {
					// Aktiviteyi tekrar güncelledikten sonra, aktiviteleri güncelle
					activities.replaceAll(a -> a.getId().equals(activityid) ? dbActivity : a);
	
					// Güncellenmiş aktivitelerle kullanıcıyı kaydet
					dbUser.setActivity(activities);
					
					// Kullanıcı ve aktivitelerinin doğru şekilde ilişkilendirildiğinden emin olun
					for (Activity activity : activities) {
						activity.setUser(dbUser); // Aktiviteyi doğru kullanıcıya bağla
					}
	
					 userRepository.save(dbUser);

					 return dbActivity;
				}
			}
		}
	
		return null; // Eğer kullanıcı bulunamazsa veya aktivite güncellenemezse null döner
	}
	
	
	public Activity saUser(Integer id,Activity activity){

		User dbUser=findUserById(id);
		if(dbUser !=null){

			activity.setUser(dbUser);

			Activity dbActivity=activityService.saveActivity(activity);
			//dbUser.getActivity().add(dbActivity);

			return dbActivity;

			// userRepository.save(dbUser);


			//return dbUser;
			

			
		}


		return null;

	}

	
}

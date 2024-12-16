package com.mehmetvasfi.service.impl;

import java.util.Date;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mehmetvasfi.dto.DtoUser;
import com.mehmetvasfi.security.AuthRequest;
import com.mehmetvasfi.security.AuthResponse;
import com.mehmetvasfi.security.SecurityService;
import com.mehmetvasfi.entites.RefreshToken;
import com.mehmetvasfi.entites.User;
import com.mehmetvasfi.repository.RefreshTokenRepository;
import com.mehmetvasfi.repository.UserRepository;
import com.mehmetvasfi.service.IAuthService;

@Service
public class AuthServiceImpl implements IAuthService{
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private AuthenticationProvider authenticationProvider;
	
	@Autowired
	private SecurityService securityService;
	
	
	@Autowired
	private RefreshTokenRepository refreshTokenRepository;
	
	private RefreshToken createRefreshToken(User user) {
		RefreshToken refreshToken = new RefreshToken();
		refreshToken.setRefreshToken(UUID.randomUUID().toString());
		refreshToken.setExpireDate(new Date(System.currentTimeMillis()+ 1000*60*60*4));
		refreshToken.setUser(user);
		
		return refreshToken;
	}

	
	@Override
	public AuthResponse authenticate(AuthRequest request) {
		try {
			UsernamePasswordAuthenticationToken auth =
					new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword());
			authenticationProvider.authenticate(auth);
			
			Optional<User> optionalUser = userRepository.findByUsername(request.getUsername());
			if (optionalUser.isEmpty()) {
			    throw new UsernameNotFoundException("Kullanıcı bulunamadı");
			}
			String accessToken = securityService.generateToken(optionalUser.get());
			
			RefreshToken refreshToken = createRefreshToken(optionalUser.get());
			refreshTokenRepository.save(refreshToken);
			
			
			return new AuthResponse(accessToken, refreshToken.getRefreshToken());
		} catch (Exception e) {
			System.out.println("Veritabanı hatası: " + e.getMessage());
		    e.printStackTrace();  // Daha fazla detay için
			System.out.println("Kullanıcı adı veya şifre hatalı");
			System.out.println(e);
		}
		return null;
	}
	
	
	
	@Override
	public DtoUser register(AuthRequest request) {
		DtoUser dto = new DtoUser();
		User user = new User();
		
		user.setUsername(request.getUsername());
		user.setPassword(passwordEncoder.encode(request.getPassword()));
		
		
		User savedUser =  userRepository.save(user);
		BeanUtils.copyProperties(savedUser, dto);
		return dto;
	}


	

	
}

package com.mehmetvasfi.service.impl;

import java.util.Date;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mehmetvasfi.security.AuthResponse;
import com.mehmetvasfi.security.SecurityService;
import com.mehmetvasfi.security.RefreshTokenRequest;
import com.mehmetvasfi.entites.RefreshToken;
import com.mehmetvasfi.entites.User;
import com.mehmetvasfi.repository.RefreshTokenRepository;
import com.mehmetvasfi.service.IRefreshTokenService;

@Service
public class RefreshTokenServiceImpl implements IRefreshTokenService{
	
	@Autowired
	private RefreshTokenRepository refreshTokenRepository;
	
	@Autowired
	private SecurityService securityService;
	
	public boolean isRefreshTokenExpired(Date expiredDate) {
		return new Date().before(expiredDate);
	}
	
	private RefreshToken createRefreshToken(User user) {
		RefreshToken refreshToken = new RefreshToken();
		refreshToken.setRefreshToken(UUID.randomUUID().toString());
		refreshToken.setExpireDate(new Date(System.currentTimeMillis()+ 1000*60*60*4));
		refreshToken.setUser(user);
		
		return refreshToken;
	}

	
	@Override
	public AuthResponse refreshToken(RefreshTokenRequest request) {
		Optional<RefreshToken> optional = refreshTokenRepository.findByRefreshToken(request.getRefreshToken());
		if(optional.isEmpty()) {
			System.out.println("REFRESH TOKEN GEÇERSİZDİR : " + request.getRefreshToken());
		}
		
		RefreshToken refreshToken = optional.get();
		
		if(!isRefreshTokenExpired(refreshToken.getExpireDate())) {
			System.out.println("REFRESH TOKEN EXPİRE OLMUŞTUR BABA : " + request.getRefreshToken());
		}
		
		String accessToken = securityService.generateToken(refreshToken.getUser());
		RefreshToken savedRefreshToken= refreshTokenRepository.save(createRefreshToken(refreshToken.getUser()));
		
		
		
		return new AuthResponse(accessToken, savedRefreshToken.getRefreshToken());
	}

}

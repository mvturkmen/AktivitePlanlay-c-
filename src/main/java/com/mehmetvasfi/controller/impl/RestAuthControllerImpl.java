package com.mehmetvasfi.controller.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.mehmetvasfi.controller.IRestAuthController;
import com.mehmetvasfi.dto.DtoUser;
import com.mehmetvasfi.security.AuthRequest;
import com.mehmetvasfi.security.AuthResponse;
import com.mehmetvasfi.security.RefreshTokenRequest;
import com.mehmetvasfi.service.IAuthService;
import com.mehmetvasfi.service.IRefreshTokenService;

import jakarta.validation.Valid;

@RestController
public class RestAuthControllerImpl implements IRestAuthController{
	
	@Autowired
	private IAuthService authService;
	
	@Autowired
	private IRefreshTokenService refreshTokenService;

	@PostMapping("/register")
	@Override
	public DtoUser register(@Valid @RequestBody AuthRequest request) {
		return authService.register(request);
	}

	@PostMapping("/authenticate")
	@Override
	public AuthResponse authenticate(@Valid @RequestBody AuthRequest request) {
		return authService.authenticate(request);
	}

	@PostMapping("/refreshToken")
	@Override
	public AuthResponse refreshToken(@RequestBody RefreshTokenRequest request) {
		return refreshTokenService.refreshToken(request);
	}

	
}

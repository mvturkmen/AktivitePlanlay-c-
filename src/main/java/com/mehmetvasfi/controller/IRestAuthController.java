package com.mehmetvasfi.controller;

import com.mehmetvasfi.dto.DtoUser;
import com.mehmetvasfi.security.AuthRequest;
import com.mehmetvasfi.security.AuthResponse;
import com.mehmetvasfi.security.RefreshTokenRequest;

public interface IRestAuthController {

	public DtoUser register(AuthRequest request);
	
	public AuthResponse authenticate(AuthRequest request);
	
	public AuthResponse refreshToken(RefreshTokenRequest request);
}

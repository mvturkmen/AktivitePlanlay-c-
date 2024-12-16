package com.mehmetvasfi.service;

import com.mehmetvasfi.dto.DtoUser;
import com.mehmetvasfi.security.AuthRequest;
import com.mehmetvasfi.security.AuthResponse;

public interface IAuthService {

	public DtoUser register(AuthRequest request);
	
	public AuthResponse authenticate(AuthRequest request);
}

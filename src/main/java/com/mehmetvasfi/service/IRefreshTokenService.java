package com.mehmetvasfi.service;

import com.mehmetvasfi.security.AuthResponse;
import com.mehmetvasfi.security.RefreshTokenRequest;

public interface IRefreshTokenService {

	public AuthResponse refreshToken(RefreshTokenRequest request);
}

package net.mwav.member.service;

import net.mwav.member.auth.UserInfo;

public interface AuthService {
	
	public UserInfo readUserInfo(String token);
}
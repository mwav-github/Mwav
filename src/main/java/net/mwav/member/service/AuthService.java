package net.mwav.member.service;

import net.mwav.member.auth.UserInfo;

public interface AuthService {
	
	public UserInfo readUserInfo(String token);
	
	//public UserInfo getUserInfo(int idx) throws RuntimeException;
	
	//public UserInfo getUserInfo(int idx, String hash) throws RuntimeException;
}
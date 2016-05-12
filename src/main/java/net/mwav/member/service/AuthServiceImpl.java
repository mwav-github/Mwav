package net.mwav.member.service;

import java.util.ArrayList;
import java.util.List;

import net.mwav.member.auth.AuthUser;
import net.mwav.member.auth.UserInfo;
import net.mwav.member.auth.VersionProperty;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;



@Service
@Transactional
public class AuthServiceImpl implements AuthService {

	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired 
	private VersionProperty property;
	
	private final String USER_INFO_URL = "/user?token=";

	private String makeApiUrl(String gid) {
		StringBuilder builder = new StringBuilder();
		builder.append(property.getApiUrl()).append(USER_INFO_URL)
		.append(gid);
		
		return  builder.toString();
	}
	
	@Override
	public UserInfo readUserInfo(String token) {
		UserInfo apiResult = null;
		 RestTemplate restTemplate = new RestTemplate();
		try {
			//반환받은 Json타입을 UserInfo.class로 변환해 준다
			apiResult = restTemplate.getForObject(makeApiUrl(token), UserInfo.class);	 
		} catch (RestClientException e) {
	
		}
		return apiResult;
	}
	
	/*@Override
	public UserInfo getUserInfo(int idx) throws RuntimeException {
		//AuthUser user = getAuthUserDataByIdx(idx);
		UserInfo userInfo = UserInfo.createUserInfo(user);	
		//List<String> rollList = getAuthorities(user.getAuthGroups());
		//userInfo.setRoleList(rollList);
		
		return userInfo;
	}*/
	
	/*@Override
	public UserInfo getUserInfo(int idx, String hash) {
		AuthUser user = getAuthUserDataByIdx(idx);
		AuthGroup target = null;
		List<AuthGroup> authGroup = user.getAuthGroups();
		if(authGroup!=null && !authGroup.isEmpty()) {
			target = authRepository.getGroupsInParentGroups(user.getAuthGroups(), hash);
		}
		UserInfo userInfo = UserInfo.createUserInfo(user);
		
		List<String> rollList = null;
		
		if(target == null)
			rollList = new ArrayList<String>();
		else 
			rollList = getAuthorities(createList(target));
		
		userInfo.setRoleList(rollList);
			
		return userInfo;
	}
	
	private AuthUser getAuthUserDataByIdx(int idx) {
		AuthUser user = authRepository.getUserWithRole(idx);
		if(user == null) {
			user = authRepository.getUser(idx);
			if(user == null)
				throw new RuntimeException("존재하지 않는 아이디");
		}
		return user;
	}*/

}

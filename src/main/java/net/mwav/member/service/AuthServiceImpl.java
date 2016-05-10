package net.mwav.member.service;

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

	/*private String makeApiUrl(String gid) {
		StringBuilder builder = new StringBuilder();
		builder.append(property.getApiUrl()).append(USER_INFO_URL)
		.append(gid).append("&hash=").append(property.getRoleHash());
		
		return  builder.toString();
	}*/
	
	@Override
	public UserInfo readUserInfo(String token) {
		UserInfo apiResult = null;
		 RestTemplate restTemplate = new RestTemplate();
		try {
			//반환받은 Json타입을 UserInfo.class로 변환해 준다
			apiResult = restTemplate.getForObject(token, UserInfo.class);	 
		} catch (RestClientException e) {
	
		}
		return apiResult;
	}

}

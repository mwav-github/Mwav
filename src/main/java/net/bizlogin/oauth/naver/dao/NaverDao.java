package net.bizlogin.oauth.naver.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface NaverDao {
	
	public Map<String, Object> getSnsPromoter(Map<String, Object> userProfile);
	
	public void createSnsPromoter(Map<String, Object> userProfile);
}

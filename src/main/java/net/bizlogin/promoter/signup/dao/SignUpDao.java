package net.bizlogin.promoter.signup.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface SignUpDao {

	public Map<String, Object> getPromoter(Map<String, Object> param);

	public void createPromoter(Map<String, Object> param);

	public void createPromoterValue(Map<String, Object> param);

	public void createPromoterValueLog(Map<String, Object> param);
	
	public void createSnsPromoter(Map<String, Object> param);

}

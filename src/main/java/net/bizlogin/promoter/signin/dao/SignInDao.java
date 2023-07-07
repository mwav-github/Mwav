package net.bizlogin.promoter.signin.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * 로그인
 */
@Repository
public interface SignInDao {

	/**
	 * 프로모터 검색 
	 */
	public Map<String, Object> getPromoter(Map<String, Object> param);

	/**
	 * 프로모터 sns 검색 
	 */
	public Map<String, Object> getSnsPromoter(Map<String, Object> param);

}

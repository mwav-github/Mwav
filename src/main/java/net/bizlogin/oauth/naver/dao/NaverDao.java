package net.bizlogin.oauth.naver.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * 프로모터 네이버 로그인 
 *
 */
@Repository
public interface NaverDao {

	/**
	 * 프로모터 네이버 사용자 조회
	 * @param userProfile {id, email}
	 * @return
	 */
	public Map<String, Object> getSnsPromoter(Map<String, Object> userProfile);

	/**
	 * 프로모터 네이버 사용자 가입
	 * @param userProfile {id, email, name, gender}
	 */
	public void createSnsPromoter(Map<String, Object> userProfile);
}

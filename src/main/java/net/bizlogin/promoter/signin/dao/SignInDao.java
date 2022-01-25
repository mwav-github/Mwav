package net.bizlogin.promoter.signin.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * 로그인
 */
@Repository
public interface SignInDao {

	public Map<String, Object> getPromoter(Map<String, Object> param) throws Exception;

}

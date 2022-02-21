package net.bizlogin.promoter.manage.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface ManageDao {
	
	public Map<String, Object> getPromoter(Map<String, Object> param) throws Exception;
	
	public int updateCertifyDt(Map<String, Object> param) throws Exception;
	
	public int increaseVisitCount(Map<String, Object> param) throws Exception;
}

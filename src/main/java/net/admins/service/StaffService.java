package net.admins.service;

import java.util.List;
import java.util.Map;

import net.admins.vo.Staff_VO;

public interface StaffService {

	/*========================================등록========================================*/
	int selectNextStfPk() throws Exception;
	
	public boolean selectOneStfLoginIdCheck(String stfLoginId) throws Exception;
	
	void insertStfForm(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectListStfList(Map<String, Object> map);

	int selectOneGetTotalCount();

	Map<String, Object> selectStfView(Map<String, Object> map);

	Map<String, Object> updateStfForm(Map<String, Object> map);

	Staff_VO selectStfLogin(Map<String, Object> map);

	void updateProStfForm(Map<String, Object> map);
	
	int insertStfRegist(Map<String, Object> map);
	
}

package net.admin.service;

import java.util.List;
import java.util.Map;

import net.common.common.CommandMap;

public interface StaffService {

	/*========================================등록========================================*/
	
	void insertStfForm(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectListStfList(Map<String, Object> map);

	int selectOneGetTotalCount();

	Map<String, Object> selectStfView(Map<String, Object> map);

	Map<String, Object> updateStfForm(Map<String, Object> map);

	Map<String, Object> selectStfLogin(Map<String, Object> map);
	

	
}

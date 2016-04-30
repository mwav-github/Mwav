package net.admins.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.common.common.CommandMap;

public interface GoodsAdminsService {

	void insertGdsForm(Map<String, Object> map);
	
	void insertGdsFiles(Map<String, Object> map);
	
	String selectNextPk();

	int selectOneGetGdsTotalCount();

	List<Map<String, Object>> selectListGdsList(Map<String, Object> map);


	/*========================================등록========================================*/
	
	
}

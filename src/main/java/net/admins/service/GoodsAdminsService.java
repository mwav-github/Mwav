package net.admins.service;

import java.util.List;
import java.util.Map;

public interface GoodsAdminsService {
	
	void insertGdsForm(Map<String, Object> map);
	
	int selectOneGetGdsTotalCount();
	
	List<Map<String, Object>> selectListGdsList(Map<String, Object> map);
}

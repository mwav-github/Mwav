package net.admins.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import net.admins.vo.Staff_VO;
import net.common.common.CommandMap;

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

	int selectPmtOneGetTotalCount(CommandMap commandMap);

	List<Map<String, Object>> selectListPmtList(Map<String, Object> map);

	void insertPmtForm(CommandMap commandMap) throws Exception;

	boolean selectOnePmtLoginIdCheck(String stfLoginId) throws Exception;

	Map<String, Object> selectPmtView(String promoter_id);

	Map<String, Object> updatePmtForm(String promoter_id);

	void updatePmt(CommandMap commandMap);

	boolean updatePmtPassword(CommandMap commandMap) throws IOException;

	void leavePmt(CommandMap commandMap);
}

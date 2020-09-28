package net.admins.service;

import java.util.List;
import java.util.Map;

import net.common.common.CommandMap;

public interface BoardNoticeAdminsService {

/////////////////////////////////////BoardNews/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 */

	void insertNtmForm(Map<String, Object> map) throws Exception;

	/*
	 * ========================================보기================================
	 * ========
	 */

	Map<String, Object> selectOneNtmView(Map<String, Object> map)
			throws Exception;

	/*
	 * ========================================수정================================
	 * ========
	 */
	Map<String, Object> updateNtmForm(Map<String, Object> map) throws Exception;
	
	void updateProNtmForm(Map<String, Object> map) throws Exception;

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */

	int selectOneGetNtmTotalCount();
	int selectOneGetPmtNtmTotalCount();	

	List<Map<String, Object>> selectListNtmList(Map<String, Object> map);
	List<Map<String, Object>> selectListPmtNtmList(Map<String, Object> map);
	
	List<Map<String, Object>> selectListNtmFrontList(Map<String, Object> map)
			throws Exception;

	/*
	 * ========================================삭제================================
	 * ========
	 */

	void deleteNtmDelete(Map<String, Object> map) throws Exception;
	void deletePmtNtmDelete(Map<String, Object> map) throws Exception;
	


}

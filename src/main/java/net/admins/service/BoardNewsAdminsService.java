package net.admins.service;

import java.util.List;
import java.util.Map;

public interface BoardNewsAdminsService {

/////////////////////////////////////BoardNews/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 */

	void insertNsmForm(Map<String, Object> map) throws Exception;

	/*
	 * ========================================보기================================
	 * ========
	 */

	Map<String, Object> selectOneNsmView(Map<String, Object> map)
			throws Exception;

	/*
	 * ========================================수정================================
	 * ========
	 */
	Map<String, Object> updateNsmForm(Map<String, Object> map) throws Exception;
	
	void updateProNsmForm(Map<String, Object> map) throws Exception;

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */

	int selectOneGetNsmTotalCount();

	List<Map<String, Object>> selectListNsmList(Map<String, Object> map);

	List<Map<String, Object>> selectListNsmFrontList(Map<String, Object> map)
			throws Exception;

	/*
	 * ========================================삭제================================
	 * ========
	 */

	void deleteNsmDelete(Map<String, Object> map) throws Exception;

	void updateNsmBnStatus(String boardNews_id);

	void updateNsmBnStatusNotice(String boardNews_id);




	


}

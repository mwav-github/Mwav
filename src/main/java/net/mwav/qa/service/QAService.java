package net.mwav.qa.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.common.common.CommandMap;

public interface QAService {

	boolean insertQAForm(Map<String, Object> map, HttpServletRequest request);

/////////////////////////////////////Goods/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 */



	/*
	 * ========================================보기================================
	 * ========
	 */


	/*
	 * ========================================수정================================
	 * ========
	 */


	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */


	/*
	 * ========================================삭제================================
	 * ========
	 */
	List<Map<String, Object>> selectListQAList(Map<String, Object> map);

	int selectOneGetTotalCount(String member_id, String uqUserEmail);

	List<Map<String, Object>> selectListQAFrontList(Map<String, Object> map);

	Map<String, Object> selectOneQAView(Map<String, Object> map);

	String selectOneQALogin(Map<String, Object> map);

	boolean uaSatisfactionUpdateAjax(Map<String, Object> map);



	
/////////////////////////////////////BoardNotices/////////////////////////////////////


	/*
	 * ========================================등록================================
	 * ========
	 */


	/*
	 * ========================================보기================================
	 * ========
	 */

	/*
	 * ========================================수정================================
	 * ========
	 */


	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */


	/*
	 * ========================================삭제================================
	 * ========
	 */

	

}

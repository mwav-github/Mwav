package net.admins.dao;

import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("boardNewsAdminsDAO")
public class BoardNewsAdminsDAO extends AbstractDAO {

	// Abstrat로 변경

	// ///////////////////////////////////BoardNews/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 */

	public void insertNsmForm(Map<String, Object> map) {
		// TODO Auto-generated method stub

		insert("boardNewsAdminsDAO.insertNsmForm", map);
	}

	/*
	 * ========================================보기================================
	 * ========
	 */

	// updateHitCnt 연관
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOneNsmView(Map<String, Object> map) {
		// TODO Auto-generated method stub

		return (Map<String, Object>) selectOne(
				"boardNewsAdminsDAO.selectOneNsmView", map);
	}

	/*
	 * ========================================수정================================
	 * ========
	 */

	@SuppressWarnings("unchecked")
	public Map<String, Object> updateNsmform(Map<String, Object> map) {
		// TODO Auto-generated method stub
	
		return (Map<String, Object>) selectOne("boardNewsAdminsDAO.updateNsmform", map);
	}
	
	public void updateProNsmform(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("boardNewsAdminsDAO.updateProNsmform", map);
	}

	// 조회수 증가
	public void updateNsmHitCnt(Map<String, Object> map) throws Exception {
		update("boardNewsAdminsDAO.updateNsmHitCnt", map);
	}

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */

	public int selectOneGetNsmTotalCount() {
		// TODO Auto-generated method stub
		return (int) selectOne("boardNewsAdminsDAO.selectOneGetNsmTotalCount");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListNsmFrontList(
			Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList(
				"boardNewsAdminsDAO.selectListNsmFrontList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListNsmList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList(
				"boardNewsAdminsDAO.selectListNsmList", map);

	}

	/*
	 * ========================================삭제================================
	 * ========
	 */

	public void deleteNsmDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("boardNewsAdminsDAO.deleteNsmDelete", map);
	}

}

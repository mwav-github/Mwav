package net.admins.dao;

import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class BoardNewsAdminsDAO extends AbstractDAO {

	/**
	 * 등록
	 * @param map
	 */
	public void insertNsmForm(Map<String, Object> map) {
		insert("boardNewsAdminsDAO.insertNsmForm", map);
	}

	/**
	 * updateHitCnt 연관
	 * @param map
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOneNsmView(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("boardNewsAdminsDAO.selectOneNsmView", map);
	}

	/**
	 * 수정
	 * @param map
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> updateNsmform(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("boardNewsAdminsDAO.updateNsmform", map);
	}

	public void updateProNsmform(Map<String, Object> map) {
		update("boardNewsAdminsDAO.updateProNsmform", map);
	}

	/**
	 * 조회수 증가
	 * @param map
	 * @throws Exception
	 */
	public void updateNsmHitCnt(Map<String, Object> map) throws Exception {
		update("boardNewsAdminsDAO.updateNsmHitCnt", map);
	}

	public int selectOneGetNsmTotalCount() {
		return (int) selectOne("boardNewsAdminsDAO.selectOneGetNsmTotalCount");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListNsmFrontList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("boardNewsAdminsDAO.selectListNsmFrontList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListNsmList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("boardNewsAdminsDAO.selectListNsmList", map);
	}

	/**
	 * 삭제
	 * @param map
	 */
	public void deleteNsmDelete(Map<String, Object> map) {
		update("boardNewsAdminsDAO.deleteNsmDelete", map);
	}

	public void updateNsmBnStatus(String boardNews_id) {
		update("boardNewsAdminsDAO.updateNsmBnStatus", boardNews_id);
	}

	public void updateNsmBnStatusNotice(String boardNews_id) {
		update("boardNewsAdminsDAO.updateNsmBnStatusNotice", boardNews_id);
	}

}

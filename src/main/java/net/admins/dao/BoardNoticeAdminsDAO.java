package net.admins.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import net.common.dao.AbstractDAO;

@Repository
public class BoardNoticeAdminsDAO extends AbstractDAO {

	/**
	 * 등록
	 * @param map
	 */
	public void insertNtmForm(Map<String, Object> map) {
		insert("boardNoticeAdminsDAO.insertNtmForm", map);
	}

	public void insertPmtNtmForm(Map<String, Object> map) {
		insert("boardNoticeAdminsDAO.insertPmtNtmForm", map);
	}

	/**
	 * 보기
	 * updateHitCnt 연관
	 * @param map
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOneNtmView(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("boardNoticeAdminsDAO.selectOneNtmView", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOnePmtNtmView(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("boardNoticeAdminsDAO.selectOnePmtNtmView", map);
	}

	/**
	 * 수정
	 * @param map
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> updateNtmform(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("boardNoticeAdminsDAO.updateNtmform", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> updatePmtNtmForm(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("boardNoticeAdminsDAO.updatePmtNtmForm", map);
	}

	public void updateProNtmform(Map<String, Object> map) {
		update("boardNoticeAdminsDAO.updateProNtmform", map);
	}

	public void updateProPmtNtmForm(Map<String, Object> map) {
		update("boardNoticeAdminsDAO.updateProPmtNtmForm", map);
	}

	/**
	 * 조회수 증가
	 * @param map
	 * @throws Exception
	 */
	public void updateNtmHitCnt(Map<String, Object> map) throws Exception {
		update("boardNoticeAdminsDAO.updateNtmHitCnt", map);
	}

	/**
	 * 조회수 증가
	 * @param map
	 * @throws Exception
	 */
	public void updatePmtNtmHitCnt(Map<String, Object> map) throws Exception {
		update("boardNoticeAdminsDAO.updateNtmHitCnt", map);
	}

	public void updatePmtNoticeStatus(Map<String, Object> map) {
		update("boardNoticeAdminsDAO.updatePmtNoticeStatus", map);
	}

	public int selectOneGetNtmTotalCount() {
		return (int) selectOne("boardNoticeAdminsDAO.selectOneGetNtmTotalCount");
	}

	public int selectOneGetPmtNtmTotalCount() {
		return (int) selectOne("boardNoticeAdminsDAO.selectOneGetPmtNtmTotalCount");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListNtmFrontList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("boardNoticeAdminsDAO.selectListNtmFrontList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListNtmList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("boardNoticeAdminsDAO.selectListNtmList", map);

	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListPmtNtmList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("boardNoticeAdminsDAO.selectListPmtNtmList", map);
	}

	/**
	 * 삭제
	 * @param map
	 */
	public void deleteNtmDelete(Map<String, Object> map) {
		update("boardNoticeAdminsDAO.deleteNtmDelete", map);
	}

	public void deletePmtNtmDelete(Map<String, Object> map) {
		update("boardNoticeAdminsDAO.deletePmtNtmDelete", map);
	}

}

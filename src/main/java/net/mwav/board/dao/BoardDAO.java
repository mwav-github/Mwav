package net.mwav.board.dao;

import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
@SuppressWarnings("unchecked")
public class BoardDAO extends AbstractDAO {

	/**
	 * board news insert
	 */
	public void insertBnsForm(Map<String, Object> map) {
		insert("board.insertBnsForm", map);
	}

	/**
	 * 보기
	 */
	public Map<String, Object> selectOneBnsView(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("board.selectOneBnsView", map);
	}

	/**
	 * 수정
	 */
	public void updateBnsform(Map<String, Object> map) {
		update("board.updateBnsform", map);
	}

	/**
	 * 조회수 증가
	 */
	public void updateNewsHitCnt(Map<String, Object> map) throws Exception {
		update("board.updateNewsHitCnt", map);
	}

	public int selectOneGetTotalCount() {
		return (int) selectOne("board.selectOneGetTotalCount");
	}

	public List<Map<String, Object>> selectListBnsFrontList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("board.selectListBnsFrontList", map);
	}

	public List<Map<String, Object>> selectListBnsList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("board.selectListBnsList", map);

	}

	/**
	 * 삭제
	 */
	public void deleteBnsDelete(Map<String, Object> map) {
		update("board.deleteBnsDelete", map);
	}

	/**
	 * regist notice
	 */
	public void insertBuForm(Map<String, Object> map) {
		insert("board.insertBuForm", map);
	}

	/**
	 * 보기
	 */
	public Map<String, Object> selectOneBuView(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("board.selectOneBuView", map);
	}

	/**
	 * 수정
	 */
	public void updateBuform(Map<String, Object> map) {
		update("board.updateBuform", map);
	}

	// 조회수 증가
	/**
	 * 조회수 증가
	 */
	public void updateNoticeHitCnt(Map<String, Object> map) throws Exception {
		update("board.updateNoticeHitCnt", map);
	}

	public int selectNoticeOneGetTotalCount() {
		return (int) selectOne("board.selectNoticeOneGetTotalCount");
	}

	public List<Map<String, Object>> selectListBuFrontList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("board.selectListBuFrontList", map);
	}

	public List<Map<String, Object>> selectListBuList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("board.selectListBuList", map);
	}

	/**
	 * 삭제
	 */
	public void deleteBuDelete(Map<String, Object> map) {
		update("board.deleteBuDelete", map);
	}
}

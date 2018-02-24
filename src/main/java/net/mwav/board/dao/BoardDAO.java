package net.mwav.board.dao;

import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {
	// BoardNews
	// regist news
	/**
	 * @description board news insert
	 * @param map
	 */
	public void insertBnsForm(Map<String, Object> map) {
		insert("board.insertBnsForm", map);
	}

	/*========================================보기========================================*/
	// updateHitCnt 연관
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOneBnsView(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("board.selectOneBnsView", map);
	}

	/*========================================수정========================================*/
	public void updateBnsform(Map<String, Object> map) {
		update("board.updateBnsform", map);
	}

	// 조회수 증가
	public void updateNewsHitCnt(Map<String, Object> map) throws Exception {
		update("board.updateNewsHitCnt", map);
	} 


	/*========================================리스트(SelectOne, SelectList 순)========================================*/
	public int selectOneGetTotalCount() {
		return (int) selectOne("board.selectOneGetTotalCount");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListBnsFrontList(
			Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList(
				"board.selectListBnsFrontList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListBnsList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("board.selectListBnsList", map);

	}

	/*========================================삭제========================================*/
	public void deleteBnsDelete(Map<String, Object> map) {
		update("board.deleteBnsDelete", map);
	}


	// BoardNotices
	// regist notice
	public void insertBuForm(Map<String, Object> map) {
		insert("board.insertBuForm", map);
	}

	/*========================================보기========================================*/
	// updateHitCnt 연관
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOneBuView(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("board.selectOneBuView", map);
	}

	/*========================================수정========================================*/

	public void updateBuform(Map<String, Object> map) {
		update("board.updateBuform", map);
	}

	// 조회수 증가
	public void updateNoticeHitCnt(Map<String, Object> map) throws Exception {
		update("board.updateNoticeHitCnt", map);
	} 


	/*========================================리스트(SelectOne, SelectList 순)========================================*/
	public int selectNoticeOneGetTotalCount() {
		return (int) selectOne("board.selectNoticeOneGetTotalCount");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListBuFrontList(
			Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("board.selectListBuFrontList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListBuList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("board.selectListBuList", map);
	}

	/*========================================삭제========================================*/
	public void deleteBuDelete(Map<String, Object> map) {
		update("board.deleteBuDelete", map);
	}
}

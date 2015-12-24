package net.mwav.board.dao;

import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {

	// Abstrat로 변경

	/*========================================등록========================================*/
	
	public void insertBnsForm(Map<String, Object> map) {
		// TODO Auto-generated method stub

		insert("board.insertBnsForm", map);
	}

	/*========================================보기========================================*/
	
	// updateHitCnt 연관
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOneBnsView(Map<String, Object> map) {
		// TODO Auto-generated method stub

		return (Map<String, Object>) selectOne("board.selectOneBnsView", map);
	}

	/*========================================수정========================================*/
	
	public void updateBnsform(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("board.updateBnsform", map);
	}
	
	// 조회수 증가
	public void updateHitCnt(Map<String, Object> map) throws Exception {
		update("board.updateHitCnt", map);
	} 


	/*========================================리스트(SelectOne, SelectList 순)========================================*/
	
	public int selectOneGetTotalCount() {
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("board.selectListBnsList",
				map);

	}

	/*========================================삭제========================================*/
	
	public void deleteBnsDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("board.deleteBnsDelete", map);
	}
	
	/////////////////////////////Notice부분////////////////////////////////////////
/*========================================등록========================================*/
	
	public void insertBnForm(Map<String, Object> map) {
		// TODO Auto-generated method stub

		insert("board.insertBnForm", map);
	}

	/*========================================보기========================================*/
	
	// updateHitCnt 연관
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOneBnView(Map<String, Object> map) {
		// TODO Auto-generated method stub

		return (Map<String, Object>) selectOne("board.selectOneBnView", map);
	}

	/*========================================수정========================================*/
	
	public void updateBnform(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("board.updateBnform", map);
	}
	
	// 조회수 증가
	public void updateNoticeHitCnt(Map<String, Object> map) throws Exception {
		update("board.updateNoticeHitCnt", map);
	} 


	/*========================================리스트(SelectOne, SelectList 순)========================================*/
	
	public int selectNoticeOneGetTotalCount() {
		// TODO Auto-generated method stub
		return (int) selectOne("board.selectNoticeOneGetTotalCount");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListBnFrontList(
			Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList(
				"board.selectListBnFrontList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListBnList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("board.selectListBnList",
				map);

	}

	/*========================================삭제========================================*/
	
	public void deleteBnDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("board.deleteBnDelete", map);
	}
}

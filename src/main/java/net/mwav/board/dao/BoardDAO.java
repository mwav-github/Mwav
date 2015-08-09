package net.mwav.board.dao;

import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO{

	// Abstrat로 변경 
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFrontList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("board.selectFrontList", map);
	}

	public List<Map<String, Object>> insertbnsForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		insert("board.insertbnsForm", map);
		return null;
	}
	
	//조회수 증가
	public void updateHitCnt(Map<String, Object> map) throws Exception{
	    update("board.updateHitCnt", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectbnsView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		return (Map<String, Object>) selectOne("board.selectbnsView", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectbnsList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		  return (List<Map<String, Object>>)selectList("board.selectbnsList", map);
	    
	}
}

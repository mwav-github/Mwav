package net.mwav.board.service;
 
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;

import net.common.common.CommandMap;
import net.mwav.board.dao.BoardDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
 
@Service("boardService")
public class BoardServiceImpl implements BoardService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	@Override
	public List<Map<String, Object>> selectFrontList(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectFrontList(map);
	}

	@Override
	public List<Map<String, Object>> insertbnsForm(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.insertbnsForm(map);
	}

	@Override
	public Map<String, Object> selectbnsView(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		boardDAO.updateHitCnt(map);
		Set set = map.entrySet();
     	Iterator iterator = set.iterator();
		while (iterator.hasNext()) {
				    Map.Entry entry = (Map.Entry)iterator.next();
				    System.out.println("key : "+entry.getKey()+", value : "+entry.getValue());
				}
		
		Map<String, Object> resultMap = boardDAO.selectbnsView(map);
		return resultMap;
	}

	@Override
	public List<Map<String, Object>> selectbnsList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		return boardDAO.selectbnsList(map);
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.deleteBoard(map);		
	}

	@Override
	public void updatebnsform(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.updatebnsform(map);		
	}

	@Override
	public int gettotalCount() {
		// TODO Auto-generated method stub
		return boardDAO.gettotalCount();		
	}
 
}
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
	
	/*========================================등록========================================*/
	@Override
	public void insertBnsForm(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		boardDAO.insertBnsForm(map);
	}

	/*========================================보기========================================*/
	@Override
	public Map<String, Object> selectOneBnsView(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		boardDAO.updateHitCnt(map);
		Set set = map.entrySet();
     	Iterator iterator = set.iterator();
		while (iterator.hasNext()) {
				    Map.Entry entry = (Map.Entry)iterator.next();
				    System.out.println("key : "+entry.getKey()+", value : "+entry.getValue());
				}
		
		Map<String, Object> resultMap = boardDAO.selectOneBnsView(map);
		return resultMap;
	}
	
	
	/*========================================수정========================================*/
	@Override
	public void updateBnsform(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.updateBnsform(map);		
	}
	
	/*========================================리스트(SelectOne, SelectList 순)========================================*/

	@Override
	public int selectOneGetTotalCount() {
		// TODO Auto-generated method stub
		return boardDAO.selectOneGetTotalCount();		
	}
	
	@Override
	public List<Map<String, Object>> selectListBnsFrontList(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectListBnsFrontList(map);
	}
	

	@Override
	public List<Map<String, Object>> selectListBnsList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		return boardDAO.selectListBnsList(map);
	}

	/*========================================삭제========================================*/
	@Override
	public void deleteBnsDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.deleteBnsDelete(map);		
	}

	

 
}
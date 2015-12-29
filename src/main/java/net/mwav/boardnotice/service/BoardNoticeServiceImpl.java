package net.mwav.boardnotice.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import net.mwav.board.dao.BoardDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
 
@Service("boardNoticeService")
public class BoardNoticeServiceImpl implements BoardNoticeService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	
	/*========================================등록========================================*/
	@Override
	public void insertBnForm(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		boardDAO.insertBnForm(map);
	}

	/*========================================보기========================================*/
	@Override
	public Map<String, Object> selectOneBnView(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		boardDAO.updateHitCnt(map);
		Set set = map.entrySet();
     	Iterator iterator = set.iterator();
		while (iterator.hasNext()) {
				    Map.Entry entry = (Map.Entry)iterator.next();
				    System.out.println("key : "+entry.getKey()+", value : "+entry.getValue());
				}
		
		Map<String, Object> resultMap = boardDAO.selectOneBnView(map);
		return resultMap;
	}
	
	
	/*========================================수정========================================*/
	@Override
	public void updateBnform(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.updateBnform(map);		
	}
	
	/*========================================리스트(SelectOne, SelectList 순)========================================*/

	@Override
	public int selectOneGetTotalCount() {
		// TODO Auto-generated method stub
		return boardDAO.selectOneGetTotalCount();		
	}
	
	@Override
	public List<Map<String, Object>> selectListBnFrontList(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectListBnFrontList(map);
	}
	

	@Override
	public List<Map<String, Object>> selectListBnList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		return boardDAO.selectListBnList(map);
	}

	/*========================================삭제========================================*/
	@Override
	public void deleteBnDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.deleteBnDelete(map);		
	}

	

 
}
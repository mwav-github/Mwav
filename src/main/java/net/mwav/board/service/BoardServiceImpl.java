package net.mwav.board.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import net.mwav.board.dao.BoardDAO;
import net.mwav.common.module.Common_Utils;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	Logger log = Logger.getLogger(this.getClass());
	Common_Utils cu = new Common_Utils();
	
	@Resource(name = "boardDAO")
	private BoardDAO boardDAO;

/////////////////////////////////////BoardNews/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 */
	@Override
	public void insertBnsForm(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("map=" + map);
		
		boardDAO.insertBnsForm(map);
	}

	/*
	 * ========================================보기================================
	 * ========
	 */
	@Override
	public Map<String, Object> selectOneBnsView(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		
		//조회수 증가 
		boardDAO.updateNewsHitCnt(map);
		
		
		Set set = map.entrySet();
		Iterator iterator = set.iterator();
		while (iterator.hasNext()) {
			Map.Entry entry = (Map.Entry) iterator.next();
			System.out.println("key : " + entry.getKey() + ", value : "
					+ entry.getValue());
		}

		Map<String, Object> resultMap = boardDAO.selectOneBnsView(map);
		resultMap.get("");
		return resultMap;
	}

	/*
	 * ========================================수정================================
	 * ========
	 */
	@Override
	public void updateBnsform(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.updateBnsform(map);
	}

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */

	@Override
	public int selectOneGetTotalCount() {
		// TODO Auto-generated method stub
		return boardDAO.selectOneGetTotalCount();
	}

	@Override
	public List<Map<String, Object>> selectListBnsFrontList(
			Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		List<Map<String, Object>> resultMap = boardDAO.selectListBnsFrontList(map);
		/*cu.selectMapList(resultMap);
		//미완성 타입변형부분은 commonutil 부분과 연계하여 좀더 생각 
		for (int i = 0; i < resultMap.size(); i++) {
		String before_date = (String) resultMap.get(i).get("bnUpdateDt");
		System.out.println("before_date"+ before_date);
		String after_date = cu.convertStringToDateFormat(before_date, "1");
		System.out.println("after_date"+ after_date);
		}*/
		return resultMap;
	}

	@Override
	public List<Map<String, Object>> selectListBnsList(Map<String, Object> map) {
		// TODO Auto-generated method stub

		return boardDAO.selectListBnsList(map);
	}

	/*
	 * ========================================삭제================================
	 * ========
	 */
	@Override
	public void deleteBnsDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.deleteBnsDelete(map);
	}

/////////////////////////////////////BoardNotices/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 */
	@Override
	public void insertBuForm(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("map = " + map);
		boardDAO.insertBuForm(map);
	}

	/*
	 * ========================================보기================================
	 * ========
	 */
	@Override
	public Map<String, Object> selectOneBuView(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		
		
		//조회수 증가
		boardDAO.updateNoticeHitCnt(map);
		
		
		Set set = map.entrySet();
		Iterator iterator = set.iterator();
		while (iterator.hasNext()) {
			Map.Entry entry = (Map.Entry) iterator.next();
			System.out.println("key : " + entry.getKey() + ", value : "
					+ entry.getValue());
		}

		Map<String, Object> resultMap = boardDAO.selectOneBuView(map);
		return resultMap;
	}

	/*
	 * ========================================수정================================
	 * ========
	 */
	@Override
	public void updateBuform(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.updateBuform(map);
	}

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */

	@Override
	public int selectNoticeOneGetTotalCount() {
		// TODO Auto-generated method stub
		return boardDAO.selectNoticeOneGetTotalCount();
	}

	@Override
	public List<Map<String, Object>> selectListBuFrontList(
			Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectListBuFrontList(map);
	}

	@Override
	public List<Map<String, Object>> selectListBuList(Map<String, Object> map) {
		// TODO Auto-generated method stub

		return boardDAO.selectListBuList(map);
	}

	/*
	 * ========================================삭제================================
	 * ========
	 */
	@Override
	public void deleteBuDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.deleteBuDelete(map);
	}

}
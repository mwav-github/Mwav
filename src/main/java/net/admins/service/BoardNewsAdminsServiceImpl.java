package net.admins.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;

import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;
import net.admins.dao.BoardNewsAdminsDAO;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardNewsAdminsService")
public class BoardNewsAdminsServiceImpl implements BoardNewsAdminsService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "boardNewsAdminsDAO")
	@Autowired(required = true)
	private BoardNewsAdminsDAO boardNewsAdminsDAO;
	Common_Utils cou = new Common_Utils();

	// ///////////////////////////////////BoardNews/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 */
	@Override
	public void insertNsmForm(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("map=" + map);
		map.put("bnStatus", 1);
		boardNewsAdminsDAO.insertNsmForm(map);
	}

	/*
	 * ========================================보기================================
	 * ========
	 */
	@Override
	public Map<String, Object> selectOneNsmView(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		boardNewsAdminsDAO.updateNsmHitCnt(map);
		
		//map 출력
		cou.selectMap(map);

		Map<String, Object> resultMap = boardNewsAdminsDAO.selectOneNsmView(map);
		int test = (int) resultMap.get("bnStatus");
		String result = cou.TypeIntToString("board", test);
		
		resultMap.put("bnStatus", result);
		
		return resultMap;
	}

	/*
	 * ========================================수정================================
	 * ========	
	 */

	@Override
	public Map<String, Object> updateNsmForm(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		return boardNewsAdminsDAO.updateNsmform(map);
	}

	@Override
	public void updateProNsmForm(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardNewsAdminsDAO.updateProNsmform(map);
	}

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */

	@Override
	public int selectOneGetNsmTotalCount() {
		// TODO Auto-generated method stub
		return boardNewsAdminsDAO.selectOneGetNsmTotalCount();
	}

	@Override
	public List<Map<String, Object>> selectListNsmFrontList(
			Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardNewsAdminsDAO.selectListNsmFrontList(map);
	}

	@Override
	public List<Map<String, Object>> selectListNsmList(Map<String, Object> map) {
		// TODO Auto-generated method stub

		return boardNewsAdminsDAO.selectListNsmList(map);
	}

	/*
	 * ========================================삭제================================
	 * ========
	 */
	@Override
	public void deleteNsmDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardNewsAdminsDAO.deleteNsmDelete(map);
	}

}
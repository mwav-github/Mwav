package net.admins.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;

import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;
import net.admins.dao.BoardNoticeAdminsDAO;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardNoticeAdminsService")
public class BoardNoticeAdminsServiceImpl implements BoardNoticeAdminsService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "boardNoticeAdminsDAO")
	@Autowired(required = true)
	private BoardNoticeAdminsDAO boardNoticeAdminsDAO;
	Common_Utils cou = new Common_Utils();

	// ///////////////////////////////////BoardNews/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 */
	@Override
	public void insertNtmForm(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("map=" + map);

		map.put("buStatus", 1);
		boardNoticeAdminsDAO.insertNtmForm(map);
	}

	@Override
	public void insertPmtNtmForm(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("map=" + map);

		map.put("bpPStatus", 1);
		boardNoticeAdminsDAO.insertPmtNtmForm(map);
	}
	/*
	 * ========================================보기================================
	 * ========
	 */
	@Override
	public Map<String, Object> selectOneNtmView(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		boardNoticeAdminsDAO.updateNtmHitCnt(map);
		Set set = map.entrySet();
		Iterator iterator = set.iterator();
		while (iterator.hasNext()) {
			Map.Entry entry = (Map.Entry) iterator.next();
			System.out.println("key : " + entry.getKey() + ", value : "
					+ entry.getValue());
		}

		Map<String, Object> resultMap = boardNoticeAdminsDAO
				.selectOneNtmView(map);
		int test = (int) resultMap.get("buStatus");
		String result = cou.TypeIntToString("board", test);
		resultMap.put("buStatus", result);

		return resultMap;
	}

	/*
	 * ========================================수정================================
	 * ========
	 */
	@Override
	public Map<String, Object> updateNtmForm(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		return boardNoticeAdminsDAO.updateNtmform(map);
	}

	@Override
	public Map<String, Object> updatePmtNtmForm(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		return boardNoticeAdminsDAO.updatePmtNtmForm(map);
	}
	
	@Override
	public void updateProNtmForm(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardNoticeAdminsDAO.updateProNtmform(map);
	}

	public void updateProPmtNtmForm(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardNoticeAdminsDAO.updateProPmtNtmForm(map);
	}	

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */

	@Override
	public int selectOneGetNtmTotalCount() {
		// TODO Auto-generated method stub
		return boardNoticeAdminsDAO.selectOneGetNtmTotalCount();
	}

	@Override
	public int selectOneGetPmtNtmTotalCount() {
		// TODO Auto-generated method stub
		return boardNoticeAdminsDAO.selectOneGetPmtNtmTotalCount();
	}	
	
	@Override
	public List<Map<String, Object>> selectListNtmFrontList(
			Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardNoticeAdminsDAO.selectListNtmFrontList(map);
	}

	@Override
	public List<Map<String, Object>> selectListNtmList(Map<String, Object> map) {
		// TODO Auto-generated method stub

		return boardNoticeAdminsDAO.selectListNtmList(map);
	}

	@Override
	public List<Map<String, Object>> selectListPmtNtmList(Map<String, Object> map) {
		// TODO Auto-generated method stub

		return boardNoticeAdminsDAO.selectListPmtNtmList(map);
	}	
	
	/*
	 * ========================================삭제================================
	 * ========
	 */
	@Override
	public void deleteNtmDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardNoticeAdminsDAO.deleteNtmDelete(map);
	}

	@Override
	public void deletePmtNtmDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardNoticeAdminsDAO.deletePmtNtmDelete(map);
	}
	
	
}
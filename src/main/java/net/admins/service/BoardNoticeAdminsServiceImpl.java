package net.admins.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;

import net.common.common.CommandMap;
import net.admins.dao.BoardNoticeAdminsDAO;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardNoticeAdminsService")
public class BoardNoticeAdminsServiceImpl implements BoardNoticeAdminsService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "boardNoticeAdminsDAO")
	@Autowired(required=true)
	private BoardNoticeAdminsDAO boardNoticeAdminsDAO;

/////////////////////////////////////BoardNews/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 */
	@Override
	public void insertNtmForm(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("map=" + map);
		
		boardNoticeAdminsDAO.insertNtmForm(map);
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

		Map<String, Object> resultMap = boardNoticeAdminsDAO.selectOneNtmView(map);
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
	public void updateProNtmForm(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardNoticeAdminsDAO.updateProNtmform(map);
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

	/*
	 * ========================================삭제================================
	 * ========
	 */
	@Override
	public void deleteNtmDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardNoticeAdminsDAO.deleteNtmDelete(map);
	}

}
package net.admins.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.admins.dao.BoardNoticeAdminsDAO;
import net.mwav.common.module.Common_Utils;

@Service
public class BoardNoticeAdminsServiceImpl implements BoardNoticeAdminsService {

	@Inject
	private BoardNoticeAdminsDAO boardNoticeAdminsDAO;

	Common_Utils cou = new Common_Utils();

	/**
	 * 등록
	 */
	@Override
	public void insertNtmForm(Map<String, Object> map) throws Exception {
		map.put("buStatus", 1);
		boardNoticeAdminsDAO.insertNtmForm(map);
	}

	@Override
	public void insertPmtNtmForm(Map<String, Object> map) throws Exception {
		map.put("bpStatus", 1);

		boardNoticeAdminsDAO.insertPmtNtmForm(map);
	}

	@Override
	public Map<String, Object> selectOneNtmView(Map<String, Object> map) throws Exception {
		boardNoticeAdminsDAO.updateNtmHitCnt(map);
		Map<String, Object> resultMap = boardNoticeAdminsDAO.selectOneNtmView(map);
		int test = (int) resultMap.get("buStatus");
		String result = cou.TypeIntToString("board", test);
		resultMap.put("buStatus", result);

		return resultMap;
	}

	@Override
	public Map<String, Object> selectOnePmtNtmView(Map<String, Object> map) throws Exception {
		boardNoticeAdminsDAO.updatePmtNtmHitCnt(map);
		Map<String, Object> resultMap = boardNoticeAdminsDAO.selectOnePmtNtmView(map);
		int bpStatus = (int) resultMap.get("bpStatus");
		resultMap.put("bpStatus", bpStatus);

		return resultMap;
	}

	/**
	 * 수정
	 */
	@Override
	public Map<String, Object> updateNtmForm(Map<String, Object> map) throws Exception {
		return boardNoticeAdminsDAO.updateNtmform(map);
	}

	@Override
	public Map<String, Object> updatePmtNtmForm(Map<String, Object> map) throws Exception {
		return boardNoticeAdminsDAO.updatePmtNtmForm(map);
	}

	@Override
	public void updateProNtmForm(Map<String, Object> map) throws Exception {
		boardNoticeAdminsDAO.updateProNtmform(map);
	}

	@Override
	public void updateProPmtNtmForm(Map<String, Object> map) throws Exception {
		boardNoticeAdminsDAO.updateProPmtNtmForm(map);
	}

	/**
	 * 공지게시, 비노출 기능
	 */
	@Override
	public void updatePmtNoticeStatus(Map<String, Object> map) throws Exception {
		boardNoticeAdminsDAO.updatePmtNoticeStatus(map);
	}

	@Override
	public int selectOneGetNtmTotalCount() {
		return boardNoticeAdminsDAO.selectOneGetNtmTotalCount();
	}

	@Override
	public int selectOneGetPmtNtmTotalCount() {
		return boardNoticeAdminsDAO.selectOneGetPmtNtmTotalCount();
	}

	@Override
	public List<Map<String, Object>> selectListNtmFrontList(Map<String, Object> map) throws Exception {
		return boardNoticeAdminsDAO.selectListNtmFrontList(map);
	}

	@Override
	public List<Map<String, Object>> selectListNtmList(Map<String, Object> map) {
		return boardNoticeAdminsDAO.selectListNtmList(map);
	}

	@Override
	public List<Map<String, Object>> selectListPmtNtmList(Map<String, Object> map) {
		return boardNoticeAdminsDAO.selectListPmtNtmList(map);
	}

	/**
	 * 삭제
	 */
	@Override
	public void deleteNtmDelete(Map<String, Object> map) throws Exception {
		boardNoticeAdminsDAO.deleteNtmDelete(map);
	}

	@Override
	public void deletePmtNtmDelete(Map<String, Object> map) throws Exception {
		boardNoticeAdminsDAO.deletePmtNtmDelete(map);
	}

}
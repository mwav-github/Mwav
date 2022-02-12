package net.admins.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import net.admins.dao.BoardNewsAdminsDAO;
import net.mwav.common.module.Common_Utils;

@Service
public class BoardNewsAdminsServiceImpl implements BoardNewsAdminsService {

	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(BoardNewsAdminsServiceImpl.class);

	@Inject
	private BoardNewsAdminsDAO boardNewsAdminsDAO;

	Common_Utils cou = new Common_Utils();

	/**
	 * 등록
	 */
	@Override
	public void insertNsmForm(Map<String, Object> map) throws Exception {
		map.put("bnStatus", 1);
		boardNewsAdminsDAO.insertNsmForm(map);
	}

	/**
	 * 보기
	 */
	@Override
	public Map<String, Object> selectOneNsmView(Map<String, Object> map) throws Exception {
		boardNewsAdminsDAO.updateNsmHitCnt(map);

		//map 출력
		cou.selectMap(map);

		Map<String, Object> resultMap = boardNewsAdminsDAO.selectOneNsmView(map);
		int test = (int) resultMap.get("bnStatus");
		String result = cou.TypeIntToString("board", test);

		resultMap.put("bnStatus", result);

		return resultMap;
	}

	/**
	 * 수정
	 */
	@Override
	public Map<String, Object> updateNsmForm(Map<String, Object> map) throws Exception {
		return boardNewsAdminsDAO.updateNsmform(map);
	}

	@Override
	public void updateProNsmForm(Map<String, Object> map) throws Exception {
		boardNewsAdminsDAO.updateProNsmform(map);
	}

	@Override
	public int selectOneGetNsmTotalCount() {
		return boardNewsAdminsDAO.selectOneGetNsmTotalCount();
	}

	@Override
	public List<Map<String, Object>> selectListNsmFrontList(Map<String, Object> map) throws Exception {
		return boardNewsAdminsDAO.selectListNsmFrontList(map);
	}

	@Override
	public List<Map<String, Object>> selectListNsmList(Map<String, Object> map) {
		return boardNewsAdminsDAO.selectListNsmList(map);
	}

	/**
	 * 삭제
	 */
	@Override
	public void deleteNsmDelete(Map<String, Object> map) throws Exception {
		boardNewsAdminsDAO.deleteNsmDelete(map);
	}

	@Override
	public void updateNsmBnStatus(String boardNews_id) {
		boardNewsAdminsDAO.updateNsmBnStatus(boardNews_id);
	}

	@Override
	public void updateNsmBnStatusNotice(String boardNews_id) {
		boardNewsAdminsDAO.updateNsmBnStatusNotice(boardNews_id);
	}

}
package net.mwav.board.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.mwav.board.dao.BoardDAO;
import net.mwav.common.module.Common_Utils;

@Service
public class BoardServiceImpl implements BoardService {

	Common_Utils cu = new Common_Utils();

	@Inject
	private BoardDAO boardDAO;

	/**
	 * 등록
	 */
	@Override
	public void insertBnsForm(Map<String, Object> map) throws Exception {
		boardDAO.insertBnsForm(map);
	}

	/**
	 * 보기
	 */
	@Override
	public Map<String, Object> selectOneBnsView(Map<String, Object> map) throws Exception {
		//조회수 증가 
		boardDAO.updateNewsHitCnt(map);

		Map<String, Object> resultMap = boardDAO.selectOneBnsView(map);
		resultMap.get("");
		return resultMap;
	}

	/**
	 * 수정
	 */
	@Override
	public void updateBnsform(Map<String, Object> map) throws Exception {
		boardDAO.updateBnsform(map);
	}

	@Override
	public int selectOneGetTotalCount() {
		return boardDAO.selectOneGetTotalCount();
	}

	@Override
	public List<Map<String, Object>> selectListBnsFrontList(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> resultMap = boardDAO.selectListBnsFrontList(map);
		return resultMap;
	}

	@Override
	public List<Map<String, Object>> selectListBnsList(Map<String, Object> map) {
		return boardDAO.selectListBnsList(map);
	}

	/**
	 * 삭제
	 */
	@Override
	public void deleteBnsDelete(Map<String, Object> map) throws Exception {
		boardDAO.deleteBnsDelete(map);
	}

	/**
	 * 등록
	 */
	@Override
	public void insertBuForm(Map<String, Object> map) throws Exception {
		boardDAO.insertBuForm(map);
	}

	/**
	 * 보기
	 */
	@Override
	public Map<String, Object> selectOneBuView(Map<String, Object> map) throws Exception {
		//조회수 증가
		boardDAO.updateNoticeHitCnt(map);

		Map<String, Object> resultMap = boardDAO.selectOneBuView(map);
		return resultMap;
	}

	/**
	 * 수정
	 */
	@Override
	public void updateBuform(Map<String, Object> map) throws Exception {
		boardDAO.updateBuform(map);
	}

	@Override
	public int selectNoticeOneGetTotalCount() {
		return boardDAO.selectNoticeOneGetTotalCount();
	}

	@Override
	public List<Map<String, Object>> selectListBuFrontList(Map<String, Object> map) throws Exception {
		return boardDAO.selectListBuFrontList(map);
	}

	@Override
	public List<Map<String, Object>> selectListBuList(Map<String, Object> map) {
		return boardDAO.selectListBuList(map);
	}

	/**
	 * 삭제
	 */
	@Override
	public void deleteBuDelete(Map<String, Object> map) throws Exception {
		boardDAO.deleteBuDelete(map);
	}

}
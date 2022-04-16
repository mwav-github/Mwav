package net.mwav.board.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	/**
	 * 등록
	 */
	void insertBnsForm(Map<String, Object> map) throws Exception;

	/**
	 * 보기
	 */
	Map<String, Object> selectOneBnsView(Map<String, Object> map) throws Exception;

	/**
	 * 수정
	 */
	void updateBnsform(Map<String, Object> map) throws Exception;

	int selectOneGetTotalCount();

	List<Map<String, Object>> selectListBnsList(Map<String, Object> map);

	List<Map<String, Object>> selectListBnsFrontList(Map<String, Object> map) throws Exception;

	/**
	 * 삭제
	 */
	void deleteBnsDelete(Map<String, Object> map) throws Exception;

	/**
	 * 등록
	 */
	void insertBuForm(Map<String, Object> map) throws Exception;

	/**
	 * 보기
	 */
	Map<String, Object> selectOneBuView(Map<String, Object> map) throws Exception;

	/**
	 * 수정
	 */
	void updateBuform(Map<String, Object> map) throws Exception;

	int selectNoticeOneGetTotalCount();

	List<Map<String, Object>> selectListBuList(Map<String, Object> map);

	List<Map<String, Object>> selectListBuFrontList(Map<String, Object> map) throws Exception;

	/**
	 * 삭제
	 */
	void deleteBuDelete(Map<String, Object> map) throws Exception;

}

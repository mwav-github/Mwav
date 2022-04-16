package net.admins.service;

import java.util.List;
import java.util.Map;

public interface BoardNoticeAdminsService {

	/**
	 * 등록
	 * @param map
	 * @throws Exception
	 */
	void insertNtmForm(Map<String, Object> map) throws Exception;

	void insertPmtNtmForm(Map<String, Object> map) throws Exception;

	/**
	 * 보기
	 * @param map
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectOneNtmView(Map<String, Object> map) throws Exception;

	Map<String, Object> selectOnePmtNtmView(Map<String, Object> map) throws Exception;

	/**
	 * 수정
	 * @param map
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> updateNtmForm(Map<String, Object> map) throws Exception;

	Map<String, Object> updatePmtNtmForm(Map<String, Object> map) throws Exception;

	void updateProNtmForm(Map<String, Object> map) throws Exception;

	void updateProPmtNtmForm(Map<String, Object> map) throws Exception;

	void updatePmtNoticeStatus(Map<String, Object> map) throws Exception;

	int selectOneGetNtmTotalCount();

	int selectOneGetPmtNtmTotalCount();

	List<Map<String, Object>> selectListNtmList(Map<String, Object> map);

	List<Map<String, Object>> selectListPmtNtmList(Map<String, Object> map);

	List<Map<String, Object>> selectListNtmFrontList(Map<String, Object> map) throws Exception;

	/**
	 * 삭제
	 * @param map
	 * @throws Exception
	 */
	void deleteNtmDelete(Map<String, Object> map) throws Exception;

	void deletePmtNtmDelete(Map<String, Object> map) throws Exception;

}

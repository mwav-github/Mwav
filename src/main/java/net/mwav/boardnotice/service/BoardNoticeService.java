package net.mwav.boardnotice.service;

import java.util.List;
import java.util.Map;

import net.common.common.CommandMap;

public interface BoardNoticeService {

	/*========================================등록========================================*/
	
	void insertBnForm(Map<String, Object> map) throws Exception;
	
	/*========================================보기========================================*/
	
	Map<String, Object> selectOneBnView(Map<String, Object> map) throws Exception;

	/*========================================수정========================================*/
	void updateBnform(Map<String, Object> map) throws Exception;

	/*========================================리스트(SelectOne, SelectList 순)========================================*/

	int selectOneGetTotalCount();
	
    List<Map<String, Object>> selectListBnList(Map<String, Object> map);
	
	List<Map<String, Object>> selectListBnFrontList(Map<String, Object> map) throws Exception;
	
	/*========================================삭제========================================*/
	
	void deleteBnDelete(Map<String, Object> map) throws Exception;
	


	
}

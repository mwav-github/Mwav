package net.mwav.boardnotice.service;

import java.util.List;
import java.util.Map;

import net.common.common.CommandMap;

public interface BoardNoticeService {

	/*========================================등록========================================*/
	
	void insertBuForm(Map<String, Object> map) throws Exception;
	
	/*========================================보기========================================*/
	
	Map<String, Object> selectOneBuView(Map<String, Object> map) throws Exception;

	/*========================================수정========================================*/
	void updateBuform(Map<String, Object> map) throws Exception;

	/*========================================리스트(SelectOne, SelectList 순)========================================*/

	int selectOneGetTotalCount();
	
    List<Map<String, Object>> selectListBuList(Map<String, Object> map);
	
	List<Map<String, Object>> selectListBuFrontList(Map<String, Object> map) throws Exception;
	
	/*========================================삭제========================================*/
	
	void deleteBuDelete(Map<String, Object> map) throws Exception;
	


	
}

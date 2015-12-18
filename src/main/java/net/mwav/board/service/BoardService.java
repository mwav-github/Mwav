package net.mwav.board.service;

import java.util.List;
import java.util.Map;

import net.common.common.CommandMap;

public interface BoardService {

	/*========================================등록========================================*/
	
	void insertBnsForm(Map<String, Object> map) throws Exception;
	
	/*========================================보기========================================*/
	
	Map<String, Object> selectOneBnsView(Map<String, Object> map) throws Exception;

	/*========================================수정========================================*/
	void updateBnsform(Map<String, Object> map) throws Exception;

	/*========================================리스트(SelectOne, SelectList 순)========================================*/

	int selectOneGetTotalCount();
	
    List<Map<String, Object>> selectListBnsList(Map<String, Object> map);
	
	List<Map<String, Object>> selectListBnsFrontList(Map<String, Object> map) throws Exception;
	
	/*========================================삭제========================================*/
	
	void deleteBnsDelete(Map<String, Object> map) throws Exception;

	
}

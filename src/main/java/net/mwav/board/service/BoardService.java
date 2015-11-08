package net.mwav.board.service;

import java.util.List;
import java.util.Map;

import net.common.common.CommandMap;

public interface BoardService {

	List<Map<String, Object>> selectFrontList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> insertbnsForm(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectbnsView(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectbnsList(Map<String, Object> map);
	
	void deleteBoard(Map<String, Object> map) throws Exception;

	void updatebnsform(Map<String, Object> map) throws Exception;

	int gettotalCount();
}

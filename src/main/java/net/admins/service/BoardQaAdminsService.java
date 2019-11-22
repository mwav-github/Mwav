package net.admins.service;

import java.util.List;
import java.util.Map;

import net.common.common.CommandMap;

public interface BoardQaAdminsService {

	void insertQnAForm(Map<String, Object> map);

	Map<String, Object> selectOneQnAView(Map<String, Object> map);

	List<Map<String, Object>> selectListQnAList(Map<String, Object> map);

	int selectOneGetQnATotalCount();

	void deleteQnADelete(Map<String, Object> map);

	List<Map<String, Object>> selectListQnAFrontList(Map<String, Object> map);

	boolean insertQnAUaForm(Map<String, Object> map) throws Exception;

	boolean updateQnAUaForm(Map<String, Object> map);

/////////////////////////////////////BoardNews/////////////////////////////////////



}

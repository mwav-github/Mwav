package net.mwav.member.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import net.common.common.CommandMap;

public interface MemberService {

	/*========================================등록========================================*/
	
	Map<String, Object> insertMbrForm(Map<String, Object> map);

	/*========================================보기========================================*/
	Map<String, Object> selectMbrView(Map<String, Object> map);

	/*========================================수정========================================*/
	boolean updateMbrLoginPw(Map<String, Object> map) throws IOException;
	
	boolean updateMbrTempLoginPw(Map<String, Object> map); 


	/*========================================리스트(SelectOne, SelectList 순)========================================*/
	Map<String, Object> selectLogin(Map<String, Object> map) throws Exception;

	boolean selectOneMbrLoginIdCheck(String mbrLoginId);
	
	String selectOneMbrLoginIdSeek(Map<String, Object> map);

	boolean selectOneMbrTempLoginPwSeek(Map<String, Object> map);
	
	
	/*========================================삭제========================================*/
	boolean deleteMbrDelete(Map<String, Object> map);

	
	List<String> selectGunguFinder(String sido);

	List<Map<String, Object>> selectpostList_2(Map<String, Object> map);





	

}

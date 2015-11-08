package net.mwav.member.service;

import java.util.List;
import java.util.Map;

import net.common.common.CommandMap;

public interface MemberService {

	Map<String, Object> selectLogin(Map<String, Object> map) throws Exception;

	Map<String, Object> insertMemberForm(Map<String, Object> map);

	Map<String, Object> selectMemberView(Map<String, Object> map);

	boolean selectIdCheck(String mbrLoginId);
	
	String selectIdFinder(Map<String, Object> map);

	List<String> selectGunguFinder(String sido);

	List<Map<String, Object>> selectpostList_2(Map<String, Object> map);

	boolean selectPWFinder(Map<String, Object> map);

	boolean updateMemberDelete(Map<String, Object> map);

	boolean selectimsiPWFinder(Map<String, Object> map);

	boolean updatePw(Map<String, Object> map);

}

package net.mwav.member.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mwav.member.vo.Member_tbl_VO;

public interface MemberService {

	/*========================================등록========================================*/
	
	Map<String, Object> insertMbrForm(Map<String, Object> map) throws Exception;

	/*========================================보기========================================*/
	Map<String, Object> selectMbrView(Map<String, Object> map);

	/*========================================수정========================================*/
	boolean updateMbrLoginPw(Map<String, Object> map) throws IOException;
	
	Map<String, Object> updateMbrForm(Map<String, Object> map);
	
	void updateProMbrform(Map<String, Object> map);

	boolean updateMbrTempLoginPw(Map<String, Object> map); 


	/*========================================리스트(SelectOne, SelectList 순)========================================*/
	Map<String, Object> selectLogin(Map<String, Object> map) throws Exception;

	boolean selectOneMbrLoginIdCheck(String mbrLoginId);
	
	
	List<String> selectOneMbrLoginIdSeek(Map<String, Object> map);
	
	String selectOneMbrLoginPWSeek(Map<String, Object> map);

	boolean selectOneMbrTempLoginPwSeek(Map<String, Object> map);
	
	
	/*========================================삭제========================================*/
	boolean deleteMbrDelete(Map<String, Object> map);

	
	List<String> selectListZcGunGuSeek(String zcSiDoName);

	List<Map<String, Object>> selectListZcAll(Map<String, Object> map);
	
	/*======================================페북 로그인======================================*/
	Map<String, Object> insertSnsForm(Map<String, Object> map);
	
	boolean selectOneSnsMbrLoginIdCheck(String fsmMember_id);

	String selectOneMemberPkCheck ();

	String selectOneSmMemberPkCheck(String smMember_id);

	boolean updateAutoLogin(String onOff, HttpServletResponse response,
			int member_id);
	
	boolean updateAutoLoginDel(HttpServletRequest request,HttpSession session, HttpServletResponse response);
	
	Member_tbl_VO selectAutoLogin(int member_id);
}

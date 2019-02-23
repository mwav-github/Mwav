package net.mwav.member.service;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mwav.common.module.EmailSender;
import net.mwav.member.dao.MemberDAO;
import net.mwav.member.vo.Member_tbl_VO;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.util.WebUtils;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	Logger log = Logger.getLogger(this.getClass());

	byte[] encrypted = null;

	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;

	@Autowired
	EmailSender emailSender;

	/*
	 * ========================================등록================================
	 * ========
	 */

	/**
	 * @date 2016.04.27
	 * @author Kim YJ
	 * @see 서비스단 로직 활용
	 */
	@Transactional
	@Override
	public String insertMbrForm(Map<String, Object> map) {

		String result = null;

		String b_mbrLoginPw = String.valueOf(map.get("mbrLoginPw"));
		if (b_mbrLoginPw.isEmpty()) { // 비번처리 로직
			return "pwEmpty"; // null exception 처리
		} else if (b_mbrLoginPw.length() < 8 || b_mbrLoginPw.length() > 15) {
			return "pwLengthWrong"; // pw 자리수 return
		} else if (b_mbrLoginPw.trim().length() == 0) {
			return "pwWrongType"; // 공백일 경우 처리
		}

		String mbrCellPhone = (String)map.get("mbrCellPhone");
		map.put("mbrCellPhone", mbrCellPhone);

		String mbrName = String.valueOf(map.get("mbrFirstName"))
				+ String.valueOf(map.get("mbrMiddleName"))
				+ String.valueOf(map.get("mbrLastName"));
		map.put("mbrName", mbrName);

		String mbrAddress_1 = String.valueOf(map.get("mbrAddress_1"));
		String mbrAddress_2 = String.valueOf(map.get("mbrAddress_2"));
		if (mbrAddress_1 == null && mbrAddress_2 == null) {
			map.put("mbrAddress", null);
		} else {
			map.put("mbrAddress", mbrAddress_1 + mbrAddress_2);
		}

		result = memberDAO.insertMbrForm(map);
		String snsLogin = (String) map.get("sns_imsi");
		System.out.println("이메일간다?" + result);
//&& snsLogin != null

		//회원가입 메일 발송
		if ("insertForm Success".equals(result) ) {
			try {
				System.out.println("이메일");
				emailSender.sendRegistrationEmail(map);
			} catch (Exception e) { // TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return result;
	}

	/*
	 * ========================================보기================================
	 * ========
	 */

	@Override
	public Map<String, Object> selectMbrView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.selectMbrView(map);
	}

	/*
	 * ========================================수정================================
	 * ========
	 */

	@Override
	public Map<String, Object> updateMbrForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.updateMbrForm(map);
	}

	@Override
	public void updateProMbrform(Map<String, Object> map) {
		// TODO Auto-generated method stub
		memberDAO.updateProMbrform(map);
		return;
	}

	@Override
	public boolean updateMbrLoginPw(Map<String, Object> map) throws IOException {
		// TODO Auto-generated method stub

		boolean flag = false;
		flag = memberDAO.updateMbrLoginPw(map);
		return flag;
	}

	@Override
	public boolean updateMbrTempLoginPw(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boolean flag = memberDAO.updateMbrTempLoginPw(map);
		/*
		 * if (flag = false) { flag = false; } else { flag = true;
		 * memberDAO.selectPWFinder(map); }
		 */
		return flag;
	}

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */

	@Override
	public boolean selectOneMbrLoginIdCheck(String mbrLoginId) {
		// TODO Auto-generated method stub
		return memberDAO.selectOneMbrLoginIdCheck(mbrLoginId);
	}

	@Override
	public List<String> selectOneMbrLoginIdSeek(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.selectOneMbrLoginIdSeek(map);
	}

	@Override
	public String selectOneMbrLoginPWSeek(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.selectOneMbrLoginPWSeek(map);
	}

	@Override
	public boolean selectOneMbrTempLoginPwSeek(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boolean flag = memberDAO.selectOneMbrTempLoginPwSeek(map);
		/*
		 * if (flag = false) { flag = false; } else { flag = true;
		 * memberDAO.selectPWFinder(map); }
		 */
		return flag;
	}

	/*
	 * ========================================삭제================================
	 * ========
	 */
	@Override
	public boolean deleteMbrDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.deleteMbrDelete(map);
	}

	@Override
	public List<String> selectListZcGunGuSeek(String zcSiDoName) {
		// TODO Auto-generated method stub
		return memberDAO.selectListZcGunGuSeek(zcSiDoName);
	}

	@Override
	public List<Map<String, Object>> selectListZcAll(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.selectListZcAll(map);
	}

	@Override
	public Map<String, Object> selectLogin(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectLogin(map);
	}

	@Override
	public Map<String, Object> insertSnsForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDAO.insertSnsForm(map);
	}

	@Override
	public boolean selectOneSnsMbrLoginIdCheck(String smMember_id) {
		// TODO Auto-generated method stub
		return memberDAO.selectOneSnsMbrLoginIdCheck(smMember_id);
	}

	@Override
	public String selectOneMemberPkCheck() {
		// TODO Auto-generated method stub
		return memberDAO.selectOneMemberPkCheck();
	}

	@Override
	public String selectOneSmMemberPkCheck(String smMember_id) {
		// TODO Auto-generated method stub
		return memberDAO.selectOneSmMemberPkCheck(smMember_id);
	}

	@Override //오토로그인 날짜데이터 추가
	public boolean updateAutoLogin(String onOff, HttpServletResponse response,	int member_id) {
		System.out.println("autologin안에 들어옴");
		System.out.println("autologin 값"+onOff);
		if (onOff!=null&&onOff.equals("on")) {
			  System.out.println("autologin실행됨");
		      //int amount = 60 * 60 * 24 * 14; //일주일
		      long amount = 60 * 60 * 24 * 180; //반년 주의) 반년계산시에는 int 형은 안된다.
		      HashMap<String,Object> map = new HashMap<String,Object>();
		      map.put("member_id", member_id);
		      map.put("mbrAutoLoginDt", new Date(System.currentTimeMillis() + (1000 * amount)));
		      memberDAO.updateAutoLogin(map);
		      //쿠키박스
		      Cookie loginCookie = new Cookie("autoLogin", Integer.toString(member_id));
		      loginCookie.setPath("/");
		      //반년 설정 (쿠키)
		      loginCookie.setMaxAge(180 * 24 * 60 * 60);
		      response.addCookie(loginCookie);
		      return true;
		}else{
			return false;
		}


	}

	@Override //오토로그인 날짜데이터 삭제
	public boolean updateAutoLoginDel(HttpServletRequest request,HttpSession session, HttpServletResponse response) {
			Cookie loginCookie = WebUtils.getCookie(request, "autoLogin");
			Member_tbl_VO member = (Member_tbl_VO)session.getAttribute("member");
		    if(member!=null){
			System.out.println("세션의 멤버가 눌이 아님");
		    	if (loginCookie != null) {
			        loginCookie.setPath("/");
			        loginCookie.setValue(null);
			        loginCookie.setMaxAge(0);
			        response.addCookie(loginCookie);;
			        System.out.println("오토로그인 삭제 성공");
			        return memberDAO.updateAutoLoginDel(member.getMember_id());

		    	}
		    }
		    return false;
	}



	@Override
	public Member_tbl_VO selectAutoLogin(int member_id) {
		return memberDAO.selectAutoLogin(member_id);
	}
}
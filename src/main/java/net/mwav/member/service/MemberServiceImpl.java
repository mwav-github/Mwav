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

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailAuthenticationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.util.WebUtils;

import net.mwav.common.module.AesEncryption;
import net.mwav.common.module.EmailSender;
import net.mwav.common.module.ValidationLib;
import net.mwav.member.dao.MemberDAO;
import net.mwav.member.vo.Member_tbl_VO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	Logger log = Logger.getLogger(this.getClass());

	byte[] encrypted = null;

	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;

	@Autowired
	EmailSender emailSender;
	/*
	 * ========================================등록========================================
	 */

	/**
	 * @date 2016.04.27
	 * @author Kim YJ
	 * @see 서비스단 로직 활용
	 */
	@Transactional(rollbackFor = { Exception.class }, readOnly = false)
	@Override
	public Map<String, Object> insertMbrForm(Map<String, Object> map) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			ValidationLib validation = ValidationLib.getInstance();
			// 1. 아이디 중복 검사
			if (!selectOneMbrLoginIdCheck(map.get("mbrLoginId").toString())) {
				result.put("result", "31");
				result.put("message", "DUPLICATED");
				return result;
			}

			// 2. 유효성 검증(추후에 유효성 검증 구현체 개발 시 변환)
			boolean isValid = validation.matches(map.get("mbrLoginId").toString(), "^[a-zA-Z]{1}[a-zA-Z0-9_-]{3,19}$")
					|| validation.matches(map.get("mbrLoginPw").toString(), "^(?=.*[\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\\\\\=\\(\\'\\\"])(?=.*[0-9])(?=.*[a-zA-Z])[\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\\\\\=\\(\\'\\\"0-9a-zA-Z]{8,255}$")
					|| validation.isKorName(map.get("mbrFirstName").toString(), map.get("mbrLastName").toString()) 
					|| validation.iskorCellurar(map.get("mbrCellPhone").toString()) 
					|| validation.isEmail(map.get("mbrEmail").toString());
			if (!isValid) {
				result.put("result", "42");
				result.put("message", "INVALID");
				return result;
			}

			// 3. Member_id 추출(멀티 유저 transaction을 고려해보면 추후 수정필요하다 사료됨)
			map.put("member_id", selectOneMemberPkCheck());

			// 4. 비밀번호 암호화
			String b_mbrLoginPw = map.get("mbrLoginPw").toString();
			//AES/CBC/IV 암호화 (키,암호화텍스트,iv)
			encrypted = AesEncryption.aesEncryptCbc(AesEncryption.sKey, b_mbrLoginPw, AesEncryption.sInitVector);
			String sBase = AesEncryption.aesEncodeBuf(encrypted);
			if (sBase == null) {
				result.put("result", "99");
				result.put("message", "EXCEPTION");
			}
			map.put("mbrLoginPw", sBase);

			// 5. Member_tbl, MemberValue_tbl insert
			if (memberDAO.insertMbrForm(map) == 0) {
				result.put("result", "30");
				result.put("message", "NO_AFFECTED");
			}
			
			memberDAO.insertMemberValue_tbl(map);
			emailSender.sendRegistrationEmail(map);
			result.put("result", "1");
			result.put("message", "SUCCESS");
		} catch (MailAuthenticationException e) {
			e.printStackTrace();
			result.put("result", "91");
			result.put("message", "MAIL_EXCEPTION");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
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
	public Map<String, Object> selectLogin(Map<String, Object> map) throws Exception {
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
	public boolean updateAutoLogin(String onOff, HttpServletResponse response, int member_id) {
		System.out.println("autologin안에 들어옴");
		System.out.println("autologin 값" + onOff);
		if (onOff != null && onOff.equals("on")) {
			System.out.println("autologin실행됨");
			//int amount = 60 * 60 * 24 * 14; //일주일
			long amount = 60 * 60 * 24 * 180; //반년 주의) 반년계산시에는 int 형은 안된다.
			HashMap<String, Object> map = new HashMap<String, Object>();
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
		} else {
			return false;
		}

	}

	@Override //오토로그인 날짜데이터 삭제
	public boolean updateAutoLoginDel(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		Cookie loginCookie = WebUtils.getCookie(request, "autoLogin");
		Member_tbl_VO member = (Member_tbl_VO) session.getAttribute("member");
		if (member != null) {
			System.out.println("세션의 멤버가 눌이 아님");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setValue(null);
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				;
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
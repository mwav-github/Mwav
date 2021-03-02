package net.mwav.member.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.Message;
import javax.servlet.ServletContext;

import net.mwav.common.module.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailAuthenticationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.mwav.member.dao.MemberDAO;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.servlet.view.velocity.VelocityConfigurer;

@Service
public class SignService {
	@Inject
	MemberDAO memberDao;

	@Resource(name = "memberService")
	private MemberService memberService;

	/**
	 * 
	 * @method name : naverCallBack
	 * @author : (정) 남동희
	             (부)
	 * @since  : 2019. 7. 13.
	 * @version : v1.1
	 * @see :
	 * @description : 네이버 로그인 처리 이미 가입된 사용자면 로그인 처리 신규 사용자면 DB에 저장 후 로그인 처리
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
	        수정일                수정자                   수정내용
	   --------    --------    ----------------
	   2019.7. 13. 남동희     	       최초 생성
	 * @param :  Map userInfoMap - 네이버 프로필을 통해 받은 사용자 정보<br>
	 * @return : Map - 처리 결과
	 * @throws : 
	 */
	@Transactional(rollbackFor = { Exception.class }, readOnly = false)
	public Map<String, Object> signService(Map<String, Object> userInfoMap) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();

		try {
			// 네이버 로그인의 경우 email을 id로 대체
			String email = userInfoMap.get("email").toString();

			// select smMember_id from SnsMember_tbl where smMember_id IN (#{smMember_id});
			boolean isExistUser = memberDao.selectOneSnsMbrLoginIdCheck(email);

			// 기 가입된 사용자인 경우 로그인 처리를 위해 memberId return
			if (isExistUser) {
				result.put("result", "11");
				result.put("message", "LOGIN");
				// select member_id from SnsMember_tbl where smMember_id = #{smMember_id};
				result.put("memberId", Integer.parseInt(memberDao.selectOneSmMemberPkCheck(email)));
				return result;
			}

			// 신규 사용자인 경우
			Map<String, Object> signUpMap = new HashMap<String, Object>();
			// select IFNULL(max(member_id+1) , 100000) AS member_id from Member_tbl
			String member_id = memberDao.selectOneMemberPkCheck();
			result.put("memberId", Integer.parseInt(member_id));

			signUpMap.put("member_id", member_id);
			signUpMap.put("mbrLoginId", email);
			signUpMap.put("mbrLoginPw", "");
			signUpMap.put("mbrFirstName", userInfoMap.get("name"));
			signUpMap.put("mbrLastName", userInfoMap.get("name"));
			signUpMap.put("mbrEmail", email);
			signUpMap.put("mbrCellPhone", "");

			if (memberDao.insertMbrForm(signUpMap) == 0) {
				result.put("result", "30");
				result.put("message", "NO_AFFECTED");
			}

			// snsMember_tbl - MAX(snsMember_id) + 1
			signUpMap.put("snsMember_id", memberDao.selectNextSnsPk());
			memberDao.insertMemberValue(signUpMap);

			// sns 테이블 INSERT
			Map<String, Object> snsMap = new HashMap<String, Object>();
			snsMap.put("smMember_id", email);
			snsMap.put("First_Name", userInfoMap.get("name"));
			snsMap.put("Email", email);
			snsMap.put("member_id", member_id);

			memberDao.insertSnsForm(snsMap);

//			emailSender.sendRegistrationEmail(signUpMap);
			// 멤버에게 회원가입 성공 메일 발송
			memberService.emailMemberSender(signUpMap);
			// 관리자에게 멤버 회원가입 알림 메일 발송
			memberService.emailAdminSender();

			result.put("result", "1");
			result.put("message", "SUCCESS");

		} catch (MailAuthenticationException e) {
			e.printStackTrace();
			result.put("result", "91");
			result.put("message", "MAIL_EXCEPTION");
		} catch (Exception e) {
			throw e;
		}

		return result;
	}

}

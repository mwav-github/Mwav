package net.mwav.member.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.mwav.common.module.EmailSender;
import net.mwav.member.dao.MemberDAO;

@Service
public class SignService {
	@Inject
	MemberDAO memberDao;

	@Inject
	EmailSender emailSender;

	/**
	 * 네이버 로그인 처리
	 * 이미 가입된 사용자면 로그인 처리
	 * 신규 사용자면 DB에 저장 후 로그인 처리
	 * @param userInfoMap ex) {resultcode=00, message=success, response={id=45211094, email=7837167@naver.com, name=남동희}}
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> signService(Map<String, Object> userInfoMap) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();

		try {
			// 네이버 로그인의 경우 email을 id로 대체
			String email = userInfoMap.get("email").toString();
			
			//select smMember_id from SnsMember_tbl where smMember_id IN (#{smMember_id});
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
			//select IFNULL(max(member_id+1) , 100000) AS member_id from Member_tbl
			String member_id = memberDao.selectOneMemberPkCheck();

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
			memberDao.insertMemberValue_tbl(signUpMap);
			
			// sns 테이블 INSERT
			Map<String, Object> snsMap = new HashMap<String, Object>();
			snsMap.put("smMember_id", email);
			snsMap.put("First_Name", userInfoMap.get("name"));
			snsMap.put("Email", email);
			snsMap.put("member_id", member_id);
			
			memberDao.insertSnsForm(snsMap);
			
			emailSender.sendRegistrationEmail(signUpMap);
			result.put("result", "1");
			result.put("message", "SUCCESS");
			result.put("memberId", Integer.parseInt(member_id));

		} catch (Exception e) {
			throw e;
		}

		return result;
	}

}

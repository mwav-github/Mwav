package net.bizlogin.user.signin.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import net.bizlogin.common.service.Recaptcha;
import net.bizlogin.user.signin.dao.SignInDao;
import net.mwav.framework.cryption.AES128Lib;

/**
 * 로그인
 */
@Service
public class SignInService {

	@Inject
	private SignInDao signInDao;

	@Inject
	private Recaptcha recaptcha;

	public Map<String, Object> signin(Map<String, Object> param) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		String pmtLoginId = (String) param.get("pmtLoginId");
		String pmtLoginPw = (String) param.get("pmtLoginPw");
		String token = (String) param.get("token");

		boolean isValid = !StringUtils.isEmpty(pmtLoginId) && pmtLoginId.length() >= 3
				&& !StringUtils.isEmpty(pmtLoginPw) && pmtLoginPw.length() >= 3;

		// 1. 유효성 검증
		if (!isValid) {
			result.put("status", "INVALID_PARAM");
			result.put("msg", "아이디와 비밀번호를 확인해주세요.");
			return result;
		}

		// 2. ReCaptcha 유효성 검증
		if (!recaptcha.verify(token)) {
			result.put("status", "INVALID_PARAM");
			result.put("msg", "로봇으로 감지되었습니다. 다시 시도해주세요");
			return result;
		}

		// 3. 비밀번호 암호화
		AES128Lib aes128Lib = AES128Lib.getInstance();
		result.put("pmtLoginPw", aes128Lib.encryptToString("Mwav.net", "Mwav", pmtLoginPw));

		// 4. DB에서 pmtLoginId & pmtLoginPw 이 일치하는 로우를 가져옴
		Map<String, Object> promoter = signInDao.getPromoter(param);

		if (promoter == null) {
			result.put("status", "INVALID_PARAM");
			result.put("msg", "아이디와 비밀번호를 확인해주세요.");
			return result;
		}

		if (promoter.get("pmtCertifyDt") == null) {
			result.put("status", "NOT_CERTIFICATED");
			result.put("msg", "이메일 인증이 필요합니다.");
			return result;
		}

		result.put("status", "LOGIN_SUCCESS");
		result.put("msg", "로그인에 성공하였습니다.");
		result.put("promoter", promoter);

		return result;
	}

}

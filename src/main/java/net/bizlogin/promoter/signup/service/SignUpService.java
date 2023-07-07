package net.bizlogin.promoter.signup.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.impl.client.HttpClientBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.bizlogin.common.service.PasswordEncoder;
import net.bizlogin.promoter.signup.dao.SignUpDao;
import net.mwav.framework.ValidationLib;

@Service
public class SignUpService {

	private static final Logger logger = LoggerFactory.getLogger(SignUpService.class);

	@Inject
	private SignUpDao signUpDao;

	@Inject
	private PasswordEncoder passwordEncoder;
	
	/**
	 * 회원찾기
	 */
	public Map<String, Object> getPromoter(Map<String, Object> param) {
		return signUpDao.getPromoter(param);
	}

	/**
	 * 회원가입
	 */
	@Transactional(rollbackFor = { Exception.class }, readOnly = false)
	public Map<String, Object> signup(Map<String, Object> param) throws Exception {
		Map<String, Object> result = new HashMap<>();

		String pmtLoginId = (String) param.get("pmtLoginId");
		String pmtLoginPw = (String) param.get("pmtLoginPw");
		String pmtFirstName = (String) param.get("pmtFirstName");
		String pmtLastName = (String) param.get("pmtLastName");
		String pmtCellularPhone = (String) param.get("pmtCellularPhone");
		String pmtMail = (String) param.get("pmtMail");

		// 1. 아이디 중복 검사
		if (signUpDao.getPromoter(param) != null) {
			result.put("status", "DUPLICATED");
			result.put("msg", "중복된 아이디입니다.");
			return result;
		}

		// 2. 유효성 검증(추후에 유효성 검증 구현체 개발 시 변환)
		ValidationLib validation = ValidationLib.getInstance();
		boolean isValid = validation.matches(pmtLoginId, "^[a-zA-Z]{1}[a-zA-Z0-9_-]{3,19}$") && validation.matches(
				pmtLoginPw,
				"^(?=.*[\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\\\\\=\\(\\'\\\"])(?=.*[0-9])(?=.*[a-zA-Z])[\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\\\\\=\\(\\'\\\"0-9a-zA-Z]{8,255}$")
				&& validation.isKorName(pmtFirstName, pmtLastName) && validation.iskorCellurar(pmtCellularPhone)
				&& validation.isEmail(pmtMail);

		if (!isValid) {
			result.put("status", "INVALID_PARAM");
			result.put("msg", "유효하지 않은 입력정보입니다.");
			return result;
		}

		// 3. 비밀번호 암호화, 암호화된 값이 String으로 반환
		param.put("pmtLoginPw", passwordEncoder.encode(pmtLoginPw));

		signUpDao.createPromoter(param);
		signUpDao.createPromoterValue(param);
		signUpDao.createPromoterValueLog(param);

		result.put("status", "SUCCESS");
		result.put("msg", "회원가입에 성공하였습니다.");

		return result;
	}

	/**
	 * 인증 메일 발송
	 */
	public void sendVerificationMail(Map<String, Object> param) throws ClientProtocolException, IOException {
		String serverUrl = (String) param.get("serverUrl");
		String pmtMail = (String) param.get("pmtMail");
		String promoterId = String.valueOf(param.get("promoter_id"));

		logger.debug(param.toString());

		// 이메일 발송
		String uri = serverUrl + "/accounts/email/certify";
		HttpClient client = HttpClientBuilder.create().build();
		HttpUriRequest req = RequestBuilder.post().setUri(uri).addParameter("email", pmtMail)
				.addParameter("account", "pmt").addParameter("id", promoterId).build();
		HttpResponse response = client.execute(req);
		int statusCode = response.getStatusLine().getStatusCode();
		logger.debug("statusCode : " + statusCode);
	}

}

package net.bizLogin.promoter.service;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.net.ssl.HttpsURLConnection;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.mail.MailAuthenticationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import net.bizLogin.promoter.dao.PmtFacilitatorDAO;
import net.bizLogin.promoter.vo.BizPromoter_VO;
import net.bizLogin.promoter.vo.PmtFacilitatorSO;
import net.bizLogin.promoter.vo.PmtFacilitatorVO;
import net.common.common.CommandMap;
import net.mwav.common.module.AesEncryption;
import net.mwav.common.module.ValidationLib;
import net.mwav.framework.cryption.AES128Lib;

/**
 * 프로모터 로그인
 * @author 공태현
 *
 */
@Service
public class PmtFacilitatorServiceImpl implements PmtFacilitatorService {

	@Inject
	private PmtFacilitatorDAO pmtFacilitatorDAO;

	/**
	 * 프로모터 등록여부 확인
	 */
	public boolean selectOnePmtLoginIdCheck(String stfLoginId) throws Exception {
		return pmtFacilitatorDAO.selectOnePmtLoginIdCheck(stfLoginId) == 0 ? true : false;
	}

	/**
	 * 프로모터 등록
	 */
	@Transactional
	@Override
	public Map<String, Object> insertPmtForm(CommandMap commandMap) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();

		try {
			ValidationLib validation = ValidationLib.getInstance();
			// 1. 아이디 중복 검사
			if (!selectOnePmtLoginIdCheck((String) commandMap.get("pmtLoginId"))) {
				result.put("result", "31");
				result.put("message", "DUPLICATED");
				return result;
			}

			// 2. 유효성 검증(추후에 유효성 검증 구현체 개발 시 변환)
			boolean isValid = validation.matches((String) commandMap.get("pmtLoginId").toString(), "^[a-zA-Z]{1}[a-zA-Z0-9_-]{3,19}$")
					&& validation.matches((String) commandMap.get("pmtLoginPw").toString(), "^(?=.*[\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\\\\\=\\(\\'\\\"])(?=.*[0-9])(?=.*[a-zA-Z])[\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\\\\\=\\(\\'\\\"0-9a-zA-Z]{8,255}$")
					&& validation.isKorName((String) commandMap.get("pmtFirstName").toString(), (String) commandMap.get("pmtLastName").toString())
					&& validation.iskorCellurar((String) commandMap.get("pmtCellularPhone").toString()) && validation.isEmail((String) commandMap.get("pmtMail").toString());
			if (!isValid) {
				result.put("result", "42");
				result.put("message", "INVALID");
				return result;
			}

			// 3. 비밀번호 암호화, 암호화된 값이 String으로 반환
			final AES128Lib aes128Lib = AES128Lib.getInstance();
			String pmtLoginPw = (String) commandMap.get("pmtLoginPw");
			byte[] encrypted = aes128Lib.encrypt("Mwav.net", "Mwav", pmtLoginPw);

			commandMap.put("pmtLoginPw", AesEncryption.aesEncodeBuf(encrypted));
			if (encrypted == null) {
				result.put("result", "99");
				result.put("message", "EXCEPTION");
				return result;
			}

			// 4. 성별 코드 변경 및 이름의 공백 제거
			String pmtGender = (String) commandMap.get("pmtGender");
			commandMap.put("pmtGender", (pmtGender.equals("M") ? "0" : "1"));

			String pmtFirstName = commandMap.get("pmtFirstName").toString().trim();
			String pmtLastName = commandMap.get("pmtLastName").toString().trim();
			commandMap.put("pmtFirstName", pmtFirstName);
			commandMap.put("pmtLastName", pmtLastName);

			// 5. Promoter_tbl insertPromoter_tbl
			pmtFacilitatorDAO.insertPromoter_tbl(commandMap);

			// 6. PromoterValue_tbl insertPromoterValue_tbl
			pmtFacilitatorDAO.insertPromoterValue_tbl(commandMap);

			// 7. PromoterValueLog_tbl
			commandMap.put("pvlRemark", "신규 회원가입");
			pmtFacilitatorDAO.insertPromoterValueLog_tbl(commandMap);

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

	@Override
	public PmtFacilitatorVO checkSocialJoin(PmtFacilitatorSO so) {
		PmtFacilitatorVO vo = pmtFacilitatorDAO.checkSocialJoin(so);
		return vo;
	}

	@Override
	public PmtFacilitatorVO joinSocialLogin(PmtFacilitatorSO so) {
		PmtFacilitatorVO check = checkSocialJoin(so); // boolean 말고 VO로 받아서 밑에 if문에서 id가 null인지 체크
		// 기가입된 소셜계정이 아니라면 가입시킨다
		if (check == null) {
			pmtFacilitatorDAO.joinSocialLogin(so); // insert 한 뒤 error나는 경우 처리 해주기
			check = checkSocialJoin(so);
		}
		return check; // return VO를 해준다..
	}

	@Override
	public Map<String, Object> login(Map<String, Object> param) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();
		String pmtLoginId = (String) param.get("pmtLoginId");
		String pmtLoginPw = (String) param.get("pmtLoginPw");
		String token = (String) param.get("token");

		boolean isValid = !StringUtils.isEmpty(pmtLoginId) && pmtLoginId.length() >= 3 && !StringUtils.isEmpty(pmtLoginPw) && pmtLoginPw.length() >= 3;

		// 1. 유효성 검증
		if (!isValid) {
			result.put("status", "INVALID_PARAM");
			result.put("msg", "아이디와 비밀번호를 확인해주세요.");
			return result;
		}

		// 2. ReCaptcha 유효성 검증
		if (!recaptcha(token)) {
			result.put("status", "INVALID_PARAM");
			result.put("msg", "로봇으로 감지되었습니다. 다시 시도해주세요");
			return result;
		}

		// 3. 비밀번호 암호화
		AES128Lib aes128Lib = AES128Lib.getInstance();
		result.put("pmtLoginPw", aes128Lib.encryptToString("Mwav.net", "Mwav", pmtLoginPw));

		// 4. DB에서 pmtLoginId & pmtLoginPw 이 일치하는 로우를 가져옴
		BizPromoter_VO bizPromoterVo = pmtFacilitatorDAO.selectBizPmtLogin(param);

		if (bizPromoterVo == null) {
			result.put("status", "INVALID_PARAM");
			result.put("msg", "아이디와 비밀번호를 확인해주세요.");
			return result;
		}

		if (bizPromoterVo.getPmtCertifyDt() == null) {
			result.put("status", "NOT_CERTIFICATED");
			result.put("msg", "이메일 인증이 필요합니다.");
			return result;
		}

		result.put("status", "LOGIN_SUCCESS");
		result.put("msg", "로그인에 성공하였습니다.");
		result.put("promoter", bizPromoterVo);

		return result;
	}

	@Override
	public boolean sendCertifyMail(String serverUrl, String pmtMail, String promoter_id) throws IOException {

		// 이메일 발송
		final String uri = serverUrl + "/accounts/email/certify";
		HttpClient client = HttpClientBuilder.create().build();
		HttpUriRequest req = RequestBuilder.post().setUri(uri).addParameter("email", pmtMail).addParameter("account", "pmt").addParameter("id", promoter_id).build();
		HttpResponse response = client.execute(req);
		int statusCode = response.getStatusLine().getStatusCode();
		System.out.println(statusCode);

		return false;
	}

	@Override
	public String selectOnePmtId(String pmtLoginId) {
		return pmtFacilitatorDAO.selectOnePmtId(pmtLoginId);
	}

	@Override
	public int updatePmtEmail(String changeEmail, String promoter_id) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("changeEmail", changeEmail);
		param.put("promoter_id", promoter_id);

		return pmtFacilitatorDAO.updatePmtEmail(param);
	}

	public boolean recaptcha(String token) {
		//TODO: 임시용으로 VerifyRecaptcha 의 메소드 기능만 빼와서 사용. 추후 교체요망
		final String SECRET_KEY = "6LdhTbYbAAAAAHFtrOEfPcyjW7XwgWGwxY0RrLVe";
		final String SITE_VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify";

		if (token == null || token.length() == 0) {
			return false;
		}

		try {
			URL verifyUrl = new URL(SITE_VERIFY_URL);

			// Open Connection to URL
			HttpsURLConnection conn = (HttpsURLConnection) verifyUrl.openConnection();

			// Add Request Header
			conn.setRequestMethod("POST");

			// Data will be sent to the server.
			String postParams = "secret=" + SECRET_KEY + "&response=" + token;

			// Send Request
			conn.setDoOutput(true);

			// Get the output stream of Connection
			// Write data in this stream, which means to send data to Server.
			OutputStream outStream = conn.getOutputStream();
			outStream.write(postParams.getBytes());

			outStream.flush();
			outStream.close();

			// Response code return from server.
			// HTTP.STATUS CODE
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode=" + responseCode);

			// Get the InputStream from Connection to read data sent from the
			// server.
			InputStream is = conn.getInputStream();

			JsonReader jsonReader = Json.createReader(is);
			JsonObject jsonObject = jsonReader.readObject();
			jsonReader.close();

			System.out.println("Response: " + jsonObject);

			boolean success = jsonObject.getBoolean("success");
			return success;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

}

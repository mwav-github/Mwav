package net.common.common;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.mail.Message;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.velocity.VelocityConfigurer;

import net.bizlogin.promoter.manage.dao.ManageDao;
import net.mwav.common.module.MailConfig;
import net.mwav.common.module.MailLib;
import net.mwav.common.module.MessageBuilder;
import net.mwav.common.module.SecurityLib;
import net.mwav.common.module.XmlLib;

@Controller
@RequestMapping("/accounts/email")
public class AccountEmailCertify {
	private static final Logger logger = LoggerFactory.getLogger(AccountEmailCertify.class);

	@Inject
	ServletContext servletContext;

	@Inject
	private ManageDao manageDao;

	@Inject
	VelocityConfigurer velocityConfig;

	private final String EncryptKey = "EncryptKey";

	/**
	 * <pre>description : 이메일 인증 발송, 성공여부와 메세지를 응답함</pre>
	 * @param id    :   Member, Promoter의 LoginId
	 * @param account   : Member, Promoter 등의 구분자 (member or promoter)
	 * @param email :   발송할 이메일
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/certify")
	public ResponseEntity<Map<String, String>> certify(@RequestParam(required = true) String email, @RequestParam(required = true) String account, @RequestParam(required = true) String id, HttpServletResponse res) throws Exception {
		Map<String, String> body = new HashMap<String, String>();

		// 구분자에 맞춰 DB에서 인증여부 검색
		switch (account) {
		case "pmt":
			//  매개변수로 받은 프로모터가 이미 인증을 받았는지 확인
			Map<String, Object> param = new HashMap<>();
			param.put("promoter_id", id);
			Map<String, Object> promoter = manageDao.getPromoter(param);
			
			if (promoter == null || promoter.isEmpty()) {
				body.put("status", "NOT_EXIST");
				body.put("msg", "존재하지 않는 사용자 입니다.");
				return new ResponseEntity<Map<String, String>>(body, HttpStatus.BAD_REQUEST);				
			}
			
			boolean isVerified = (promoter.get("pmtCertifyDt") == null) ? false : true;
			if (isVerified) {
				body.put("status", "ALREADY");
				body.put("msg", "이미 인증받은 사용자입니다.");
				return new ResponseEntity<Map<String, String>>(body, HttpStatus.BAD_REQUEST);				
			}

			break;
		case "member": // Member는 미구현
		default:
			body.put("status", "BAD_REQUEST");
			body.put("msg", "잘못된 요청입니다.");
			return new ResponseEntity<Map<String, String>>(body, HttpStatus.BAD_REQUEST);
		}

		// 이메일 설정 불러오기
		final String realPath = servletContext.getRealPath("/xConfig/mail.xml.config");
		XmlLib xmlLib = XmlLib.getInstance();
		MailConfig config = (MailConfig) xmlLib.unmarshal(realPath, MailConfig.class);

		// id 및 account, time 이중 암호화
		// TODO: IV 하드코딩, 별도의 관리 필요
		SecurityLib securityLib = SecurityLib.getInstance();
		String encryptAccount = securityLib.encryptToString(EncryptKey, "account", account);
		String encryptId = securityLib.encryptToString(EncryptKey, "id", id);
		String encryptTime = securityLib.encryptToString(EncryptKey, "time", String.valueOf(new Date().getTime()));

		String encryptQuery = securityLib.encryptToString(EncryptKey, "total", encryptAccount + encryptId + encryptTime);
		encryptQuery = encryptQuery.replaceAll("/", "~");

		// 이메일 양식 작성
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("key", encryptQuery);

		//client에서 템플릿엔진 라이브러리르 호출하여 html코드로 파싱 후 문자열로 반환
		String content = VelocityEngineUtils.mergeTemplateIntoString(velocityConfig.createVelocityEngine(), "/GeneralMail/AccountCertify.vm", "UTF-8", map);

		// TODO: 이메일 템플릿 작성 필요, 배포시 도메인을 수정해야함
		Message msg = new MessageBuilder(config.getCollectAllFieldProp()).setRecipient(email).setFrom(config.getFrom()).setSubject("[Mwav] 이메일 인증").setContent(content).build();

		// 메일 발송
		MailLib mailLib = MailLib.getInstance();
		mailLib.send(msg);

		//  메일 발송 성공여부를 status와 msg를 통해 넘겨줌
		body.put("status", "SEND_MAIL");
		body.put("msg", "인증 메일을 발송하였습니다.");
		return new ResponseEntity<>(body, HttpStatus.OK);
	}

	/**
	 * <pre>description : 이메일로 받은 URL를 받아 암호화된 email, account, id를 복호화 후 인증확인 후 DB에 등록</pre>
	 * @param key    :     account, id, time 암호문
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/authority/{key}")
	public String authority(@PathVariable(value = "key") String key, Model model, HttpServletResponse res) throws Exception {
		String view = "/CommonApps/AccountCertification/CheckCertify";

		// TODO: IV 하드코딩, 별도의 관리 필요
		String[] ivList = { "account", "id", "time" };
		Map<String, Object> keyMap = new HashMap<String, Object>();

		// 잘못된 암호문 요청시 복호화 에러로 인해 예외처리
		try {
			// path로 받은 key를 복호화
			SecurityLib securityLib = SecurityLib.getInstance();

			key = key.replaceAll("~", "/");
			final String decryptKey = securityLib.decryptToString(EncryptKey, "total", key);

			// key를 분배 후 복호화하여 map에 등록
			StringTokenizer tokenizer = new StringTokenizer(decryptKey, "==");

			int index = 0;
			while (tokenizer.hasMoreTokens()) {
				keyMap.put(ivList[index], securityLib.decryptToString(EncryptKey, ivList[index], tokenizer.nextToken() + "=="));
				index += 1;
			}
		} catch (Exception ex) {
			logger.error(ex.getMessage());
			return "redirect: /";
		}

		// time값이 30분 이내인지 유효성 체크, 1800000 = 30분(1 milliseconds)
		Long keyTime = Long.valueOf(String.valueOf(keyMap.get("time")));
		Long nowTime = new Date().getTime() - 1800000;
		if (nowTime > keyTime) {
			model.addAttribute("status", "TIME_OUT");
			model.addAttribute("msg", "인증 유효기간이 지났습니다.");
			return view;
		}

		// 구분자에 맞춰 DB에서 인증여부 검색
		switch (String.valueOf(keyMap.get("account"))) {
		case "pmt":
			//  매개변수로 받은 프로모터가 이미 인증을 받았는지 확인
			keyMap.put("promoter_id", keyMap.get("id"));
			Map<String, Object> promoter = manageDao.getPromoter(keyMap);
			if (promoter == null || promoter.isEmpty()) {
				return "redirect: /";
			}
			
			boolean isVerified = (promoter.get("pmtCertifyDt") == null) ? false : true;
			if (isVerified) {
				model.addAttribute("status", "ALREADY");
				model.addAttribute("msg", "이미 인증받은 사용자입니다.");
				return view;
			}
			break;
		case "member": // Member는 미구현
		default:
			return "redirect: /";
		}

		//  DB에 이메일 인증을 현재 날짜로 입력함
		manageDao.updateCertifyDt(keyMap);

		//  인증 성공여부를 status, msg로 페이지에 넘겨줌
		model.addAttribute("status", "SUCCESS");
		model.addAttribute("msg", "이메일 인증되었습니다.");
		return view;
	}

}

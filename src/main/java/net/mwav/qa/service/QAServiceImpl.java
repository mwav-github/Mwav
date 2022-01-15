package net.mwav.qa.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.Message;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.servlet.view.velocity.VelocityConfigurer;

import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.EmailSender;
import net.mwav.common.module.MailConfig;
import net.mwav.common.module.MailLib;
import net.mwav.common.module.MessageBuilder;
import net.mwav.common.module.XmlLib;
import net.mwav.qa.dao.QADAO;

@Service
public class QAServiceImpl implements QAService {
	Common_Utils cou = new Common_Utils();

	@Inject
	private QADAO qaDAO;

	@Inject
	EmailSender emailSender;

	@Inject
	VelocityConfigurer velocityConfig;

	/*
	 * ========================================등록================================
	 * ========
	 */
	@Override
	public boolean insertQAForm(Map<String, Object> map, HttpServletRequest request) throws Exception {
		String uqIpAddress = null;
		uqIpAddress = cou.getClientIP(request);
		map.put("uqIpAddress", uqIpAddress);

		// 신규등록 문의접수 1
		map.put("uqStatus", "1");

		// 재문의 인 경우
		String imsi_flag = qaDAO.insertQAForm(map, request);
		boolean flag = false;

		if (imsi_flag != null) {
			flag = true;

			map.put("QnA_id", imsi_flag);
			//QA문의 발송
			//				emailSender.sendQuestionEmail(map);

			String path = String.valueOf(map.get("xmlPath"));
			System.out.println("패스 : " + path);
			MailConfig mailConfig = (MailConfig) XmlLib.getInstance().unmarshal(path, MailConfig.class);

			//메일 문의 답변 템플릿
			String content = VelocityEngineUtils.mergeTemplateIntoString(velocityConfig.createVelocityEngine(), "QnAnswer/Question.vm", "UTF-8", map);

			//문의자에게 답변 메일 발신
			Message recipientMsg = new MessageBuilder(mailConfig.getCollectAllFieldProp()).setSubject("[고객센터] Mwav에서 문의하신 내용이 접수되었습니다.") //제목
					.setContent(content) //내용
					.setFrom("webmaster@mwav.net") //발신자
					.setRecipient((String) map.get("uqUserEmail")) //수신자
					.build();
			MailLib.getInstance().send(recipientMsg);

		} else if (imsi_flag == null) {
			flag = false;
		}
		return flag;
	}

	@Override
	public List<Map<String, Object>> selectListQAList(Map<String, Object> map) {
		return qaDAO.selectListQAList(map);
	}

	/*
	 * ========================================보기================================
	 * ========
	 */
	@Override
	public int selectOneGetTotalCount(String member_id, String uqUserEmail) {
		return qaDAO.selectOneGetTotalCount(member_id, uqUserEmail);
	}

	@Override
	public List<Map<String, Object>> selectListQAFrontList(Map<String, Object> map) {
		return qaDAO.selectListQAFrontList(map);
	}

	@Override
	public Map<String, Object> selectOneQAView(Map<String, Object> map) {
		try {
			qaDAO.updateQAHitCnt(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		Map<String, Object> resultMap = qaDAO.selectOneQAView(map);
		return resultMap;
	}

	@Override
	public String selectOneQALogin(Map<String, Object> map) {
		return qaDAO.selectOneQALogin(map);
	}

	@Override
	public boolean uaSatisfactionUpdateAjax(Map<String, Object> map) {
		return qaDAO.uaSatisfactionUpdateAjax(map);
	}

}
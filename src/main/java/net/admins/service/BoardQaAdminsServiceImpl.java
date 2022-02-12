package net.admins.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.Message;

import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.servlet.view.velocity.VelocityConfigurer;

import net.admins.dao.BoardQaAdminsDAO;
import net.admins.vo.Staff_VO;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.MailConfig;
import net.mwav.common.module.MailLib;
import net.mwav.common.module.MessageBuilder;
import net.mwav.common.module.XmlLib;

@Service
public class BoardQaAdminsServiceImpl implements BoardQaAdminsService {

	@Inject
	VelocityConfigurer velocityConfig;

	@Inject
	private BoardQaAdminsDAO boardQaAdminsDAO;

	Common_Utils cou = new Common_Utils();

	@Override
	public void insertQnAForm(Map<String, Object> map) {
		boardQaAdminsDAO.insertQnAForm(map);
	}

	@Override
	public Map<String, Object> selectOneQnAView(Map<String, Object> map) {
		boardQaAdminsDAO.updateQnAHitCnt(map);
		Map<String, Object> resultMap = boardQaAdminsDAO.selectOneQnAView(map);
		return resultMap;
	}

	@Override
	public List<Map<String, Object>> selectListQnAList(Map<String, Object> map) {
		return boardQaAdminsDAO.selectListQnAList(map);
	}

	@Override
	public int selectOneGetQnATotalCount() {
		return boardQaAdminsDAO.selectOneGetQnATotalCount();
	}

	@Override
	public void deleteQnADelete(Map<String, Object> map) {
		boardQaAdminsDAO.deleteQnADelete(map);
	}

	@Override
	public List<Map<String, Object>> selectListQnAFrontList(Map<String, Object> map) {
		return boardQaAdminsDAO.selectListQnAFrontList(map);
	}

	/**
	 * 답변
	 */
	@Override
	public boolean insertQnAUaForm(Map<String, Object> map) throws Exception {

		boolean check = boardQaAdminsDAO.insertQnAUaForm(map);

		//메일 발송 
		String path = String.valueOf(map.get("xmlPath"));
		MailConfig mailConfig = (MailConfig) XmlLib.getInstance().unmarshal(path, MailConfig.class);
		MailLib mail = MailLib.getInstance();

		String title = String.valueOf(map.get("uaTitle"));
		String contents = String.valueOf(map.get("uaContent"));
		String recipient = String.valueOf(map.get("uaEmail"));

		Staff_VO staff = (Staff_VO) map.get("staff");

		//메일 문의 답변 템플릿
		String content = VelocityEngineUtils.mergeTemplateIntoString(velocityConfig.createVelocityEngine(), "QnAnswer/QuestionAnswer.vm", "UTF-8", map);

		//문의자에게 답변 메일 발신
		Message recipientMsg = new MessageBuilder(mailConfig.getCollectAllFieldProp()).setSubject("[고객센터] Mwav에서 문의하신 내용에 답변이 등록되었습니다.") //제목
				.setContent(content) //내용
				.setFrom("webmaster@mwav.net") //발신자
				.setRecipient(recipient) //수신자
				.build();
		mail.send(recipientMsg);

		//관리자에게 답변성공 메시지
		Message msg = new MessageBuilder(mailConfig.getCollectAllFieldProp()).setSubject(staff.getStfNickname() + "님이 " + String.valueOf(map.get("QnA_id")) + "번의 문의 답변을 보냈습니다.") //제목
				.setContent("답변: " + title + "\n" + contents) //내용
				.setFrom("webmaster@mwav.net") //발신자
				.setRecipient(mailConfig.getUser()) //수신자
				.build();
		mail.send(msg);

		return check;
	}

	@Override
	public boolean updateQnAUaForm(Map<String, Object> map) {
		return boardQaAdminsDAO.updateQnAUaForm(map);
	}

}
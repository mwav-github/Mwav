package net.admins.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.mail.Message;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
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

@Service("boardQaAdminsService")
public class BoardQaAdminsServiceImpl implements BoardQaAdminsService {
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	VelocityConfigurer velocityConfig;
	
	@Resource(name = "boardQaAdminsDAO")
	
	@Autowired(required = true)
	private BoardQaAdminsDAO boardQaAdminsDAO;
	Common_Utils cou = new Common_Utils();
	
	
	@Override
	public void insertQnAForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardQaAdminsDAO.insertQnAForm(map);
	}
	@Override
	public Map<String, Object> selectOneQnAView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardQaAdminsDAO.updateQnAHitCnt(map);
		Set set = map.entrySet();
		Iterator iterator = set.iterator();
		while (iterator.hasNext()) {
			Map.Entry entry = (Map.Entry) iterator.next();
			System.out.println("key : " + entry.getKey() + ", value : "
					+ entry.getValue());
		}

		Map<String, Object> resultMap = boardQaAdminsDAO.selectOneQnAView(map);
		return resultMap;
	}
	@Override
	public List<Map<String, Object>> selectListQnAList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardQaAdminsDAO.selectListQnAList(map);
	}
	@Override
	public int selectOneGetQnATotalCount() {
		// TODO Auto-generated method stub
		return boardQaAdminsDAO.selectOneGetQnATotalCount();
	}
	@Override
	public void deleteQnADelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardQaAdminsDAO.deleteQnADelete(map);
	}
	@Override
	public List<Map<String, Object>> selectListQnAFrontList(
			Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardQaAdminsDAO.selectListQnAFrontList(map);
	}
	
	//===============답변===============
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
		
		Staff_VO staff = (Staff_VO)map.get("staff");
		
		//메일 문의 답변 템플릿
		String content = VelocityEngineUtils.mergeTemplateIntoString(velocityConfig.createVelocityEngine(), "QnAnswer/Question.vm", "UTF-8", map);
		
		//문의자에게 답변 메일 발신
		Message recipientMsg = new MessageBuilder(mailConfig.getCollectAllFieldProp())
						.setSubject(title)		//제목
//						.setContent(contents)		//내용
						.setContent(content)
						.setFrom(mailConfig.getUser())					//발신자
						.setRecipient(recipient)	//수신자
						.build();
		mail.send(recipientMsg);
		
		//관리자에게 답변성공 메시지
		Message msg = new MessageBuilder(mailConfig.getCollectAllFieldProp())
				.setSubject(staff.getStfNickname()+"님이 " + String.valueOf(map.get("QnA_id")) + "번의 문의 답변을 보냈습니다.")		//제목
				.setContent("답변: " + title+"\n"+contents)		//내용
				.setFrom(staff.getStfEmail())					//발신자
				.setRecipient(mailConfig.getUser())	//수신자
				.build();
		mail.send(msg);
		
		return check;
	}
	@Override
	public boolean updateQnAUaForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardQaAdminsDAO.updateQnAUaForm(map);
	}
	
	


}
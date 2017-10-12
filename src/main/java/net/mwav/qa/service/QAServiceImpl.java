package net.mwav.qa.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;
import net.mwav.common.module.EmailSender;
import net.mwav.qa.dao.QADAO;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("qaService")
public class QAServiceImpl implements QAService {
	Logger log = Logger.getLogger(this.getClass());
	Common_Utils cou = new Common_Utils();

	@Resource(name = "qaDAO")
	private QADAO qaDAO;

	@Autowired
	EmailSender emailSender;

	/*
	 * ========================================등록================================
	 * ========
	 */

	@Override
	public boolean insertQAForm(Map<String, Object> map,
			HttpServletRequest request) {
		// TODO Auto-generated method stub

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
			try {
				map.put("QnA_id", imsi_flag);
				
				//QA문의 발송
				/*emailSender.sendQuestionEmail(map);*/
			} catch (Exception e) { // TODO Auto-generated catch block
				e.printStackTrace();
			} // 메일발송
		} else if (imsi_flag == null) {
			flag = false;
		}
		return flag;
	}

	@Override
	public List<Map<String, Object>> selectListQAList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return qaDAO.selectListQAList(map);
	}

	/*
	 * ========================================보기================================
	 * ========
	 */

	@Override
	public int selectOneGetTotalCount(String member_id, String uqUserEmail) {
		// TODO Auto-generated method stub
		return qaDAO.selectOneGetTotalCount(member_id, uqUserEmail);
	}

	@Override
	public List<Map<String, Object>> selectListQAFrontList(
			Map<String, Object> map) {
		// TODO Auto-generated method stub
		return qaDAO.selectListQAFrontList(map);
	}

	@Override
	public Map<String, Object> selectOneQAView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		try {
			qaDAO.updateQAHitCnt(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/*
		 * //map 출력 cou.selectMap(map);
		 */

		Map<String, Object> resultMap = qaDAO.selectOneQAView(map);

		return resultMap;
	}

	@Override
	public String selectOneQALogin(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return qaDAO.selectOneQALogin(map);
	}

	@Override
	public boolean uaSatisfactionUpdateAjax(Map<String, Object> map) {
		// TODO Auto-generated method stub
		/*
		 * if (uaSatisfaction == 0){ uaSatisfaction = 0; }else if(uaSatisfaction
		 * == 1){ uaSatisfaction = 20; }else if(uaSatisfaction == 2){
		 * uaSatisfaction = 40; }else if(uaSatisfaction == 3){ uaSatisfaction =
		 * 60; }else if(uaSatisfaction == 4){ uaSatisfaction = 80; }else
		 * if(uaSatisfaction == 5){ uaSatisfaction = 100; }
		 */
		return qaDAO.uaSatisfactionUpdateAjax(map);
	}

	/*
	 * ========================================수정================================
	 * ========
	 */

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */

	/*
	 * ========================================삭제================================
	 * ========
	 */

}
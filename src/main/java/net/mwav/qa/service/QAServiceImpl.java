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
import net.mwav.qa.dao.QADAO;
import net.mwav.shop.dao.GoodsDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("qaService")
public class QAServiceImpl implements QAService {
	Logger log = Logger.getLogger(this.getClass());
	Common_Utils cou = new Common_Utils();
	
	@Resource(name = "qaDAO")
	private QADAO qaDAO;

	/*
	 * ========================================등록================================
	 * ========
	 */

	@Override
	public boolean insertQAForm(Map<String, Object> map, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		String uqIpAddress = null;
		uqIpAddress = cou.getClientIP(request);
		map.put("uqIpAddress", uqIpAddress);
		
		boolean flag = qaDAO.insertQAForm(map, request);
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
				
				/*//map 출력
				cou.selectMap(map);*/

				Map<String, Object> resultMap = qaDAO.selectOneQAView(map);
				
				return resultMap;
	}

	@Override
	public Map<String, Object> selectOneQALogin(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return qaDAO.selectOneQALogin(map);
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
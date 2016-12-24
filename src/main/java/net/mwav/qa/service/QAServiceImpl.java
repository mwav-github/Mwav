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

	/*
	 * ========================================보기================================
	 * ========
	 */

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
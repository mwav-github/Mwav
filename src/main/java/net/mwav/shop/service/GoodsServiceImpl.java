package net.mwav.shop.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;

import net.common.common.CommandMap;
import net.mwav.shop.dao.GoodsDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "goodsDAO")
	private GoodsDAO goodsDAO;

	@Override
	public List<Map<String, Object>> selectListGdsList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsDAO.selectListGdsList(map);
	}

	@Override
	public int selectOneGetGdsTotalCount() {
		// TODO Auto-generated method stub
		return goodsDAO.selectOneGetGdsTotalCount();
	}

	

	/*
	 * ========================================등록================================
	 * ========
	 */



	/*
	 * ========================================보기================================
	 * ========
	 */
	
	@Override
	public Map<String, Object> selectOneGdsView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsDAO.selectOneGdsView(map);
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



	
/////////////////////////////////////BoardNotices/////////////////////////////////////


	/*
	 * ========================================등록================================
	 * ========
	 */


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
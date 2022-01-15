package net.mwav.shop.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import net.mwav.shop.dao.GoodsDAO;

@Service
public class GoodsServiceImpl implements GoodsService {
	Logger log = Logger.getLogger(this.getClass());

	@Inject
	private GoodsDAO goodsDAO;

	@Override
	public List<Map<String, Object>> selectListGdsList(Map<String, Object> map) {
		return goodsDAO.selectListGdsList(map);
	}

	@Override
	public int selectOneGetGdsTotalCount() {
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
		return goodsDAO.selectOneGdsView(map);
	}

}
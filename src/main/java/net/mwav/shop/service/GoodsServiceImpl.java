package net.mwav.shop.service;

import net.mwav.shop.dao.GoodsDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

@Service
public class GoodsServiceImpl implements GoodsService {
	private static final Logger logger = LoggerFactory.getLogger(GoodsServiceImpl.class);

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
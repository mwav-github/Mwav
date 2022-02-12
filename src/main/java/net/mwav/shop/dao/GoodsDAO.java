package net.mwav.shop.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import net.common.dao.AbstractDAO;

@Repository
@SuppressWarnings("unchecked")
public class GoodsDAO extends AbstractDAO {

	/*
	 * ========================================보기================================
	 * ========
	 */
	public Map<String, Object> selectOneGdsView(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("goods.selectOneGdsView", map);
	}

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */
	public List<Map<String, Object>> selectListGdsList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("goods.selectListGdsList", map);
	}

	public int selectOneGetGdsTotalCount() {
		return (int) selectOne("goods.selectOneGetGdsTotalCount");
	}

}

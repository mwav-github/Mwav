package net.mwav.shop.dao;

import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("goodsDAO")
public class GoodsDAO extends AbstractDAO {

	// Abstrat로 변경

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

	// ///////////////////////////////////BoardNotices/////////////////////////////////////

	/*
	 * ========================================등록================================
	 * ========
	 */

	/*
	 * ========================================보기================================
	 * ========
	 */
	public Map<String, Object> selectOneGdsView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne(
				"goods.selectOneGdsView", map);
	}

	/*
	 * ========================================수정================================
	 * ========
	 */

	/*
	 * ========================================리스트(SelectOne, SelectList
	 * 순)========================================
	 */

	public List<Map<String, Object>> selectListGdsList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList(
				"goods.selectListGdsList", map);
	}

	public int selectOneGetGdsTotalCount() {
		// TODO Auto-generated method stub
		return (int) selectOne("goods.selectOneGetGdsTotalCount");
	}

	/*
	 * ========================================삭제================================
	 * ========
	 */

}

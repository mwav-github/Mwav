package net.admins.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import net.common.dao.AbstractDAO;

@Repository
@SuppressWarnings("unchecked")
public class GoodsAdminsDAO extends AbstractDAO {

	public Map<String, Object> insertGdsForm(Map<String, Object> map) {
		String selectNextPk = null;
		selectNextPk = (String) selectOne("goodsAdmins.selectNextGoodsPk");
		map.put("goods_id", selectNextPk);
		insert("goodsAdmins.insertGdsForm", map);
		return map;
	}

	public Map<String, Object> modifyGoodsFiles(Map<String, Object> map) {
		insert("goodsAdmins.modifyGoodsFiles", map);
		return map;
	}

	public int selectOneGetGdsTotalCount() {
		return (int) selectOne("goodsAdmins.selectOneGetGdsTotalCount");
	}

	public void insertGdsFiles(Map<String, Object> map) {
		insert("goodsAdmins.insertGdsFiles", map);
	}

	public String selectNextPk() {
		String selectNextPk = null;
		selectNextPk = (String) selectOne("goodsAdmins.selectNextGoodsPk");
		return selectNextPk;
	}

	public List<Map<String, Object>> selectListGdsFilesList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("goodsAdmins.selectListGdsFilesList", map); // Membertbl
	}

	public List<Map<String, Object>> selectListGdsList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("goodsAdmins.selectListGdsList", map); // Membertbl
	}

	public Map<String, Object> updateGdsForm(Map<String, Object> map) {
		Map<String, Object> imsi_gdsMasterMap = (Map<String, Object>) selectOne("goodsAdmins.updateGdsform", map);
		return imsi_gdsMasterMap;
	}

	public void updateProGdsform(Map<String, Object> map) {
		update("goodsAdmins.updateProGdsform", map);
	}

	public Map<String, Object> selectOneGdsView(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("goodsAdmins.selectOneGdsView", map);
	}

	public List<Map<String, Object>> selectCategoryGoodsList() {
		return (List<Map<String, Object>>) selectList("goods.selectCategoryGoodsList");
	}

	public void deleteGdsDelete(Map<String, Object> map) {
		update("goodsAdmins.deleteGdsDelete", map);
	}

}

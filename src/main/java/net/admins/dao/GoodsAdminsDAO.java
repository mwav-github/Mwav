package net.admins.dao;

import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("goodsAdminsDAO")
public class GoodsAdminsDAO extends AbstractDAO {

	public void insertGdsForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		insert("goods.insertGdsForm", map); // Membertbl
	}
	
	public int selectOneGetGdsTotalCount() {
		// TODO Auto-generated method stub
		return (int) selectOne("goods.selectOneGetGdsTotalCount");
	}
	
	public void insertGdsFiles(Map<String, Object> map) {
		// TODO Auto-generated method stub
		selectOne("goods.selectNextGoodsPk"); 
		insert("goods.insertGdsFiles", map); // Membertbl
	}
	
	public String selectNextPk() {
		// TODO Auto-generated method stub
		System.out.println("시작");
		String selectNextPk = null;
		//System.out.println("11=="+selectOne("goodsAdminsDAO.selectNextPk"));
		selectNextPk = (String) selectOne("goods.selectNextGoodsPk"); 
		
		//selectNextPk = (String) selectOne("goodsAdminsDAO.selectNextPk"); // Membertbl
		//selectNextPk = (String) imsimap.get("goods_id");
		System.out.println("selectNextPk"+selectNextPk);
		return selectNextPk;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListGdsFilesList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		return (List<Map<String, Object>>) selectList("goods.selectListGdsFilesList", map); // Membertbl
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListGdsList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		return (List<Map<String, Object>>) selectList("goods.selectListGdsList", map); // Membertbl
	}
	
	
}

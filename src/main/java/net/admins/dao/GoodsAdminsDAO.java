package net.admins.dao;

import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("goodsAdminsDAO")
public class GoodsAdminsDAO extends AbstractDAO {

	public Map<String, Object> insertGdsForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		String selectNextPk = null;
		// System.out.println("11=="+selectOne("goodsAdminsDAO.selectNextPk"));
		selectNextPk = (String) selectOne("goods.selectNextGoodsPk");
		System.out.println("selectNextPk ="+selectNextPk);
		map.put("goods_id", selectNextPk);
		insert("goods.insertGdsForm", map); // Membertbl
		return map;
	}

	public int selectOneGetGdsTotalCount() {
		// TODO Auto-generated method stub
		return (int) selectOne("goods.selectOneGetGdsTotalCount");
	}

	public void insertGdsFiles(Map<String, Object> map) {
		// TODO Auto-generated method stub
		/*String gNullCheck = null;
		
		gNullCheck = (String) map.get("gNullCheck");
		
		 1. empty 인 경우 goods_id가 없다 즉 수정이 아닌 신규등록
		 
		 2. notEmpty 인 경우 기존 제품에 대한 수정이다.
		 
		System.out.println("gNullCheck = "+gNullCheck);
		
		if(gNullCheck.equals("empty")){
		
		System.out.println("신규등록인 경우.");
		Map<String, Object> imsimap = (Map<String, Object>) selectOne("goods.selectNextGoodsPk");
		// map을 위에서 써버리면 그 다음 쿼리시 null 값 나온다. !! (가져오는값이라?)
		String g_pk = String.valueOf(imsimap.get("goods_id"));
		map.put("goods_id", g_pk);
		}*/
		
		insert("goods.insertGdsFiles", map); // Membertbl
	}

	public String selectNextPk() {
		// TODO Auto-generated method stub
		System.out.println("시작");
		String selectNextPk = null;
		// System.out.println("11=="+selectOne("goodsAdminsDAO.selectNextPk"));
		selectNextPk = (String) selectOne("goods.selectNextGoodsPk");

		// selectNextPk = (String) selectOne("goodsAdminsDAO.selectNextPk"); //
		// Membertbl
		// selectNextPk = (String) imsimap.get("goods_id");
		System.out.println("selectNextPk" + selectNextPk);
		return selectNextPk;
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListGdsFilesList(
			Map<String, Object> map) {
		// TODO Auto-generated method stub

		return (List<Map<String, Object>>) selectList(
				"goods.selectListGdsFilesList", map); // Membertbl
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListGdsList(Map<String, Object> map) {
		// TODO Auto-generated method stub

		return (List<Map<String, Object>>) selectList(
				"goods.selectListGdsList", map); // Membertbl
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> updateGdsForm(Map<String, Object> map) {
		// TODO Auto-generated method stub

		Map<String, Object> imsi_gdsMasterMap = (Map<String, Object>) selectOne(
				"goods.updateGdsform", map);

		/*
		String gdsMaster_goodsid = null;

		Map<String, Object> resultmap = null;

		// java.lang.Integer cannot be cast to java.lang.String 에러를
		// String.valueOf로 처리
		
		 먼저 map 끼리 merge 유의 
		 이부분은 필요가 없다 왜냐면, 파일 호출시 폴더내의 부분은 db 저장이 안되어있고 file io에서 읽어오는 부분이기 때문이다. 
		 * 
		gdsMaster_goodsid = String.valueOf(imsi_gdsMasterMap.get("goods_id"));
		System.out.println("gdsMaster_goodsid =" + gdsMaster_goodsid);

		
		 
		 * Map<String, Object> imsi_gdsFilesMap = (Map<String, Object>) selectOne(
				"goods.goodsfiles", map);
		String gdsFiles_goodsid = null;

		try {
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		if (gdsFiles_goodsid == null) {
			// 해당 goods_id에는 file이 없는 경우 !!
			resultmap = imsi_gdsMasterMap;
		} else if (gdsFiles_goodsid == gdsMaster_goodsid) {
			// 파일도 마스터에도 있는 경우

			
			 * map 끼리 merge commonutill 생성
			 * http://stackoverflow.com/questions/8795945/merging-two-maps
			 
			String gFileName = (String) imsi_gdsFilesMap.get("gFileName");
			String gFileDesc = (String) imsi_gdsFilesMap.get("gFileDesc");

			imsi_gdsMasterMap.put("gFileName", gFileName);
			imsi_gdsMasterMap.put("gFileDesc", gFileDesc);
			resultmap = imsi_gdsMasterMap;

		}*/
		return imsi_gdsMasterMap;
	}

	public void updateProGdsform(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("goods.updateProGdsform", map);
	}

	public Map<String, Object> selectOneGdsView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne(
				"goods.selectOneGdsView", map);
	}

	public List<Map<String, Object>> selectCategoryGoodsList() {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList(
				"goods.selectCategoryGoodsList");
	}

}

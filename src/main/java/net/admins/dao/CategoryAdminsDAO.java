package net.admins.dao;

import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("categoryAdminsDAO")
public class CategoryAdminsDAO extends AbstractDAO {

	/*중요
	 * 
	 * @Repository("categoryAdminsDAO") 는 서비스와 맞춰주어야 한다. 
	 */
	public void insertCategoryForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		String gcategory_id_pk = null;
		// System.out.println("11=="+selectOne("goodsAdminsDAO.selectNextPk"));
		gcategory_id_pk = (String) selectOne(
				"category.selectNextCategoryPk", map);
		// map을 위에서 써버리면 그 다음 쿼리시 null 값 나온다. !! (가져오는값이라?)
		
		map.put("gcategory_id", gcategory_id_pk);
		insert("category.insertCategoryForm", map);
	}

	public void insertCategoryRelationForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		String gcr_id = null;
		// System.out.println("11=="+selectOne("goodsAdminsDAO.selectNextPk"));
		gcr_id = (String) selectOne(
				"category.selectNextCategoryRelationPk", map);
		// map을 위에서 써버리면 그 다음 쿼리시 null 값 나온다. !! (가져오는값이라?)
		
		map.put("gcr_id", gcr_id);
		
		insert("category.insertCategoryRelationForm", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCategory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("category.selectListCategory", map);
	}


}

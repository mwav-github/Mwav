package net.admins.dao;

import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class CategoryAdminsDAO extends AbstractDAO {

	public void insertCategoryForm(Map<String, Object> map) {
		String gcategory_id_pk = null;
		gcategory_id_pk = (String) selectOne("category.selectNextCategoryPk", map);
		map.put("gcategory_id", gcategory_id_pk);
		insert("category.insertCategoryForm", map);
	}

	public void insertCategoryRelationForm(Map<String, Object> map) {
		String gcr_id = null;
		gcr_id = (String) selectOne("category.selectNextCategoryRelationPk", map);

		/* 
		 pk 전에 하면 기존거를 삭제한다 !! 
		 우리는 카테고리는 의미없지만 누적해서 가기 떄문에 이부분은 현재 위치가 맞다. 
		 pk 확인 및 발급 > delete 진행 > 
		 * */
		delete("category.deleteCategory", map);

		map.put("gcr_id", gcr_id);

		insert("category.insertCategoryRelationForm", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCategory(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("category.selectListCategory", map);
	}
}

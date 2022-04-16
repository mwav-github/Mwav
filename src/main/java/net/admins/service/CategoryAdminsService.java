package net.admins.service;

import java.util.List;
import java.util.Map;

public interface CategoryAdminsService {

	void insertCategoryForm(Map<String, Object> map);

	void insertCategoryRelationForm(Map<String, Object> map);

	List<Map<String, Object>> selectListCategory(Map<String, Object> map);

}

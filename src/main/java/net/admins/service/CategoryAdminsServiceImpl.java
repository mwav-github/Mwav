package net.admins.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.admins.dao.CategoryAdminsDAO;

@Service
public class CategoryAdminsServiceImpl implements CategoryAdminsService {

	@Inject
	private CategoryAdminsDAO categoryAdminsDAO;

	@Override
	public void insertCategoryForm(Map<String, Object> map) {
		categoryAdminsDAO.insertCategoryForm(map);
	}

	@Override
	public void insertCategoryRelationForm(Map<String, Object> map) {
		categoryAdminsDAO.insertCategoryRelationForm(map);
	}

	@Override
	public List<Map<String, Object>> selectListCategory(Map<String, Object> map) {
		return (List<Map<String, Object>>) categoryAdminsDAO.selectCategory(map);
	}

}
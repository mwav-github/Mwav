package net.admins.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.admins.dao.CategoryAdminsDAO;
import net.admins.dao.GoodsAdminsDAO;
import net.common.common.CommandMap;
import net.mwav.common.module.FileUtils;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service("categoryAdminsService")
public class CategoryAdminsServiceImpl implements CategoryAdminsService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "categoryAdminsDAO")
	private CategoryAdminsDAO categoryAdminsDAO;

	@Override
	public void insertCategoryForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		categoryAdminsDAO.insertCategoryForm(map);
	}

	@Override
	public void insertCategoryRelationForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		categoryAdminsDAO.insertCategoryRelationForm(map);
	}

	@Override
	public List<Map<String, Object>> selectListCategory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) categoryAdminsDAO.selectCategory(map);
	}


	

}
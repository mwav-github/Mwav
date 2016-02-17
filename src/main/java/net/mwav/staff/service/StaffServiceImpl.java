package net.mwav.staff.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;

import net.common.common.CommandMap;
import net.mwav.staff.dao.StaffDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("staffService")
public class StaffServiceImpl implements StaffService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "staffDAO")
	private StaffDAO staffDAO;

	/*
	 * ========================================등록================================
	 * ========
	 */
	@Override
	public void insertStfForm(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("map=" + map);
		staffDAO.insertStfForm(map);
	}

	@Override
	public int selectOneGetTotalCount() {
		// TODO Auto-generated method stub
		return  staffDAO.selectOneGetTotalCount();
	}

	@Override
	public Map<String, Object> selectStfView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return staffDAO.selectStfView(map);
	}

	@Override
	public Map<String, Object> updateStfForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return staffDAO.updateStfForm(map);
	}

	@Override
	public Map<String, Object> selectStfLogin(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return staffDAO.selectStfLogin(map);
	}

	@Override
	public List<Map<String, Object>> selectListStfList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
package net.admins.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.admins.dao.StaffDAO;
import net.admins.vo.Staff_VO;

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
	public int selectNextStfPk() throws Exception {
		// TODO Auto-generated method stub
		return staffDAO.selectNextStfPk();
	}
	
	public boolean selectOneStfLoginIdCheck(String stfLoginId) throws Exception{
		return staffDAO.selectOneStfLoginIdCheck(stfLoginId);
	}
	
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
	public Staff_VO selectStfLogin(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return staffDAO.selectStfLogin(map);
	}

	@Override
	public List<Map<String, Object>> selectListStfList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return staffDAO.selectListStfList(map);
	}

	@Override
	public void updateProStfForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		staffDAO.updateProStfForm(map);
		
	}

	@Override
	public int insertStfRegist(Map<String, Object> map) {
		return staffDAO.insertStfRegist(map);
	}

	

}
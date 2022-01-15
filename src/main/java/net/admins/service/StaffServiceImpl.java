package net.admins.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.admins.dao.StaffDAO;
import net.admins.vo.Staff_VO;

@Service
public class StaffServiceImpl implements StaffService {

	@Inject
	private StaffDAO staffDAO;

	@Override
	public int selectNextStfPk() throws Exception {
		return staffDAO.selectNextStfPk();
	}

	public boolean selectOneStfLoginIdCheck(String stfLoginId) throws Exception {
		return staffDAO.selectOneStfLoginIdCheck(stfLoginId);
	}

	@Override
	public void insertStfForm(Map<String, Object> map) throws Exception {
		staffDAO.insertStfForm(map);
	}

	@Override
	public int selectOneGetTotalCount() {
		return staffDAO.selectOneGetTotalCount();
	}

	@Override
	public Map<String, Object> selectStfView(Map<String, Object> map) {
		return staffDAO.selectStfView(map);
	}

	@Override
	public Map<String, Object> updateStfForm(Map<String, Object> map) {
		return staffDAO.updateStfForm(map);
	}

	@Override
	public Staff_VO selectStfLogin(Map<String, Object> map) {
		return staffDAO.selectStfLogin(map);
	}

	@Override
	public List<Map<String, Object>> selectListStfList(Map<String, Object> map) {
		return staffDAO.selectListStfList(map);
	}

	@Override
	public void updateProStfForm(Map<String, Object> map) {
		staffDAO.updateProStfForm(map);
	}

	@Override
	public int insertStfRegist(Map<String, Object> map) {
		return staffDAO.insertStfRegist(map);
	}

}
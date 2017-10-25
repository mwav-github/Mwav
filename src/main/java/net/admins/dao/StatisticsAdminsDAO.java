package net.admins.dao;

import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("statisticsAdminsDAO")
public class StatisticsAdminsDAO extends AbstractDAO {


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListStatistics(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList(
				"statisticsAdminsDAO.selectListStatistics", map);

	}


	public int selectOneGetStatisticsTotalCount() {
		// TODO Auto-generated method stub
		return (int) selectOne("statisticsAdminsDAO.selectOneGetStatisticsTotalCount");
	}


}

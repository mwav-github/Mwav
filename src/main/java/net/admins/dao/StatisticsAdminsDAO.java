package net.admins.dao;

import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
@SuppressWarnings("unchecked")
public class StatisticsAdminsDAO extends AbstractDAO {

	public List<Map<String, Object>> selectListStatistics(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("statisticsAdminsDAO.selectListStatistics", map);
	}

	public int selectOneGetStatisticsTotalCount() {
		return (int) selectOne("statisticsAdminsDAO.selectOneGetStatisticsTotalCount");
	}

	public List<Map<String, Object>> selectListStatLogList(int statistics_id) {
		return (List<Map<String, Object>>) selectList("statisticsAdminsDAO.selectListStatLogList", statistics_id);
	}

	public Map<String, Object> selectOneStatView(int statistics_id) {
		return (Map<String, Object>) selectOne("statisticsAdminsDAO.selectOneStatView", statistics_id);
	}

	public List<Map<String, Object>> selectListStatLogDateList(int statistics_id) {
		return (List<Map<String, Object>>) selectList("statisticsAdminsDAO.selectListStatLogDateList", statistics_id);
	}

}

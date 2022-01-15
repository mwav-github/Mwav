package net.admins.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.admins.dao.StatisticsAdminsDAO;

@Service
public class StatisticsAdminsServiceImpl implements StatisticsAdminsService {

	@Inject
	private StatisticsAdminsDAO statisticsAdminsDAO;

	@Override
	public List<Map<String, Object>> selectListStatistics(Map<String, Object> map) {
		return (List<Map<String, Object>>) statisticsAdminsDAO.selectListStatistics(map);
	}

	@Override
	public int selectOneGetStatisticsTotalCount() {
		return statisticsAdminsDAO.selectOneGetStatisticsTotalCount();
	}

	@Override
	public Map<String, Object> selectOneStatView(int statistics_id) {
		return statisticsAdminsDAO.selectOneStatView(statistics_id);
	}

	@Override
	public List<Map<String, Object>> selectListStatLogList(int statistics_id) {
		return statisticsAdminsDAO.selectListStatLogList(statistics_id);
	}

	@Override
	public List<Map<String, Object>> selectListStatLogDateList(int statistics_id) {
		return statisticsAdminsDAO.selectListStatLogDateList(statistics_id);
	}

}
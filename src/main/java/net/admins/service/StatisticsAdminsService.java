package net.admins.service;

import java.util.List;
import java.util.Map;

public interface StatisticsAdminsService {

	List<Map<String, Object>> selectListStatistics(Map<String, Object> map);

	int selectOneGetStatisticsTotalCount();

	Map<String, Object> selectOneStatView(int statistics_id);

	List<Map<String, Object>> selectListStatLogList(int statistics_id);

	List<Map<String, Object>> selectListStatLogDateList(int statistics_id);

}

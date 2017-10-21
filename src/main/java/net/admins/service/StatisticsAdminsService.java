package net.admins.service;

import java.util.List;
import java.util.Map;

public interface StatisticsAdminsService {

	List<Map<String, Object>> selectListStatistics(Map<String, Object> map);

	int selectOneGetStatisticsTotalCount();
	
	
}

package net.mwav.statistics.service;

import java.util.List;
import java.util.Map;

import net.common.common.CommandMap;
import net.mwav.statistics.vo.StatisticsLogVO;
import net.mwav.statistics.vo.StatisticsVO;

public interface StatisticsService {

	void insertFirstStatics(StatisticsVO vo);

	String selectNextPk();

	void insertStatistics(StatisticsLogVO log_vo);

	
	void updateStClientScreen(Map<String, Object> map);

/////////////////////////////////////Goods/////////////////////////////////////


}

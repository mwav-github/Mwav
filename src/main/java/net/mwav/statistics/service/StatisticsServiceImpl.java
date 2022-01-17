package net.mwav.statistics.service;

import net.mwav.statistics.dao.StatisticsDAO;
import net.mwav.statistics.vo.StatisticsLogVO;
import net.mwav.statistics.vo.StatisticsVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.Map;

@Service
public class StatisticsServiceImpl implements StatisticsService {
	private static final Logger logger = LoggerFactory.getLogger(StatisticsServiceImpl.class);

	@Inject
	private StatisticsDAO statisticsDAO;

	@Override
	public void insertFirstStatics(StatisticsVO vo) {
		statisticsDAO.insertFirstStatics(vo);
	}

	@Override
	public String selectNextPk() {
		return statisticsDAO.selectNextPk();
	}

	@Override
	public void insertStatistics(StatisticsLogVO log_vo) {
		statisticsDAO.insertStatistics(log_vo);
	}

	@Override
	public void updateStClientScreen(Map<String, Object> map) {
		// TODO Auto-generated method stub
		statisticsDAO.updateStClientScreen(map);
	}

	@Override
	public void insertErrorStatistics(StatisticsLogVO log_vo) {
		// TODO Auto-generated method stub
		statisticsDAO.insertErrorStatistics(log_vo);
	}

	@Override
	public String isValidSessionId(String statistics_id) {
		return statisticsDAO.isValidSessionId(statistics_id);
	}

}
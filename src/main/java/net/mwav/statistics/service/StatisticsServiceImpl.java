package net.mwav.statistics.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;

import net.common.common.CommandMap;
import net.mwav.statistics.dao.StatisticsDAO;
import net.mwav.statistics.vo.StatisticsLogVO;
import net.mwav.statistics.vo.StatisticsVO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("statisticsService")
public  class StatisticsServiceImpl implements StatisticsService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "statisticsDAO")
	private StatisticsDAO statisticsDAO;

	@Override
	public void insertFirstStatics(StatisticsVO vo) {
		// TODO Auto-generated method stub
		statisticsDAO.insertFirstStatics(vo);
	}

	@Override
	public String selectNextPk() {
		// TODO Auto-generated method stub
		return statisticsDAO.selectNextPk();
	}

	@Override
	public void insertStatistics(StatisticsLogVO log_vo) {
		// TODO Auto-generated method stub
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
	public String isValidSessionId(String statistics_id){
		return statisticsDAO.isValidSessionId(statistics_id);
	}

	

}
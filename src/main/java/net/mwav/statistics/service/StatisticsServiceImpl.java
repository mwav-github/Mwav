package net.mwav.statistics.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;

import net.common.common.CommandMap;
import net.mwav.statistics.dao.StatisticsDAO;
import net.mwav.statistics.vo.StatisticsVO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("statisticsService")
public  class StatisticsServiceImpl implements StatisticsService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "statisticsDAO")
	private StatisticsDAO statisticsDAO;

	@Override
	public void insertStatistics(StatisticsVO vo) {
		// TODO Auto-generated method stub
		
	}

	

}
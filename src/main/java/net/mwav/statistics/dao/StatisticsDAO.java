package net.mwav.statistics.dao;

import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;
import net.mwav.statistics.vo.StatisticsLogVO;
import net.mwav.statistics.vo.StatisticsVO;

import org.springframework.stereotype.Repository;

@Repository("statisticsDAO")
public class StatisticsDAO extends AbstractDAO {

	public String selectNextPk() {
		// TODO Auto-generated method stub
		return (String) selectOne("statistics.selectNextPk");
	}

	public void insertFirstStatics(StatisticsVO vo) {
		// TODO Auto-generated method stub
		insert("statistics.insertFirstStatics", vo);
	}

	public void insertStatistics(StatisticsLogVO log_vo) {
		// TODO Auto-generated method stub
		insert("statistics.insertStatistics", log_vo);
	}



	public void updateStClientScreen(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("statistics.updateStClientScreen", map);
	}

	public void insertErrorStatistics(StatisticsLogVO log_vo) {
		// TODO Auto-generated method stub
		insert("statistics.insertErrorStatistics", log_vo);
	}

	public String isValidSessionId(String statistics_id) {
		// TODO Auto-generated method stub
		return (String) selectOne("statistics.isValidSessionId", statistics_id);
	}



}

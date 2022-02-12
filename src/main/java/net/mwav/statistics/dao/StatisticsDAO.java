package net.mwav.statistics.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import net.common.dao.AbstractDAO;
import net.mwav.statistics.vo.StatisticsLogVO;
import net.mwav.statistics.vo.StatisticsVO;

@Repository("statisticsDAO")
public class StatisticsDAO extends AbstractDAO {

	public String selectNextPk() {
		return (String) selectOne("statistics.selectNextPk");
	}

	public void insertFirstStatics(StatisticsVO vo) {
		insert("statistics.insertFirstStatics", vo);
	}

	public void insertStatistics(StatisticsLogVO log_vo) {
		insert("statistics.insertStatistics", log_vo);
	}

	public void updateStClientScreen(Map<String, Object> map) {
		update("statistics.updateStClientScreen", map);
	}

	public void insertErrorStatistics(StatisticsLogVO log_vo) {
		insert("statistics.insertErrorStatistics", log_vo);
	}

	public String isValidSessionId(String statistics_id) {
		return (String) selectOne("statistics.isValidSessionId", statistics_id);
	}

}

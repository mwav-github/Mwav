package net.common.charts.dao;

import java.util.List;
import java.util.Map;

import net.common.charts.vo.SeriesVO;
import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("highChartsDAO")
public class HighChartsDAO extends AbstractDAO {

	
	/*========================================리스트(SelectOne, SelectList 순)========================================*/
	
	

	@SuppressWarnings("unchecked")
	public List<SeriesVO> selectListWeeklyUsers() {
		// TODO Auto-generated method stub
		return (List<SeriesVO>) selectList("highCharts.selectListWeeklyUsers");

	}

}

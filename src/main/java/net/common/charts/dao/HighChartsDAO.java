package net.common.charts.dao;

import java.util.List;
import java.util.Map;

import net.common.charts.vo.SeriesVO;
import net.common.charts.vo.SeriesVO_Arrary;
import net.common.charts.vo.SeriesVO_Arrary2;
import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("highChartsDAO")
public class HighChartsDAO extends AbstractDAO {

	
	/*========================================리스트(SelectOne, SelectList 순)========================================*/
	
	

	@SuppressWarnings("unchecked")
	public List<SeriesVO_Arrary> selectListWeeklyUsers() {
		// TODO Auto-generated method stub
		return (List<SeriesVO_Arrary>) selectList("highCharts.selectListWeeklyUsers");

	}

	public List<SeriesVO_Arrary> selectListTop10Page() {
		// TODO Auto-generated method stub
		return (List<SeriesVO_Arrary>) selectList("highCharts.selectListTop10Page");

	}

	public List<SeriesVO_Arrary2> selectListClientScreenSize() {
		// TODO Auto-generated method stub
		return (List<SeriesVO_Arrary2>) selectList("highCharts.selectListClientScreenSize");
	}

}

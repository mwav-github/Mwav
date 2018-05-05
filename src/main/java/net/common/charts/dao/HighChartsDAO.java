package net.common.charts.dao;

import java.util.List;
import java.util.Map;

import net.common.charts.vo.SeriesTypeTwoVO;
import net.common.charts.vo.SeriesTypeOneVO;
import net.common.charts.vo.SeriesDataTypeOneVO;
import net.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("highChartsDAO")
public class HighChartsDAO extends AbstractDAO {

	
	/*========================================리스트(SelectOne, SelectList 순)========================================*/
	
	

	@SuppressWarnings("unchecked")
	public List<SeriesTypeOneVO> selectListWeeklyUsers(Map<String, Object> hashmap) {
		// TODO Auto-generated method stub
		
		System.out.println("ddd"+hashmap.get("stPromoterId"));

		return (List<SeriesTypeOneVO>) selectList("highCharts.selectListWeeklyUsers", hashmap);

	}

	public List<SeriesTypeOneVO> selectListTop10Page(Map<String, Object> hashmap) {
		// TODO Auto-generated method stub
		return (List<SeriesTypeOneVO>) selectList("highCharts.selectListTop10Page", hashmap);

	}

	public List<SeriesDataTypeOneVO> selectListClientScreenSize(Map<String, Object> hashmap) {
		// TODO Auto-generated method stub
		return (List<SeriesDataTypeOneVO>) selectList("highCharts.selectListClientScreenSize", hashmap);
	}

	public List<SeriesTypeOneVO> selectListClientBrowerInfo(
			Map<String, Object> hashmap) {
		// TODO Auto-generated method stub
		return (List<SeriesTypeOneVO>) selectList("highCharts.selectListClientBrowerInfo", hashmap);
	}


	public List<SeriesTypeOneVO> selectListClientBrowerVersion(String browser) {
		// TODO Auto-generated method stub
		System.out.println("df비나이다"+browser);
		return (List<SeriesTypeOneVO>) selectList("highCharts.selectListClientBrowerVersion", browser);
	}


}

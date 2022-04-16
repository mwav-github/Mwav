package net.common.charts.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import net.common.charts.vo.SeriesDataTypeOneVO;
import net.common.charts.vo.SeriesTypeOneVO;
import net.common.dao.AbstractDAO;

@Repository
@SuppressWarnings("unchecked")
public class HighChartsDAO extends AbstractDAO {

	public List<SeriesTypeOneVO> selectListWeeklyUsers(Map<String, Object> hashmap) {
		return (List<SeriesTypeOneVO>) selectList("highCharts.selectListWeeklyUsers", hashmap);
	}

	public List<SeriesTypeOneVO> selectListTop10Page(Map<String, Object> hashmap) {
		return (List<SeriesTypeOneVO>) selectList("highCharts.selectListTop10Page", hashmap);
	}

	public List<SeriesDataTypeOneVO> selectListClientScreenSize(Map<String, Object> hashmap) {
		return (List<SeriesDataTypeOneVO>) selectList("highCharts.selectListClientScreenSize", hashmap);
	}

	public List<SeriesTypeOneVO> selectListClientBrowerInfo(Map<String, Object> hashmap) {
		return (List<SeriesTypeOneVO>) selectList("highCharts.selectListClientBrowerInfo", hashmap);
	}

	public List<SeriesTypeOneVO> selectListClientBrowerVersion(String browser) {
		return (List<SeriesTypeOneVO>) selectList("highCharts.selectListClientBrowerVersion", browser);
	}

}

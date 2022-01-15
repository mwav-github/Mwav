package net.common.charts.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import net.common.charts.vo.FusionChartVo;
import net.common.dao.AbstractDAO;

@Repository
public class FusionChartDao extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<FusionChartVo> selectWeeklyUsersList(Map<String, Object> paramMap) {

		return (List<FusionChartVo>) selectList("fusionChart.selectWeeklyUsersList", paramMap);
	}

	@SuppressWarnings("unchecked")
	public List<FusionChartVo> selectTop10PageList(Map<String, Object> paramMap) {

		return (List<FusionChartVo>) selectList("fusionChart.selectTop10PageList", paramMap);
	}

	@SuppressWarnings("unchecked")
	public List<FusionChartVo> selectClientScreenSizeList(Map<String, Object> paramMap) {

		return (List<FusionChartVo>) selectList("fusionChart.selectClientScreenSizeList", paramMap);
	}

}

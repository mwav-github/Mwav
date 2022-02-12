package net.common.charts.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.common.charts.dao.FusionChartDao;
import net.common.charts.vo.FusionChartVo;

@Service
public class FusionChartService {

	@Inject
	FusionChartDao fusionChartDao;

	@SuppressWarnings("unchecked")
	public String selectWeeklyUsersList(Map<String, Object> paramMap) {

		JSONArray chartDataJson = new JSONArray();
		JSONObject jsonVal = null;

		List<FusionChartVo> resultSet = fusionChartDao.selectWeeklyUsersList(paramMap);

		for (int i = 0; i < resultSet.size(); i++) {
			jsonVal = new JSONObject();
			jsonVal.put("label", resultSet.get(i).getName());
			jsonVal.put("value", resultSet.get(i).getData());
			chartDataJson.add(jsonVal);
		}

		return chartDataJson.toString();
	}

	@SuppressWarnings({ "unchecked" })
	public String selectTop10PageList(Map<String, Object> paramMap) {

		JSONArray chartDataJson = new JSONArray();
		JSONObject jsonVal = null;

		List<FusionChartVo> resultSet = fusionChartDao.selectTop10PageList(paramMap);

		for (int i = 0; i < resultSet.size(); i++) {
			jsonVal = new JSONObject();
			jsonVal.put("label", resultSet.get(i).getName());
			jsonVal.put("value", resultSet.get(i).getData());
			chartDataJson.add(jsonVal);
		}

		return chartDataJson.toString();
	}

	@SuppressWarnings("unchecked")
	public String selectClientScreenSizeList(Map<String, Object> paramMap) {

		JSONArray chartDataJson = new JSONArray();
		JSONObject jsonVal = null;

		List<FusionChartVo> resultSet = fusionChartDao.selectClientScreenSizeList(paramMap);

		for (int i = 0; i < resultSet.size(); i++) {
			jsonVal = new JSONObject();
			jsonVal.put("label", resultSet.get(i).getName());
			jsonVal.put("value", resultSet.get(i).getData());
			chartDataJson.add(jsonVal);
		}

		return chartDataJson.toString();
	}

}

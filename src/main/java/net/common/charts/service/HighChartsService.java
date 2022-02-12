package net.common.charts.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.common.charts.dao.HighChartsDAO;
import net.common.charts.vo.DataVO;
import net.common.charts.vo.SeriesDataTypeOneVO;
import net.common.charts.vo.SeriesTypeOneVO;
import net.common.charts.vo.SeriesTypeThreeVO;
import net.common.charts.vo.SeriesTypeTwoVO;

@Service
public class HighChartsService {

	@Inject
	private HighChartsDAO HighChartsDAO;

	public DataVO getLineChartData1() {
		List<SeriesTypeTwoVO> list = new ArrayList<SeriesTypeTwoVO>();
		list.add(new SeriesTypeTwoVO("Tokyo", new double[] { 7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6 }));
		list.add(new SeriesTypeTwoVO("New York", new double[] { 0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5 }));
		list.add(new SeriesTypeTwoVO("London", new double[] { 3.9, 4.2, 5.7, 8.5, 12.9, 15.2, 15.0, 16.6, 14.2, 10.3, 6.6, 4.8 }));

		String[] categories = new String[] { "9 Jan '13", "8 Feb '13", "5 Mar '13", "12 Apr '13", "14 May '13", "21 Jun '13", "30 Jul '13", "8 Aug '13", "5 Sep '13", "17 Oct '13", "23 Nov '13",
				"5 Dec '13" };
		return new DataVO("chart1-container", "LineChart Title", "통계", "Run Dates", "line", Arrays.asList(categories), list);
	}

	public DataVO getLineChartData2() {
		List<SeriesTypeTwoVO> list = new ArrayList<SeriesTypeTwoVO>();
		list.add(new SeriesTypeTwoVO("Munich", new double[] { 8.0, 6.9, 9.5, 12.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6 }));

		String[] categories = new String[] { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
		return new DataVO("chart2-container", "LineChart Title", "통계", "Run Dates", "line", Arrays.asList(categories), list);
	}

	public DataVO selectListWeeklyUsers(Map<String, Object> hashmap) {

		List<SeriesTypeOneVO> list = HighChartsDAO.selectListWeeklyUsers(hashmap);

		double[] nums = new double[list.size()];
		String[] day = new String[list.size()];
		for (int i = 0; i < list.size(); i++) {
			nums[i] = list.get(i).getData();
			day[i] = list.get(i).getName();
		}
		List<SeriesTypeTwoVO> list_2 = new ArrayList<SeriesTypeTwoVO>();

		list_2.add(new SeriesTypeTwoVO("Munich", nums));

		return new DataVO("chart3-container", "LineChart Title", "통계", "Run Dates", "line", Arrays.asList(day), list_2);
	}

	public DataVO selectListKeyword(List<SeriesTypeOneVO> list2, String bnKeyword) {
		List<SeriesTypeOneVO> list = list2;

		double[] nums = new double[list.size()];
		String[] day = new String[list.size()];
		for (int i = 0; i < list.size(); i++) {
			nums[i] = Math.floor(list.get(i).getData());
			day[i] = list.get(i).getName();
		}
		List<SeriesTypeTwoVO> list_2 = new ArrayList<SeriesTypeTwoVO>();

		list_2.add(new SeriesTypeTwoVO(bnKeyword, nums));
		return new DataVO("chart4-container", " 네이버 데이터랩의 검색어 트렌드", "통계", "Run Dates", "line", Arrays.asList(day), list_2);
	}

	public DataVO selectListTop10Page(Map<String, Object> hashmap) {
		List<SeriesTypeOneVO> list = HighChartsDAO.selectListTop10Page(hashmap);

		double[] data = new double[list.size()];
		String[] page = new String[list.size()];
		for (int i = 0; i < list.size(); i++) {
			// 소수점버리기
			data[i] = list.get(i).getData();

			if (list.get(i).getName() == null) {
				page[i] = "null";
			} else {
				page[i] = list.get(i).getName();
			}
		}
		List<SeriesTypeTwoVO> list_2 = new ArrayList<SeriesTypeTwoVO>();

		list_2.add(new SeriesTypeTwoVO("Count", data));
		return new DataVO("chart1-container", "Top10 PageList", "검색량", "년/월/일", "column", Arrays.asList(page), list_2);
	}

	public DataVO selectListClientScreenSize(Map<String, Object> hashmap) {
		List<SeriesDataTypeOneVO> list = HighChartsDAO.selectListClientScreenSize(hashmap);

		double[] y = new double[list.size()];
		String[] page = new String[list.size()];
		for (int i = 0; i < list.size(); i++) {
			SeriesDataTypeOneVO vo = new SeriesDataTypeOneVO();
			y[i] = list.get(i).getY();
			page[i] = list.get(i).getName();

			//중간에 색만 넣을수없으니 vo 다시 세팅하고 list add해준다. 
			//색깔이 랜덤이여서 너무 애매한경우 대표적인 색깔 5개정도만 놓고 구분한다.
			//vo.setColor(Common_Utils.getRandomColor());
			vo.setName(list.get(i).getName());
			vo.setY(list.get(i).getY());
			//vo.setColor("#00FF00");
			//list.add(i, vo);
			//list.set(i, vo).setColor("1");
			list.set(i, vo);
			//list.set(i, vo).setColor("#00FF00");
		}

		List<SeriesTypeThreeVO> list_2 = new ArrayList<SeriesTypeThreeVO>();

		list_2.add(new SeriesTypeThreeVO("Count", list));
		// String[] categories = new String[] {"Mont",
		// "14 Feb '13","15 Mar '13","11 Apr '13","19 May '13","23 Jun '13","3 Jul '13","8 Aug '13","5 Sep '13","17 Oct '13","23 Nov '13","5 Dec '13"};
		return new DataVO("chart2-container", "abc", "pie", list_2);
	}

	public DataVO selectListClientBrowerInfo(Map<String, Object> hashmap) {
		List<SeriesTypeOneVO> list = HighChartsDAO.selectListClientBrowerInfo(hashmap);
		List<SeriesTypeOneVO> list3 = null;
		List<SeriesTypeTwoVO> list_3 = null;
		double[] data = new double[list.size()];
		double[] data2 = null;
		String[] page = new String[list.size()];
		for (int i = 0; i < list.size(); i++) {
			// 소수점버리기
			data[i] = list.get(i).getData();

			if (list.get(i).getName() == null) {
				page[i] = "null";
			} else {
				page[i] = list.get(i).getName();
			}
			list3 = HighChartsDAO.selectListClientBrowerVersion(page[i]);
			for (int ii = 0; ii < list3.size(); ii++) {
				data2 = new double[list3.size()];
				data2[i] = list3.get(i).getData();
			}
			list_3 = new ArrayList<SeriesTypeTwoVO>();
			list_3.add(new SeriesTypeTwoVO(page[i], data2));
		}
		// double x[] = list.toArray();
		List<SeriesTypeTwoVO> list_2 = new ArrayList<SeriesTypeTwoVO>();

		list_2.add(new SeriesTypeTwoVO("Count", data));

		// String[] categories = new String[] {"Mont",
		// "14 Feb '13","15 Mar '13","11 Apr '13","19 May '13","23 Jun '13","3 Jul '13","8 Aug '13","5 Sep '13","17 Oct '13","23 Nov '13","5 Dec '13"};
		return new DataVO("chart4-container", "ClientBrowerInfo", "통계", "Run Dates", "column", Arrays.asList(page), list_2, list_3);
	}

}

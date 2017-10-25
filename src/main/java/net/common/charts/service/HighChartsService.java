package net.common.charts.service;

import net.common.charts.vo.DataVO;
import net.common.charts.vo.SeriesVO;
import net.common.charts.vo.SeriesVO_Arrary;
import net.common.charts.vo.SeriesVO_Arrary2;
import net.common.charts.dao.HighChartsDAO;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

@Service
public class HighChartsService {

	

	@Resource(name = "highChartsDAO")
	private HighChartsDAO HighChartsDAO;

	public DataVO getLineChartData1() {
		List<SeriesVO> list = new ArrayList<SeriesVO>();
		list.add(new SeriesVO("Tokyo", new double[] { 7.0, 6.9, 9.5, 14.5,
				18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6 }));
		list.add(new SeriesVO("New York", new double[] { 0.2, 0.8, 5.7, 11.3,
				17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5 }));
		list.add(new SeriesVO("London", new double[] { 3.9, 4.2, 5.7, 8.5,
				12.9, 15.2, 15.0, 16.6, 14.2, 10.3, 6.6, 4.8 }));

		// System.out.println("d2"+dateLib.convertWeek("SUN"));

		String[] categories = new String[] { "9 Jan '13", "8 Feb '13",
				"5 Mar '13", "12 Apr '13", "14 May '13", "21 Jun '13",
				"30 Jul '13", "8 Aug '13", "5 Sep '13", "17 Oct '13",
				"23 Nov '13", "5 Dec '13" };
		return new DataVO("chart1-container", "LineChart Title", "통계",
				"Run Dates", "line", Arrays.asList(categories), list);
	}

	public DataVO getLineChartData2() {
		List<SeriesVO> list = new ArrayList<SeriesVO>();
		list.add(new SeriesVO("Munich", new double[] { 8.0, 6.9, 9.5, 12.5,
				18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6 }));

		String[] categories = new String[] { "Jan", "Feb", "Mar", "Apr", "May",
				"Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
		return new DataVO("chart2-container", "LineChart Title", "통계",
				"Run Dates", "line", Arrays.asList(categories), list);
	}

	public DataVO selectListWeeklyUsers() {

		List<SeriesVO_Arrary> list = HighChartsDAO.selectListWeeklyUsers();

		double[] nums = new double[list.size()];
		String[] day = new String[list.size()];
		for (int i = 0; i < list.size(); i++) {
			nums[i] = list.get(i).getData();
			day[i] = list.get(i).getName();
			System.out.println("1x" + list.get(i).getName());
			System.out.println("2x" + list.get(i).getData());
			// System.out.println("x"+ x);
		}
		// double x[] = list.toArray();
		List<SeriesVO> list_2 = new ArrayList<SeriesVO>();

		list_2.add(new SeriesVO("Munich", nums));

		// String[] categories = new String[] {"Mont",
		// "14 Feb '13","15 Mar '13","11 Apr '13","19 May '13","23 Jun '13","3 Jul '13","8 Aug '13","5 Sep '13","17 Oct '13","23 Nov '13","5 Dec '13"};
		return new DataVO("chart3-container", "LineChart Title", "통계",
				"Run Dates", "line", Arrays.asList(day), list_2);
	}

	public DataVO selectListTop10Page() {
		List<SeriesVO_Arrary> list = HighChartsDAO.selectListTop10Page();

		double[] data = new double[list.size()];
		String[] page = new String[list.size()];
		for (int i = 0; i < list.size(); i++) {
			// 소수점버리기
			data[i] = list.get(i).getData();

			if (list.get(i).getName() == null) {
				System.out.println("널인경우");
				page[i] = "null";
			} else {
				page[i] = list.get(i).getName();
			}
			System.out.println("Size = " + list.size());
			System.out.println("Name = " + list.get(i).getName());
			System.out.println("Data = " + Math.floor(list.get(i).getData()));
			// System.out.println("x"+ x);
		}
		// double x[] = list.toArray();
		List<SeriesVO> list_2 = new ArrayList<SeriesVO>();

		list_2.add(new SeriesVO("Count", data));
		System.out.println("크기" + data.length);

		System.out.println("크기2" + page.length);
		
		
		// String[] categories = new String[] {"Mont",
		// "14 Feb '13","15 Mar '13","11 Apr '13","19 May '13","23 Jun '13","3 Jul '13","8 Aug '13","5 Sep '13","17 Oct '13","23 Nov '13","5 Dec '13"};
		return new DataVO("chart1-container", "Top10 PageList", "통계",
				"Run Dates", "column", Arrays.asList(page), list_2);
	}

	public DataVO selectListClientScreenSize() {
		// TODO Auto-generated method stub
		List<SeriesVO_Arrary2> list = HighChartsDAO.selectListClientScreenSize();

		double[] y = new double[list.size()];
		String[] page = new String[list.size()];
		String[] color = new String[list.size()];
		for (int i = 0; i < list.size(); i++) {
			y[i] = list.get(i).getY();
			page[i] = list.get(i).getName();

			System.out.println("Size = " + list.size());
			System.out.println("Name = " + list.get(i).getName());
			System.out.println("Y = " + list.get(i).getY());
			// System.out.println("x"+ x);
		}

		// String[] categories = new String[] {"Mont",
		// "14 Feb '13","15 Mar '13","11 Apr '13","19 May '13","23 Jun '13","3 Jul '13","8 Aug '13","5 Sep '13","17 Oct '13","23 Nov '13","5 Dec '13"};
		return new DataVO("chart2-container", "abc", "pie", list);
	}

}

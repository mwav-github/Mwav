package net.admins.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.admins.dao.StatisticsAdminsDAO;
import net.common.common.CommandMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.common.dao.AbstractDAO;

@Service("statisticsAdminsService")
public class StatisticsAdminsServiceImpl implements StatisticsAdminsService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "statisticsAdminsDAO")
	private StatisticsAdminsDAO statisticsAdminsDAO;


	@Override
	public List<Map<String, Object>> selectListStatistics(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) statisticsAdminsDAO.selectListStatistics(map);
	}


	@Override
	public int selectOneGetStatisticsTotalCount() {
		// TODO Auto-generated method stub
		return  statisticsAdminsDAO.selectOneGetStatisticsTotalCount();
	}


	

}
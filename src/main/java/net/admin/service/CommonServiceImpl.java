package net.admin.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;

import net.admin.dao.CommonDAO;
import net.admin.dao.StaffDAO;
import net.common.common.CommandMap;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("CommonService")
public class CommonServiceImpl implements CommonService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "commonDAO")
	private CommonDAO commonDAO;

	

}
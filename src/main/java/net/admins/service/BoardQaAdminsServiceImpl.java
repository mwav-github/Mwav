package net.admins.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;

import net.common.common.CommandMap;
import net.mwav.common.module.Common_Utils;
import net.admins.dao.BoardNewsAdminsDAO;
import net.admins.dao.BoardQaAdminsDAO;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardQaAdminsService")
public class BoardQaAdminsServiceImpl implements BoardQaAdminsService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "boardQaAdminsDAO")
	@Autowired(required = true)
	private BoardQaAdminsDAO boardQaAdminsDAO;
	Common_Utils cou = new Common_Utils();


}
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
	
	
	@Override
	public void insertQnAForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardQaAdminsDAO.insertQnAForm(map);
	}
	@Override
	public Map<String, Object> selectOneQnAView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardQaAdminsDAO.updateQnAHitCnt(map);
		Set set = map.entrySet();
		Iterator iterator = set.iterator();
		while (iterator.hasNext()) {
			Map.Entry entry = (Map.Entry) iterator.next();
			System.out.println("key : " + entry.getKey() + ", value : "
					+ entry.getValue());
		}

		Map<String, Object> resultMap = boardQaAdminsDAO.selectOneQnAView(map);
		return resultMap;
	}
	@Override
	public List<Map<String, Object>> selectListQnAList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardQaAdminsDAO.selectListQnAList(map);
	}
	@Override
	public int selectOneGetQnATotalCount() {
		// TODO Auto-generated method stub
		return boardQaAdminsDAO.selectOneGetQnATotalCount();
	}
	@Override
	public void deleteQnADelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardQaAdminsDAO.deleteQnADelete(map);
	}
	@Override
	public List<Map<String, Object>> selectListQnAFrontList(
			Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardQaAdminsDAO.selectListQnAFrontList(map);
	}
	
	//===============답변===============
	@Override
	public boolean insertQnAUaForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardQaAdminsDAO.insertQnAUaForm(map);
	}
	
	


}
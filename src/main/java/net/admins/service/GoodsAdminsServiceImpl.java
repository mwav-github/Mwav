package net.admins.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.admins.dao.GoodsAdminsDAO;
import net.common.common.CommandMap;
import net.mwav.common.module.FileUtils;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service("goodsAdminsService")
public class GoodsAdminsServiceImpl implements GoodsAdminsService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "goodsAdminsDAO")
	private GoodsAdminsDAO goodsAdminsDAO;

	@Override
	public void insertGdsForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		
		map.put("gRegister", "S");
		map.put("gRegisterId", 123);
		map.put("gIpAddress", "mm");
		
		goodsAdminsDAO.insertGdsForm(map);
		
		//탬프이미지를 이동;
		/*try {
			FileUtils.totalFileProcess(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		return;
	}
	
	
	public void insertGdsFiles(Map<String, Object> map) {
		// TODO Auto-generated method stub
	/*	String aaa = (String) map.get("gFileName");
System.out.println("sdfsfsfsfssffsdf1="+aaa);*/
		goodsAdminsDAO.insertGdsFiles(map);
	}
	
	public String selectNextPk() {
		// TODO Auto-generated method stub
		
		String selectNextPk = goodsAdminsDAO.selectNextPk();
		
		//selectNextPk = (String) selectOne("goodsAdminsDAO.selectNextPk"); // Membertbl
		//selectNextPk = (String) imsimap.get("goods_id");
		System.out.println("selectNextPk"+selectNextPk);
		return selectNextPk;
	}


	@Override
	public int selectOneGetGdsTotalCount() {
		// TODO Auto-generated method stub
		
		
		return goodsAdminsDAO.selectOneGetGdsTotalCount();
	}


	@Override
	public List<Map<String, Object>> selectListGdsList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsAdminsDAO.selectListGdsList(map);
	}

}
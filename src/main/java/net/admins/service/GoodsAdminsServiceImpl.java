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
import org.springframework.web.context.request.RequestContextHolder;
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
	public Map<String, Object> insertGdsForm(Map<String, Object> map) {
		// TODO Auto-generated method stub

		map.put("gRegister", "S");
		map.put("gRegisterId", 123);
		map.put("gIpAddress", "mm");

		map =  goodsAdminsDAO.insertGdsForm(map);

		// 탬프이미지를 이동;
		/*
		 * try { FileUtils.totalFileProcess(map); } catch (Exception e) { //
		 * TODO Auto-generated catch block e.printStackTrace(); }
		 */
		return map;
	}

	public void insertGdsFiles(Map<String, Object> map) {
		// TODO Auto-generated method stub
		/*
		 * String aaa = (String) map.get("gFileName");
		 * System.out.println("sdfsfsfsfssffsdf1="+aaa);
		 */

		try {
			goodsAdminsDAO.insertGdsFiles(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String selectNextPk() {
		// TODO Auto-generated method stub
        
		// map으로 안넣으면 지속해서 에러뜬다.!!
		// -> insertGdsFiles 내에 포함시키는걸로 변경 
		
		String selectNextPk = null;
		try {

			selectNextPk = goodsAdminsDAO.selectNextPk();

			// selectNextPk = (String) selectOne("goodsAdminsDAO.selectNextPk");
			// // Membertbl
			// selectNextPk = (String) imsimap.get("goods_id");
			System.out.println("selectNextPk" + selectNextPk);
		} catch (Exception e) {
			e.printStackTrace();
		}
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

	@Override
	public Map<String, Object> updateGdsForm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsAdminsDAO.updateGdsForm(map);
	}

	@Override
	public void updateProGdsForm(Map<String, Object> map) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Map<String, Object>> selectListGdsFilesList(
			Map<String, Object> map) {
		System.out.println("selectListGdsFilesList 왔나?");
		
		// TODO Auto-generated method stub
		return goodsAdminsDAO.selectListGdsFilesList(map);
	}

	@Override
	public Map<String, Object> selectOneGdsView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsAdminsDAO.selectOneGdsView(map);
	}

	@Override
	public List<Map<String, Object>> selectCategoryGoodsList(
			) {
		// TODO Auto-generated method stub
		return goodsAdminsDAO.selectCategoryGoodsList();
	}

	@Override
	public void deleteGdsDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		goodsAdminsDAO.deleteGdsDelete(map);
	}
	
	public String mkTempImgFileName(String imgLocation) {
		
		// Ex> vkz25mmqcitube55l32xyxmz-S5-Front_1024x768.jpg (.jpg는 사용자가 업로드한 확장자인가 ?)
		String tempFileName = "";
		tempFileName = RequestContextHolder.currentRequestAttributes().getSessionId();
		tempFileName = tempFileName + "-S5-" + imgLocation;
		
		return tempFileName;
		
	}

}
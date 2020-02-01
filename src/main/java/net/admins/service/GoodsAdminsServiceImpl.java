package net.admins.service;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.admins.dao.GoodsAdminsDAO;
import net.common.common.CommandMap;
import net.mwav.common.module.Constants;
import net.mwav.common.module.FileLib;
import net.mwav.common.module.FileUtils;
import net.mwav.common.module.ImageUtill;

import org.apache.log4j.Logger;
import org.codehaus.plexus.util.DirectoryScanner;
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

	@Resource(name = "constants")
	private Constants c;

	@Override
	public Map<String, Object> insertGdsForm(Map<String, Object> map) {
		// TODO Auto-generated method stub

		map.put("gRegister", "S");
		map.put("gRegisterId", 123);
		map.put("gIpAddress", "mm");

		map = goodsAdminsDAO.insertGdsForm(map);

		// 탬프이미지를 이동;
		/*
		 * try { FileUtils.totalFileProcess(map); } catch (Exception e) { // TODO
		 * Auto-generated catch block e.printStackTrace(); }
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
	public List<Map<String, Object>> selectListGdsFilesList(Map<String, Object> map) {
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
	public List<Map<String, Object>> selectCategoryGoodsList() {
		// TODO Auto-generated method stub
		return goodsAdminsDAO.selectCategoryGoodsList();
	}

	@Override
	public void deleteGdsDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		goodsAdminsDAO.deleteGdsDelete(map);
	}

	@Override
	public String mkTempImgFileName(String imgLocation) {

		// Ex> vkz25mmqcitube55l32xyxmz-S5-Front_1024x768.jpg (.jpg는 사용자가 업로드한 확장자인가 ?)
		String tempFileName = "";
		tempFileName = RequestContextHolder.currentRequestAttributes().getSessionId();
		tempFileName = tempFileName + "-S5-" + imgLocation;

		return tempFileName;

	}

	private ArrayList<File> getTmpImgFromSvr() {
		// File tmpImgFolder = new File(c.goods.tmpImgFilePath);
		String scanKey = RequestContextHolder.currentRequestAttributes().getSessionId() + "-S5-*.jpg";

		DirectoryScanner scanner = new DirectoryScanner();
		scanner.setIncludes(new String[] { scanKey });
		scanner.setBasedir(c.goods.tmpImgFilePath);
		scanner.setCaseSensitive(false);
		scanner.scan();
		String[] fileNames = scanner.getIncludedFiles();

		ArrayList<File> files = new ArrayList<>();
		for (String fileName : fileNames) {
			File file = new File(c.goods.tmpImgFilePath + File.separator + fileName);
			if (file != null) {
				files.add(file);
			}
		}

		return files;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.admins.service.GoodsAdminsService#saveImage() 임시파일을 이용한 이미지 저장
	 * 1.파일시스템에 이미지 저장 2.GoodsFiles_tbl insert
	 */
	@Override
	public void saveImage(String goodsId) throws Exception {
		// 임시파일경로에서 이미지 가져오기
		ArrayList<File> tmpImgFiles = getTmpImgFromSvr();
		if (tmpImgFiles == null)
			return;

		// 임시파일 resize,저장
		String path = c.goods.imgFilePath + "-" + goodsId;
		for (File tmpImgFile : tmpImgFiles) {
			saveImage(tmpImgFile, path, "S1");
		}
	}

	private String getFileLocationIndex(File file) {
		String locationIndex = "";
		String[] bits = file.getName().split("-");
		String lastOne = bits[bits.length - 1];

		bits = lastOne.split("\\.");
		if (bits != null) {
			locationIndex = bits[0];
		}
		return locationIndex;
	}

	private void saveImage(File file, String path, String imageSizeIndex) throws Exception {

		String fileName = "";
		BufferedImage bufferedImg = null;

		switch (imageSizeIndex) {
		case "S1":
			String locationIndex = getFileLocationIndex(file);
			fileName = "S1" + "-" + locationIndex + ".jpg";
			bufferedImg = imageResize(file, 100, 100);
			break;
		}

		upload(bufferedImg, path, fileName);
	}

	private BufferedImage imageResize(File file, double width, double height) throws IOException {

		BufferedImage resizedImg = null;

		if (file == null) {
			return resizedImg;
		}
		BufferedImage sourceImg = ImageIO.read(file);
		resizedImg = ImageUtill.scaleSize(sourceImg, 100, 100); // 이미지 유틸
		return resizedImg;
	}
	
	private byte[] toByte(BufferedImage bufferedImg) throws IOException {
		byte[] byteImg = null;
		if (bufferedImg == null) {
			return byteImg;
		}
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write( bufferedImg, "jpg", baos );
		baos.flush();
		byteImg = baos.toByteArray();
		baos.close();
		
		return byteImg;
	}

	private void upload(BufferedImage bufferedImg, String path, String fileName) throws Exception {
		if (bufferedImg == null) {
			return;
		}
		FileLib fileLib = FileLib.getInstance();
		fileLib.upload(toByte(bufferedImg), path, fileName);
	}
}
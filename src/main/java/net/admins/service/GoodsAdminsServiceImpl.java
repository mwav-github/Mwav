package net.admins.service;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.inject.Inject;

import org.apache.commons.io.FilenameUtils;
import org.codehaus.plexus.util.DirectoryScanner;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;

import net.admins.dao.GoodsAdminsDAO;
import net.mwav.common.module.Constants;
import net.mwav.common.module.FileLib;
import net.mwav.common.module.ImageUtill;

@Service
public class GoodsAdminsServiceImpl implements GoodsAdminsService {

	@Inject
	private GoodsAdminsDAO goodsAdminsDAO;

	@Inject
	private Constants c;

	@Override
	public Map<String, Object> insertGdsForm(Map<String, Object> map) {
		map.put("gRegister", "S");
		map.put("gRegisterId", 123);
		map.put("gIpAddress", "mm");

		map = goodsAdminsDAO.insertGdsForm(map);

		return map;
	}

	public void insertGdsFiles(Map<String, Object> map) {
		try {
			goodsAdminsDAO.insertGdsFiles(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String selectNextPk() {
		// map으로 안넣으면 지속해서 에러뜬다.!!
		// -> insertGdsFiles 내에 포함시키는걸로 변경
		String selectNextPk = null;
		try {

			selectNextPk = goodsAdminsDAO.selectNextPk();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectNextPk;
	}

	@Override
	public int selectOneGetGdsTotalCount() {
		return goodsAdminsDAO.selectOneGetGdsTotalCount();
	}

	@Override
	public List<Map<String, Object>> selectListGdsList(Map<String, Object> map) {
		return goodsAdminsDAO.selectListGdsList(map);
	}

	@Override
	public Map<String, Object> updateGdsForm(Map<String, Object> map) {
		return goodsAdminsDAO.updateGdsForm(map);
	}

	@Override
	public void updateProGdsForm(Map<String, Object> map) {
		try {
			goodsAdminsDAO.updateProGdsform(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Map<String, Object>> selectListGdsFilesList(Map<String, Object> map) {
		return goodsAdminsDAO.selectListGdsFilesList(map);
	}

	@Override
	public Map<String, Object> selectOneGdsView(Map<String, Object> map) {
		return goodsAdminsDAO.selectOneGdsView(map);
	}

	@Override
	public List<Map<String, Object>> selectCategoryGoodsList() {
		return goodsAdminsDAO.selectCategoryGoodsList();
	}

	@Override
	public void deleteGdsDelete(Map<String, Object> map) {
		goodsAdminsDAO.deleteGdsDelete(map);
	}

	@Override
	public String mkTempImgFileName(String imgLocation) {
		String tempFileName = "";
		tempFileName = RequestContextHolder.currentRequestAttributes().getSessionId();
		tempFileName = tempFileName + "-S5-" + imgLocation;

		return tempFileName;
	}

	private ArrayList<File> getFilesFromSvr(String scanKey, String path) {
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

	public boolean deletePreTempFile(String fileName) throws Exception {
		String scanKey = fileName + "*";
		ArrayList<File> tmpImgFiles = getFilesFromSvr(scanKey, c.goods.tmpImgFilePath);
		if (tmpImgFiles == null)
			return Constants.FAIL;

		FileLib fileLib = FileLib.getInstance();
		for (File tmpImgFile : tmpImgFiles) {
			boolean result = fileLib.delete(c.goods.tmpImgFilePath, tmpImgFile.getName());
			if (result == Constants.FAIL)
				return Constants.FAIL;
		}

		return Constants.SUCEESS;
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
		String scanKey = RequestContextHolder.currentRequestAttributes().getSessionId() + "-S5-*";
		ArrayList<File> tmpImgFiles = getFilesFromSvr(scanKey, c.goods.tmpImgFilePath);
		if (tmpImgFiles == null)
			return;

		// 임시파일 resize,저장
		String path = c.goods.imgFilePath + "-" + goodsId;
		String fileName = "";

		for (File tmpImgFile : tmpImgFiles) {
			fileName = saveImage(tmpImgFile, path, "S1");
			modifyGoodsFilesTbl(fileName, goodsId, "");

			fileName = saveImage(tmpImgFile, path, "S2");
			modifyGoodsFilesTbl(fileName, goodsId, "");

			// S3~S5 추가 구현 필요
		}
	}

	private void modifyGoodsFilesTbl(String fileName, String GoodsId, String gFileDesc) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gFileName", fileName);
		map.put("goods_id", GoodsId);
		map.put("gFileDesc", gFileDesc);
		goodsAdminsDAO.modifyGoodsFiles(map);
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

	private String saveImage(File file, String path, String imageSizeIndex) throws Exception {
		String fileName = "";
		BufferedImage bufferedImg = null;
		String locationIndex = getFileLocationIndex(file);
		switch (imageSizeIndex) {
		case "S1":
			fileName = "S1" + "-" + locationIndex + c.dot + FilenameUtils.getExtension(file.getName());
			bufferedImg = imageResize(file, 100, 100);
			break;
		case "S2":
			fileName = "S2" + "-" + locationIndex + c.dot + FilenameUtils.getExtension(file.getName());
			bufferedImg = imageResize(file, 200, 200);
			break;
		}

		upload(bufferedImg, path, fileName);

		// 성공시 fileName return
		return fileName;
	}

	private BufferedImage imageResize(File file, double width, double height) throws IOException {
		BufferedImage resizedImg = null;

		if (file == null) {
			return resizedImg;
		}
		BufferedImage sourceImg = ImageIO.read(file);
		resizedImg = ImageUtill.scaleSize(sourceImg, width, height); // 이미지 유틸
		return resizedImg;
	}

	private byte[] toByte(BufferedImage bufferedImg) throws IOException {
		byte[] byteImg = null;
		if (bufferedImg == null) {
			return byteImg;
		}

		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(bufferedImg, "jpg", baos);
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
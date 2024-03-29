package net.admins.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import net.mwav.common.module.ImageUtill;

@Component
@SuppressWarnings("unused")
public class GoodsAdminsFileHandler {

	@Inject
	private GoodsAdminsService goodsAdminsService;

	HttpServletRequest request;

	private static final Logger logger = LoggerFactory.getLogger(GoodsAdminsFileHandler.class);

	// Member
	private static final String filePath_Member = "xUpload\\MbrData\\Avata\\";
	private static final String filePath_TempImages_Member = "xUpload\\MbrData\\Avata\\Avata.bak\\";

	// Staffs
	private static final String filePath_Staff = "xUpload\\MbrData\\Avata\\";
	private static final String filePath_TempImages_Staff = "xUpload\\MbrData\\Avata\\Avata.bak\\";

	// Goods
	private static final String filePath_Goods = "xUpload\\GdsData\\";
	private static final String filePath_TempImages_Goods = "xUpload\\GdsData\\TempImages\\";

	public void totalFileProcess(Map<String, Object> map) throws Exception {
		// 스프링 파일 읽기 참고

		// http://blowmj.tistory.com/68

		// 이동전의 폴더에 있는 파일들을 읽는다.
		// List<File> dirList = getDirFileList(filePath_TempImages_Goods );
		// https://examples.javacodegeeks.com/core-java/io/java-write-to-file-example/
		List<Map<String, Object>> dirListMap = null;
		try {

			dirListMap = goodsAdminsService.selectListGdsFilesList(map);
			String goods_id = (String) map.get("goods_id");

			for (int i = 0; i < dirListMap.size(); i++) {
				String gFileName = (String) dirListMap.get(i).get("gFileName");

				// 가장 최근건에 대한 체크 필요.
				// http://blog.daum.net/_blog/BlogTypeView.mwav?blogid=0HOSO&articleno=5387841&_bloghome_menu=recenttext
				// > db 딴에서 일부 잘라서 orderby 해도될듯

				// 임시파일에서 이기 때문에 난수_+now (20자)

				String gFileNameExcept = gFileName.substring(20);

				// String fullFileName = filePath_TempImages_Goods + gFileName;

				// String fullFileName_test =
				// "\\xUpload\\GdsData\\TempImages\\S1_20160522092251_Basic.jpg";
				// HttpSession session = request.getSession();

				// String fullFileName =
				// session.getServletContext().getRealPath(filePath_TempImages_Goods+gFileName);

				String uploadRootPath = (String) map.get("uploadRootPath");
				String fullFileName = uploadRootPath + filePath_TempImages_Goods + gFileName;

				File file = new File(fullFileName);
				// File filetest = new File(fullFileName_test);

				// BufferedImage srcimage_test = ImageIO.read(filetest);
				BufferedImage srcimage = ImageIO.read(file);
				// /i번째 저장되어 있는 파일을 불러온다.
				// String fileName = dirList.get(i).getName();

				BufferedImage resizeimage50 = ImageUtill.scaleSize(srcimage, 100, 100); // 이미지 유틸
				BufferedImage resizeimage30 = ImageUtill.scaleSize(srcimage, 250, 250);

				String moveFilePath = uploadRootPath + filePath_Goods + "GC" + goods_id;

				/*
				 * String moveFilePath_images = uploadRootPath + filePath_Goods
				 * + goods_id ;
				 */
				File file_move = new File(moveFilePath);
				if (file_move.exists() == false) {
					file_move.mkdirs();
				}

				String Ltargetpath = moveFilePath + "\\L_" + gFileNameExcept;// 만들
				// 이미지경로
				// 중간이미지

				String mtargetpath = moveFilePath + "\\M_" + gFileNameExcept;// 만들
				// 이미지경로
				// 중간이미지
				// File file_mtargetpath = new File(mtargetpath);

				String stargetpath = moveFilePath + "\\S_" + gFileNameExcept;// 만들
				// 이미지경로
				// File stargetpath = new File(stargetpath);

				String format = gFileName.substring(gFileName.lastIndexOf(".") + 1);// 확장자
				// 이미지 저장..
				// 각 goods_id에 맞게
				ImageUtill.saveImage(mtargetpath, resizeimage50, format); // 이미지
																			// 유틸
																			// 클래스
				ImageUtill.saveImage(stargetpath, resizeimage30, format);

				// goodsAdminsService.insertGdsFiles(map);
				// temp > 실제 파일이동시에는 db 저장은 없다.

				// 원본이미지 이동..
				fileMove(fullFileName, Ltargetpath);
				// File toFile = new File(moveFilePath);
				// boolean result = file.renameTo(toFile);

				// 파일 삭제를 원한다면
				// fileDelete(inFolder+"\\"+fileName);

				// 파일 복사을 원한다면
				// fileCopy(inFolder+"\\"+fileName, outFolder+"\\"+fileName);

				// 파일 이동을 원한다면
				// fileMove(inFolder+"\\"+fileName, outFolder+"\\"+fileName);

				// 파일 생성을 원한다면
				// fileMake("C:/Users/INTERPARK/Desktop/test.txt");
			}

			/*
			 * String makeFile = "C:/Users/INTERPARK/Desktop/test.txt";
			 * 
			 * // 파일의 존재 여부 확인 if (fileIsLive(makeFile)) { // 파일이 존재할땐 파일을
			 * 불러옵니다. File f1 = new File(makeFile); } else { // 파일이 없을땐 파일을
			 * 생성합니다. fileMake(makeFile); }
			 */
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	// 파일을 존재여부를 확인하는 메소드
	public static Boolean fileIsLive(String isLivefile) {
		File f1 = new File(isLivefile);

		if (f1.exists()) {
			return true;
		} else {
			return false;
		}
	}

	// 파일을 생성하는 메소드
	public static void fileMake(String makeFileName) {
		File f1 = new File(makeFileName);
		try {
			f1.createNewFile();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 파일을 삭제하는 메소드
	public static void fileDelete(String deleteFileName) {
		File I = new File(deleteFileName);
		I.delete();
	}

	// 파일을 복사하는 메소드
	public static void fileCopy(String inFileName, String outFileName) {
		try {
			FileInputStream fis = new FileInputStream(inFileName);
			FileOutputStream fos = new FileOutputStream(outFileName);

			int data = 0;
			while ((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 파일을 이동하는 메소드
	public static void fileMove(String inFileName, String outFileName) {
		try {
			FileInputStream fis = new FileInputStream(inFileName);
			FileOutputStream fos = new FileOutputStream(outFileName);

			int data = 0;
			while ((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();

			// 복사한뒤 원본파일을 삭제함
			// fileDelete(inFileName);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 디렉토리의 파일 리스트를 읽는 메소드
	// > 파일이름만 리스트로 저장
	public static List<Map<String, Object>> getDirFileList(String dirPath) {
		// 디렉토리 파일 리스트
		List<File> dirFileList = null;

		List<Map<String, Object>> maps = new ArrayList<Map<String, Object>>();
		Map<String, Object> integerMap = new HashMap<String, Object>();
		List<String> FileName = new ArrayList<String>();
		// Map<String, Object> dirFileMap = null;
		// List<Map<String, Object>> dirFileListMap = null;

		// 파일 목록을 요청한 디렉토리를 가지고 파일 객체를 생성함
		File dir = new File(dirPath);

		// 디렉토리가 존재하지 않는다면
		if (dir.exists() == false) {
			logger.debug("경로가 존재하지 않습니다 또는 해당 상품코드에 이미지파일이 존재하지 않습니다. ");
		}

		if (dir.exists()) {
			// 파일 목록을 구함

			// 폴더라면 폴더가 가진 파일객체를 리스트로 받는다.
			File[] files = dir.listFiles();

			// 파일 배열을 파일 리스트로 변화함
			dirFileList = Arrays.asList(files);
			String fileName = null;
			String filePosition = null;

			for (File f : dirFileList) {
				// fileName = f.getName();
				// FileName.add(fileName);
				// 파일일 경우만 출력
				if (f.isFile()) {

					// 날짜 출력을 위한 Date객체 생성 생성자로 마지막 수정날짜인 lastModified메소드의
					// long리턴값을 넣는다.
					Date d = new Date(f.lastModified());

					// 파일명, 날짜, 크기를 출력한다.
					fileName = f.getName();

					// List에 파일이름만 넣는다. !!
					// dirFileList 아래 contain 을 못한다.

					FileName.add(fileName);
				}

			}
			for (int i = 0; i < FileName.size(); i++) {
				// contains를 이용한 방법(true, false 반환)
				// http://fruitdev.tistory.com/72

				if (FileName.get(i).contains("Basic")) {
					filePosition = "Basic";
					integerMap.put("filePosition", filePosition);

				} else if (FileName.get(i).contains("Front")) {
					filePosition = "Front";
					integerMap.put("filePosition", filePosition);

				} else if (FileName.get(i).contains("Rear")) {
					filePosition = "Rear";
					integerMap.put("filePosition", filePosition);
				} else if (FileName.get(i).contains("Right")) {
					filePosition = "Right";
					integerMap.put("filePosition", filePosition);
				} else if (FileName.get(i).contains("Left")) {
					filePosition = "Left";
					integerMap.put("filePosition", filePosition);
				} else if (FileName.get(i).contains("Top")) {
					filePosition = "Top";
					integerMap.put("filePosition", filePosition);
				} else if (FileName.get(i).contains("Bottom")) {
					filePosition = "Bottom";
					integerMap.put("filePosition", filePosition);
				}

				integerMap.put("fileName", FileName.get(i).trim());
				// 확장자 제외
				integerMap.put("fileNameExcept", FileName.get(i).substring(0, FileName.get(i).lastIndexOf('.')).trim());

				integerMap.put("fileSize", FileName.get(i).length());
				// integerMap.put("fileDate", d.toString().trim());

			}
			maps.add(integerMap);
		}
		return maps;
	}
}
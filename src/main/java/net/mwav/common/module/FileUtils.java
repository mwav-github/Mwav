package net.mwav.common.module;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import net.admins.dao.GoodsAdminsDAO;
import net.admins.service.GoodsAdminsServiceImpl;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/*일단 기본적으로 외부스토리지를 사용하지 않는다고 가정할 경우, 프로젝트의 webapp 밑에 해당 파일이 존재해야 이미지 미리보기를 할 수가 있습니다. */

@Component("fileUtils")
/*
 * @Component 어노테이션을 이용하여 이 객체의 관리를 스프링이 담당하도록 할 계획이다.
 * 
 * 사용시 new 를 사용하여 객체를 만드는것이 아니라, 위에서 보는것과 같이 @Resource 어노테이션을 이용하여 객체의 선언만 해주면
 * 된다.
 * 
 * @Resource(name="fileUtils") private FileUtils fileUtils;
 */
public class FileUtils {

	// Member
	private static final String filePath_Member = "xUpload\\MbrData\\Avata\\";
	private static final String filePath_TempImages_Member = "xUpload\\MbrData\\Avata\\Avata.bak\\";

	// Staffs
	private static final String filePath_Staff = "xUpload\\MbrData\\Avata\\";
	private static final String filePath_TempImages_Staff = "xUpload\\MbrData\\Avata\\Avata.bak\\";

	// Goods
	private static final String filePath_Goods = "xUpload\\GdsData\\";
	private static final String filePath_TempImages_Goods = "xUpload\\GdsData\\TempImages\\";

	// 파일저장 위치
	// 공통으로 가져가야하기 때문에 goods, staff 등등에 따라 나뉘어야함

	public List<Map<String, Object>> parseInsertFileInfo(
			Map<String, Object> map, HttpServletRequest request)
			throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		/*
		 * 이터레이터(Iterator) 패턴을 이용하여 request에 전송된 모든 name을 이용하려고 하는 부분이다.
		 * 
		 * Iterator는 어떤 데이터들의 집합체에서 컬렉션(Collection)으로부터 정보를 얻어올 수 있는 인터페이스다.
		 * Iterator를 사용하면 집합체와 개별원소들을 분리시켜서 생각할 수가 있는데, 그 집합체가 어떤 클래스의 인스턴스인지
		 * 신경쓰지 않아도 되는 장점이 있다.
		 * 
		 * 즉, request에 값이 전달될때에도 Map과 마찬가지로 key,value 쌍의 형식으로 데이터가 저장된다. 위의 태그에서
		 * name은 "file" 이라는 값이었고, reqeust에서 "file"이라는 키를 통해서 데이터를 가져올수 있는데, 이 경우
		 * 우리는 "file"이라는 키를 알고있지만, 실제로 개발을 하면, name값은 여러가지 다른 이름으로 넘어올수 있다. 따라서
		 * Iterator를 통해서 모든 name값을 알아서 가져오게 하면, 개발자는 name이 무엇인지를 몰라도, 쉽게 그 값을
		 * 사용할수 있다. Iterator에 대한 자세한 설명은 추후 따로 포스팅을 할 예정이다.
		 */
		System.out.println("iterator" + iterator);

		Calendar calender = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String now = dateFormat.format(calender.getTime());
		System.out.println("현재시간 " + now);

		String file_classification = (String) map.get("file_classification");
		String images_position = (String) map.get("images_position");
		System.out.println("파일 구분 " + file_classification);
		System.out.println("이미지위치" + images_position);
		
		
		String goods_id = (String) map.get("goods_id");
		/*
		 * goods
		 */

		String uploadRootPath = (String) map.get("uploadRootPath");

		System.out.println("uploadRootPath : " + uploadRootPath);

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String originalExceptFileExtension = null;
		String storedRFileName = null;
		String storedBFileName = null;
		String staff_AvaPic = "AvaPic_";

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		/*
		 * 클라이언트에서 전송된 파일 정보를 담아서 반환을 해줄 List이다. 여태까지는 단 하나의 파일만 전송을 하였지만,
		 * 다중파일전송을 하도록 수정할 계획이기 때문에 미리 그에 맞도록 구성하였다.
		 */
		Map<String, Object> listMap = null;

		//int staff_id = (int) map.get("staff_id");
		/*
		 * good면키가 있어야 하니 그 키부분
		 */

		try {

			if (file_classification.equals("goods")) {
				File file = new File(filePath_TempImages_Goods);
				if (file.exists() == false) {
					file.mkdirs();
					System.out.println("폴더생성");
				}
			}
			/*
			 * 파일을 저장할 경로에 해당폴더가 없으면 폴더를 생성하도록 하였다.
			 */

			Common_Utils cu = new Common_Utils();

			while (iterator.hasNext()) {
				System.out.println("파일생성진행");
				multipartFile = multipartHttpServletRequest.getFile(iterator
						.next());
				System.out.println("name =" + multipartFile.getName());
				System.out.println("filename ="
						+ multipartFile.getOriginalFilename());
				System.out.println("size =" + multipartFile.getSize());

				if (multipartFile.isEmpty() == false) { // 비어있는지 체크

					// 원래 파일이름
					originalFileName = multipartFile.getOriginalFilename();
					System.out
							.println("originalFileName = " + originalFileName);

					// 확장자 이름만.
					originalFileExtension = originalFileName
							.substring(originalFileName.lastIndexOf("."));
					System.out.println("originalFileExtension = "
							+ originalFileExtension);

					// 확장자 제외 파일이름
					originalExceptFileExtension = originalFileName.substring(0,
							originalFileName.lastIndexOf("."));

					System.out.println("originalExceptFileExtension = "
							+ originalExceptFileExtension);
					/*
					 * storedFileName = cu.getString(32, "A1") +
					 * originalFileExtension;
					 */

					/*
					 * 파일명
					 */
					// 원래는 실 파일은 확장자 통일을 하려고 했으나, 그냥 ! 원본 유지
					// storedRFileName = staff_AvaPic + staff_id + ".jpg";
					/*storedBFileName = staff_AvaPic + staff_id
							+ originalFileExtension;*/

					System.out.println("storedRFileName = " + storedBFileName);
					System.out.println("storedBFileName = " + storedBFileName);
					/*
					 * getString() 메서드를 이용하여 32자리의 랜덤한 파일이름을 생성하고 원본파일의 확장자를 다시
					 * 붙여주었다.
					 */

					// String RfilePath = filePath + storedFileName;
					// 위와 같이 가면, 루트파일이 말그대로 폴더 루트로 잡힌다. ~!!
					if (file_classification.equals("goods")) {

						storedBFileName = cu.getString(12, "A1") + "_" + now
								+ "_" + images_position + originalFileExtension;
						String RfilePath = uploadRootPath
								+ filePath_TempImages_Goods + storedBFileName;

						/*
						 * String BfilePath = uploadRootPath +
						 * filePath_TempImages + storedBFileName;
						 */
						/*
						 * // .bak 파일 file = new File(BfilePath);
						 * System.out.println("파일생성경로" + BfilePath);
						 */

						/*
						 * 참고
						 * 
						 * char ch = (char) ((Math.random() * 26) + 65);// 알파벳
						 * 랜덤값(A~Z) int r1 = (int) (Math.random() * 10);//
						 * 숫자랜덤값(0~9) int r2 = (int) (Math.random() * 10);//
						 * 숫자랜덤값(0~9)
						 */

						// 실제

						File file = new File(RfilePath);
						System.out.println("파일생성경로" + RfilePath);
						multipartFile.transferTo(file);
						/*
						 * 서버에 실제 파일을 저장하는 부분이다. multipartFile.transferTo() 메서드를
						 * 이용하여 지정된 경로에 파일을 생성하는것을 알 수 있다.
						 */
						GoodsAdminsServiceImpl gdAdmins = new GoodsAdminsServiceImpl();
						if(goods_id.equals("") || goods_id== null){
							//최초 상품등록인경우 무조권 이건은  goods_id 생성이지
							
							//String selectNextPk =  gdAdmins.selectNextPk();
							String selectNextPk =  "10000";
							System.out.println("pk"+selectNextPk);
							
							map.put("gFileName", RfilePath);
							map.put("goods_id", selectNextPk);
							map.put("gFileDesc", images_position);
							System.out.println("");
							System.out.println("GoodsId가 NULL인 경우");
							
							gdAdmins.insertGdsFiles(map);
							//DB에 파일저장 대표파일만 
							
						}else{
							//수정인경우
							
							map.put("gFileName", RfilePath);
							map.put("goods_id", goods_id);
							map.put("gFileDesc", images_position);
						}

					}

					listMap = new HashMap<String, Object>();
					listMap.put("ORIGINAL_FILE_NAME", originalFileName);
					listMap.put("STORED_FILE_NAME", storedRFileName);
					listMap.put("FILE_SIZE", multipartFile.getSize());
					list.add(listMap);
					/*
					 * 줄은 위에서 만든 정보를 list에 추가하는 부분이다.
					 */
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public static void totalFileProcess(Map<String, Object> map) throws Exception {
		
		// 이동전의 폴더에 있는 파일들을 읽는다.
		//List<File> dirList = getDirFileList(filePath_TempImages_Goods );
		GoodsAdminsDAO gdsDao = new GoodsAdminsDAO();
		List<Map<String, Object>> dirList = gdsDao.selectListGdsFilesList(map);
		
		
		// 폴더의 사이즈만큼 돌면서 파일을 이동시킨다.
		for (int i = 0; i < dirList.size(); i++) {
			// i번째 저장되어 있는 파일을 불러온다.
			File fileName = ((File) dirList.get(i));
			
			BufferedImage srcimage = ImageIO.read(fileName);
			///i번째 저장되어 있는 파일을 불러온다.
			   //String fileName = dirList.get(i).getName();
			
			System.out.println("image resizing");
			BufferedImage resizeimage50 = ImageUtill.scaleSize(srcimage,
					100, 100); //이미지 유틸
			BufferedImage resizeimage30 = ImageUtill.scaleSize(srcimage,
					250, 250);
			// 이미지 저장..
			// 각 goods_id에 맞게 
			System.out.println("image save");
			ImageUtill.saveImage(filePath_Goods, resizeimage50, ".jpg"); //이미지 유틸 클래스 
			ImageUtill.saveImage(filePath_Goods, resizeimage30, ".jpg");
			
			
			
			// 파일 삭제를 원한다면
			// fileDelete(inFolder+"\\"+fileName);

			// 파일 복사을 원한다면
			// fileCopy(inFolder+"\\"+fileName, outFolder+"\\"+fileName);

			// 파일 이동을 원한다면
			// fileMove(inFolder+"\\"+fileName, outFolder+"\\"+fileName);

			// 파일 생성을 원한다면
			// fileMake("C:/Users/INTERPARK/Desktop/test.txt");
		}

		/*String makeFile = "C:/Users/INTERPARK/Desktop/test.txt";

		// 파일의 존재 여부 확인
		if (fileIsLive(makeFile)) {
			// 파일이 존재할땐 파일을 불러옵니다.
			File f1 = new File(makeFile);
		} else {
			// 파일이 없을땐 파일을 생성합니다.
			fileMake(makeFile);
		}*/

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
			fileDelete(inFileName);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 디렉토리의 파일 리스트를 읽는 메소드
	public static List<File> getDirFileList(String dirPath) {
		// 디렉토리 파일 리스트
		List<File> dirFileList = null;

		// 파일 목록을 요청한 디렉토리를 가지고 파일 객체를 생성함
		File dir = new File(dirPath);

		// 디렉토리가 존재한다면
		if (dir.exists()) {
			// 파일 목록을 구함
			File[] files = dir.listFiles();

			// 파일 배열을 파일 리스트로 변화함
			dirFileList = Arrays.asList(files);
		}

		return dirFileList;
	}

}
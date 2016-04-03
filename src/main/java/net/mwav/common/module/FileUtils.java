package net.mwav.common.module;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	private static final String filePath = "\\xUpload\\MbrData\\Avata\\";
	private static final String filePath_TempImages = "\\xUpload\\MbrData\\Avata\\Avata.bak\\";

	// 파일저장 위치
	// 공통으로 가져가야하기 때문에 goods, staff 등등에 따라 나뉘어야함

	public List<Map<String, Object>> parseInsertFileInfo(
			Map<String, Object> map, HttpServletRequest request)
			throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		
		multipartFile = multipartHttpServletRequest
		.getFile(iterator.next());
		System.out.println(multipartFile.getName());
		System.out.println(multipartFile.getOriginalFilename());
		System.out.println(multipartFile.getSize());
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		/*
		 * 클라이언트에서 전송된 파일 정보를 담아서 반환을 해줄 List이다. 여태까지는 단 하나의 파일만 전송을 하였지만,
		 * 다중파일전송을 하도록 수정할 계획이기 때문에 미리 그에 맞도록 구성하였다.
		 */
		Map<String, Object> listMap = null;

		String staff_id = (String) map.get("staff_id");
		/*
		 * good면키가 있어야 하니 그 키부분
		 */

		try {
			File file = new File(filePath);
			if (file.exists() == false) {
				file.mkdirs();
			}
			File file_Temp = new File(filePath_TempImages);
			if (file_Temp.exists() == false) {
				file_Temp.mkdirs();
			}
			/*
			 * 34~37번째 줄은 파일을 저장할 경로에 해당폴더가 없으면 폴더를 생성하도록 하였다.
			 */

			Common_Utils cu = new Common_Utils();

			while (iterator.hasNext()) {
				multipartFile = multipartHttpServletRequest.getFile(iterator
						.next());
				if (multipartFile.isEmpty() == false) { // 비어있는지 체크
					originalFileName = multipartFile.getOriginalFilename();
					System.out
							.println("originalFileName = " + originalFileName);

					originalFileExtension = originalFileName
							.substring(originalFileName.lastIndexOf("."));
					System.out.println("originalFileExtension = "
							+ originalFileExtension);
					storedFileName = cu.getString(32, "A1")
							+ originalFileExtension;
					System.out.println("storedFileName = " + storedFileName);
					/*
					 * getString() 메서드를 이용하여 32자리의 랜덤한 파일이름을 생성하고 원본파일의 확장자를 다시
					 * 붙여주었다.
					 */

					String RfilePath = filePath + storedFileName;
					file = new File(RfilePath);
					System.out.println("파일생성경로" + RfilePath);
					multipartFile.transferTo(file);
					/*
					 * 서버에 실제 파일을 저장하는 부분이다. multipartFile.transferTo() 메서드를
					 * 이용하여 지정된 경로에 파일을 생성하는것을 알 수 있다.
					 */
				

					listMap = new HashMap<String, Object>();
					listMap.put("ORIGINAL_FILE_NAME", originalFileName);
					listMap.put("STORED_FILE_NAME", storedFileName);
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
}
package net.mwav.common.module;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @class name : FileHandler.java
 * @description : FileUtils를 위한 branch project
 * @author : (정) 정재현 (부)
 * @since : 2019. 7. 24.
 * @version : v1.0
 * @see 
 *  #method : File 업로드,다운,삭제 처리
 * @history : 
 * ---------------------------------------- 
 * Modification Information(개정이력) 
 * ---------------------------------------- 
 * 수정일             수정자         수정내용 
 * -------- -------- ---------------- 
 * 2019.      7. 24. 정재현 최초작성
 */
@Component("fileHandler")
public class FileHandler {
	// private List<String> fileNames; // upload
	// private byte[] fileByte; // down

	/**
	 * @method name : FileHandler
	 * @author : (정) 정재현
	 * @since : 2019. 7. 24.
	 * @version : v1.0
	 * @see : #method : upload
	 * @description : multipartRequest 파일업로드(저장)
	 * @history : 
	 * ---------------------------------------- 
	 * Modification Information(개정이력) 
	 * ---------------------------------------- 
	 * 수정일  		    수정자	    수정내용 
	 * -------- -------- ---------------- 
	 * 2019. 7.24. 정재현 		최초작성
	 * @param : MultipartHttpServletRequest multipartRequest
	 * @param : String filePath	 
	 * @return : List<String>: Multi 파일업로드 고려
	 * @throws :
	 * 
	 * <pre>
	 * {@code : 예제 코드 작성
	 *  List<String> fileNames = fileHandler.upload(multipartRequest, filePath);
	 * }
	 * </pre>
	 */
	public List<String> upload(MultipartHttpServletRequest multipartRequest, String filePath) {
		List<String> fileNames = new ArrayList<String>();

		// 받은 파일들을 모두 돌린다.
		Iterator<String> itr = multipartRequest.getFileNames();
		while (itr.hasNext()) {
			MultipartFile mpf = multipartRequest.getFile(itr.next());
			String originFileName = mpf.getOriginalFilename(); // 파일명
			String fileFullPath = null; // 파일 전체 경로
			fileFullPath = filePath + "/" + originFileName;

			try {
				// 경로가 없으면 생성
				File targetDir = new File(fileFullPath);
				if (!targetDir.exists()) {
					targetDir.mkdirs();
				}
				// 파일 저장
				mpf.transferTo(new File(fileFullPath));
				fileNames.add(originFileName);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return fileNames;
	}

	/**
	 * @method name : FileHandler
	 * @author : (정) 정재현
	 * @since : 2019. 7. 24.
	 * @version : v1.0
	 * @see : #method : deleteFile
	 * @description : 저장경로 파일삭제
	 * @history : 
	 * ---------------------------------------- 
	 * Modification Information(개정이력) 
	 * ---------------------------------------- 
	 * 수정일  		    수정자	    수정내용 
	 * -------- -------- ---------------- 
	 * 2019. 7.24. 정재현 		최초작성
	 * @param : String filePath	 
	 * @param : String fileName	 
	 * @return : boolean success flag return: 성공하면 true return
	 * @throws :
	 * 
	 * <pre>
	 * {@code : 예제 코드 작성
	 *  boolean success = fileHandler.deleteFile(filePath, "savedFileName.jpg");
	 * }
	 * </pre>
	 */
	public boolean deleteFile(String filePath, String fileName) {
		boolean success = false;
		String fullPath = filePath + "/" + fileName;
		File file = new File(fullPath);
		if (file.exists()) {
			success = file.delete();
		}
		return success;
	}	
	
	public byte[] dowonload(HttpServletResponse response, String filePath, String fileName) {
		
		String fullPath = filePath + "/" + fileName;
		// byte[] fileByte = FileUtils.readFileToByteArray(new File(fullPath));
		byte[] fileByte = null;
		try {
			fileByte = FileUtils.readFileToByteArray(new File(fullPath));
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);			
			response.setHeader("Content-Transfer-Encoding", "binary");			
			
		} catch (IOException e) {
			e.printStackTrace();
		}	
		return fileByte;
	}
}
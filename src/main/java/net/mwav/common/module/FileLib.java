package net.mwav.common.module;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

/**
 * @class name : FileLib.java
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

public class FileLib {

	private FileLib() {
	}

	private static class FileLibHolder {
		private static final FileLib fileLib = new FileLib();
	}

	public static FileLib getInstance() {
		return FileLibHolder.fileLib;
	}

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
	 * @param : byte[] contents - The contents of the file as an array of bytes 
	 * @param : String pathname 
	 * @return :
	 * @throws :
	 * 
	 * <pre>
	 * {@code : 예제 코드 작성
	 *  FileLib fileLib = FileLib.getInstance();
	 *  fileLib.upload(contents, pathname);
	 * }
	 * </pre>
	 */
	public void upload(byte[] contents, String pathname) throws Exception {
		File destination = new File(pathname);
		if (!destination.exists()) {
			destination.mkdirs();
		}
		destination.createNewFile();

		try (FileOutputStream fos = new FileOutputStream(destination);) {
			fos.write(contents);
		} catch (Exception e) {
			throw e;
		}
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
		String fullPath = filePath + "/" + fileName;
		File file = new File(fullPath);
		if (file.exists()) {
			return file.delete();
		}
		return false;
	}

	public byte[] dowonload(HttpServletResponse response, String filePath, String fileName) {

		String fullPath = filePath + "/" + fileName;
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
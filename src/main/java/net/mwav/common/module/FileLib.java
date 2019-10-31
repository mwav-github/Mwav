package net.mwav.common.module;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;

/**
 * <pre>description : Utility class to upload, delete and download Files</pre> 
 * @class name : FileLib.java
 * @author : (정) 정재현 
 * @since : 2019. 7. 24.
 * @version : v1.0
 * @see : java.io.File
 * @history : 
 * ---------------------------------------- 
 * Modification Information(개정이력) 
 * ---------------------------------------- 
 * 수정일             수정자         수정내용 
 * -------- -------- ---------------- 
 * 2019.7.24. 정재현 	  최초작성
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
	 * @method name : upload
	 * @author : (정) 정재현
	 * @since : 2019. 7. 24.
	 * @version : v1.0
	 * @see : java.io.File
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
	public void upload(byte[] contents, String parent, String child) throws Exception {
		File destination = new File(parent);
		if (!destination.exists()) {
			destination.mkdirs();
		}

		try (FileOutputStream fos = new FileOutputStream(new File(parent + File.separator + child));) {
			fos.write(contents);
		} catch (Exception e) {
			throw e;
		}
	}

	/**
	 * @method name : delete
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
	 * @param : String pathname	 
	 * @return : boolean success flag return: 성공하면 true return
	 * @throws :
	 * 
	 * <pre>
	 * {@code : 예제 코드 작성
	 *  boolean success = fileLib.delete(filePath, "savedFileName.jpg");
	 * }
	 * </pre>
	 */
	public boolean delete(String parent, String child) throws Exception {
		File file = new File(parent, child);
		return file.exists() ? file.delete() : false;
	}

	/**
	 * @method name : dowonload
	 * @author : (정) 정재현
	 * @since : 2019. 7. 24.
	 * @version : v1.0
	 * @see :
	 * @description : 저장경로 파일삭제
	 * @history : 
	 * ---------------------------------------- 
	 * Modification Information(개정이력) 
	 * ---------------------------------------- 
	 * 수정일  		    수정자	    수정내용 
	 * -------- -------- ---------------- 
	 * 2019. 7.24. 정재현 		최초작성
	 * @param : String pathname
	 * @return : boolean success flag return: 성공하면 true return
	 * @throws :
	 * 
	 * <pre>
	 * {@code : 예제 코드 작성
	 *  boolean success = fileHandler.deleteFile(filePath, "savedFileName.jpg");
	 * }
	 * </pre>
	 */
	public byte[] dowonload(String parent, String child) throws Exception {
		return Files.readAllBytes(new File(parent, child).toPath());
	}
}
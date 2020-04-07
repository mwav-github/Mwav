package net.admins.service;

import java.nio.file.FileSystems;
import java.nio.file.WatchService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.admins.dao.CommonDAO;
import net.admins.dao.StaffDAO;
import net.admins.vo.WatchVO;
import net.common.common.CommandMap;
import net.common.common.WatchController;
import net.mwav.common.module.FileUtils;
import net.mwav.common.module.GeneralConfig;
import net.mwav.common.module.XmlLib;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Service("CommonService")
@PropertySource("classpath:googleProperties/application.properties")
public class CommonServiceImpl implements CommonService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "commonDAO")
	private CommonDAO commonDAO;
	
	@Value("${cache.fileName}")
	private String fileName;
	
	@Autowired private ServletContext servletContext;

	@Override
	public Map<String, Object> insertGdsUpLoader(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		/*
		 * 파일업로드
		 * 
		 * http://toriworks.tistory.com/entry/Spring%EC%97%90%EC%84%9C-%ED%8C%8C%EC%9D%
		 * BC-%EC%97%85%EB%A1%9C%EB%93%9C-%EA%B5%AC%ED%98%84%ED%95%B4-%EB%B3%B4%EA%B8%B0
		 */
		// /////////////////////////
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		System.out.println("ㅇㅇ");
		System.out.println("multipartHttpServletRequest=" + multipartHttpServletRequest);
		/*
		 * (MultipartHttpServletRequest)request; 부분이다. 위에서 첨부파일은 Multipart 형식의 데이터이며,
		 * HttpServletRequest에 담겨서 서버로 전송된다고 이야기하였다. HttpServletRequest 그 자체로는
		 * Multipart형식의 데이터를 조작하는데 어려움이 있기 때문에, MultipartHttpServletRequset 형식으로 형변환을
		 * 하였다.
		 */
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		System.out.println("d" + multipartHttpServletRequest.getFileNames());
		/*
		 * 
		 * 이터레이터(Iterator) 패턴을 이용하여 request에 전송된 모든 name을 이용하려고 하는 부분이다. Iterator는 어떤
		 * 데이터들의 집합체에서 컬렉션(Collection)으로부터 정보를 얻어올 수 있는 인터페이스다.
		 * 
		 * Map에서 데이터를 가져오려면 그 Map에 있는 키(Key)를 알아야 접근이 가능하다거나, for문 등의 반복문을 사용할수가 없는것을
		 * 생각하면 된다. 여기서는 Iterator를 이용하여 Map에 있는 데이터를 while문을 이용하여 순차적으로 접근하려고 한다.
		 */
		MultipartFile multipartFile = null;
		multipartFile = multipartHttpServletRequest.getFile(iterator.next());

		System.out.println(multipartFile.getName());
		System.out.println(multipartFile.getOriginalFilename());
		System.out.println(multipartFile.getSize());
		log.debug("------------- file start -------------");
		log.debug("name : " + multipartFile.getName());
		log.debug("filename : " + multipartFile.getOriginalFilename());
		log.debug("size : " + multipartFile.getSize());
		log.debug("-------------- file end --------------\n");

		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);

		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			/*
			 * MultipartFile 객체에 request에서 파일 객체를 가져오는 부분이다. multipartHttpServletRequest의
			 * getFile() 메서드는 request에 저장된 파일의 name을 인자로 받는다. *.
			 * 
			 * 이 name을 Iterator를 통해서 가져온다고 이야기를 하였다. 그것이 Iterator.next() 메서드다.
			 * 
			 * hasNext() 메서드는 Iterator 내에 그 다음 데이터의 존재 유무를 알려주고, next() 메서드는 Iterator 내의
			 * 데이터를 가져온 후, 커서를 다음위치로 이동시킨다.
			 * 
			 * multipartFile.isEmpty()를 통해서 실제 파일정보가 있는지 검사한 후에, getName(),
			 * getOriginalFilename(), getSize() 메서드 등을 통해서 파일의 정보를 출력하고 있다.
			 */
			if (multipartFile.isEmpty() == false) {
				log.debug("------------- file start -------------");
				log.debug("name : " + multipartFile.getName());
				log.debug("filename : " + multipartFile.getOriginalFilename());
				log.debug("size : " + multipartFile.getSize());
				log.debug("-------------- file end --------------\n");
			}
		}
		// ////////////////////////
		return map;
	}

	/**
	 * @author 박정은
	 * @since
	 * @version 1.0
	 * @see
	 */
	@Override
	@Cacheable(value = "xmlCache", key = "#xml") // key를 설정해줘야 함
	public GeneralConfig getFrontFooter(HttpServletRequest request, String xml) throws Exception {
		WatchVO watchVO = new WatchVO();
		WatchController watchController = new WatchController();
		
		watchVO.setCacheKey(xml);
		CreateWatchMap(watchVO);
		watchController.watchService(watchVO);
		
		GeneralConfig generalConfig = (GeneralConfig) XmlLib.getInstance().unmarshal(watchVO.getFilePath() + watchVO.getFileName(),
				GeneralConfig.class);
		return generalConfig;
	}

	@Override
	public void CreateWatchMap(WatchVO watchVO) {
		watchVO.setFilePath(servletContext.getRealPath("/xConfig/"));
		watchVO.setFileName(fileName);
		watchVO.setCacheValue("xmlCache");
	}
}
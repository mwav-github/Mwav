package net.sample.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.common.common.CommandMap;
import net.mwav.common.module.FileLib;
import net.sample.service.SampleService;

/* 
 * - Controller > Service > ServiceImpl > DAO > SQL(XML) > JSP
 * 
  컨트롤러(Controller)는 웹 클라이언트에서 들어온 요청을 해당 비즈니스 로직을 호출하고, 수행결과와 함께 응답을 해주는 Dispatcher 역할을 한다. 
  클래스의 선언부에 @Controller 어노테이션(Annotation)을 이용하여, Controller 객체임을 선언한다. 
 */

@Controller
public class SampleController {
	Logger log = Logger.getLogger(this.getClass());

	/*Service 영역의 접근을 위한 선언 
	  @Resource어노테이션을 통해서 필요한 빈(bean)을 수동으로 등록하는것이다. 
	   그리고 수동으로 등록할 빈의 이름이 "sampleService"이고, 이는 @Service("sampleService")라고 선언했을 때의 그 이름인것을 확인한다.
	 
	 만약 Inject/ Autowired 이면 타입으로 연결(BoardService)
	 * */
	@Resource(name = "sampleService")
	private SampleService sampleService;

	/*@RequestMapping 이라는 부분이 웹 클라이언트 (jsp)에서 들어온 요청에 해당하는 비지니스 로직을 찾아주는 역할을 한다.
	 *뒤에 method는 이 요청이 POST 인지, GET 방식인지를 말해주는데 우리는 앞으로 거의 대부분을 POST로 보낼것이기 때문에, 이 부분은 지울 계획이다.
	 *
	 *@RequestMapping(value = "/", method = RequestMethod.GET)
	 *  //어노테이션 설정 /sample/openBoardList.mwav으로 url요청이 들어오면 이 주소는 @RequestMapping 어노테이션과 매핑되어, 해당 메서드가 실행된다. 
	 *  ModelAndView 객체를 생성하게 된다. 페이지와 매핑된다 실제 디렉토리 구조 + .jsp.
	*/
	@RequestMapping(value = "/sample/openBoardList.mwav")
	public ModelAndView openBoardList(CommandMap commandMap) throws Exception {
		/* 우리가 화면에 보여줄 jsp파일을 의미한다. */
		ModelAndView mv = new ModelAndView("/sample/boardList");

		/* list라는 단순한 변수의 선언 각각 키와값으로 구성
		 *  sampleService.selectBoardList 메서드를 통해 얻어온 결과 list를 "list"라는 이름으로 저장하고 있다.
		 *  
		 *  request.setattribute("hi","hi") 한것 처럼 ! 
		 *  */
		List<Map<String, Object>> list = sampleService.selectBoardList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping(value = "/sample/openBoardWrite.mwav")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/sample/boardWrite");

		return mv;
	}

	@RequestMapping(value = "/sample/insertBoard.mwav")
	public ModelAndView insertBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.mwav");

		sampleService.insertBoard(commandMap.getMap());

		return mv;
	}

	@RequestMapping(value = "/sample/openBoardDetail.mwav")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/sample/boardDetail");

		Map<String, Object> map = sampleService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	/*
	 * 20190504,정재현,파일업로드 테스트 fileHandler 테스트
	 */
	@RequestMapping(value = "/FileTestSample/FileTestMain.mwav")
	public ModelAndView redirectFileTestSampleController(HttpServletRequest request) throws Exception {
		String url = request.getRequestURI();
		int pos = url.lastIndexOf(".");

		String ext_url = null;
		ext_url = url.substring(0, pos);
		ModelAndView mv = new ModelAndView("CommonApps/Goods/fileUploader");

		return mv;
	}

	/*
	 * 정재현,파일업로드 테스트,fileHandler 테스트
	 */
	@RequestMapping(value = "/FileTestSample/TempUpload.mwav", method = RequestMethod.POST)
	@ResponseBody
	public boolean tempUpload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String filePath = "/xUpload/Temp";
		FileLib fileLib = FileLib.getInstance();
		
		Iterator<String> iterator = multipartRequest.getFileNames();
		while(iterator.hasNext()) {
			MultipartFile multipartFile = multipartRequest.getFile(iterator.next());
			String originalFileName = multipartFile.getOriginalFilename();
			
			String pathname = filePath + "/" + originalFileName;
			byte[] contents = multipartFile.getBytes();
			fileLib.upload(contents, pathname);
		}
		
		return true;
	}

	@RequestMapping(value = "/sample/openBoardUpdate.mwav")
	public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/sample/boardUpdate");

		Map<String, Object> map = sampleService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value = "/sample/updateBoard.mwav")
	public ModelAndView updateBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/sample/openBoardDetail.mwav");

		sampleService.updateBoard(commandMap.getMap());

		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}

	@RequestMapping(value = "/sample/deleteBoard.mwav")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.mwav");

		sampleService.deleteBoard(commandMap.getMap());

		return mv;
	}
}
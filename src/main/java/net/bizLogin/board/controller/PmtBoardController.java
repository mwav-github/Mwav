package net.bizLogin.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.bizLogin.board.service.PmtBoardService;
import net.common.common.CommandMap;


/**
 *  해당 클래스에 대한 설명을 기입 <p>
 *  줄 구분을 위해서는 <p> 태그 사용
 * <pre>
 * {@code
 * // 예제코드 작성
 * 
 * }
 * </pre>
 * @author 저자1
 * @author 저자2
 * @since 작성 버전
 * @version 현재 버전
 * @see 참고해야할 package 혹은 method
 * @see java.util.Arrays#copyOf(byte[], int)
 * @see #method(String)
 */
@Controller
public class PmtBoardController {
	Logger log = Logger.getLogger(this.getClass());


	String mode;
	@Resource(name = "pmtBoardService")
	private PmtBoardService pmtBoardService;

	
	/**
		 * 메서드에 대한 설명
		 * <pre>
		 * {@code
		 * // 예제코드 작성
		 * 
		 * }
		 * </pre>
		 * @param param1 parameter에 대한 설명(필수)
	             * @param param2
		 * @return return 값에 대한 설명(필수)
		 * @throws Exception 발생하는 예외에 대한 설명(필수) 
	 * @see 해당 메서드와 연관된 메서드
	 * @since 작성 버전
	 * @version 현재 버전
	*/
	@RequestMapping(value = "/sample/ab.mwav")
	public ModelAndView openBoardList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/sample/boardList");

		pmtBoardService.insertBoard(commandMap.getMap());

		return mv;
	}
}

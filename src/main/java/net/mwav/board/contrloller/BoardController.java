package net.mwav.board.contrloller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.common.common.CommandMap;
import net.mwav.board.service.BoardService;

@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());

	// - Controller > Service > ServiceImpl > DAO > SQL(XML) > JSP

	@Resource(name = "boardService")
	private BoardService boardService;

	// 1번 FrontNewsList : 메인페이지 앞단 5개씩 출력, 작성일 기준
	@RequestMapping(value = "/board/bnsFrontList.do")
	public ModelAndView selectFrontList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(
				"/CommonApps/BoardNews/FrontNewsList");
		// * action-servlet.xml에서 위에 .jsp 설정해줘서 위의 CommonApps 부터 되는거
		System.out.println("순서");
		log.debug("인터셉터 테스트");
		if (commandMap.isEmpty() == false) {
			System.out.println("들어옴");
			Iterator<Entry<String, Object>> iterator = commandMap.getMap()
					.entrySet().iterator();
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ",\tvalue : "
						+ entry.getValue());
				System.out.println("key : " + entry.getKey() + ",\tvalue : "
						+ entry.getValue());
			}
		}
		
		List<Map<String, Object>> boardFrontList = boardService
				.selectFrontList(commandMap.getMap());

		if (boardFrontList != null && !boardFrontList.isEmpty()) {
			mv.addObject("boardFrontList", boardFrontList);
		}

		return mv;
	}

	// 2번 bnsForm : From 입력만 가능 (뒤로가기, list)
	@RequestMapping(value = "/board/bnsForm.do")
	public ModelAndView insertbnsForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("Company/ThePress/ThePress");
		System.out.println("순서");
		log.debug("인터셉터 테스트");
		List<Map<String, Object>> insertbnsForm = boardService
				.insertbnsForm(commandMap.getMap());

		if (insertbnsForm != null && !insertbnsForm.isEmpty()) {
			mv.addObject("insertbnsForm", insertbnsForm);
		}

		return mv;
	}

	// 3번 bnsView : 수정/삭제가능
	@RequestMapping(value = "/board/bnsView.do")
	public ModelAndView selectbnsView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/CommonApps/BoardNews/bnsView");
		System.out.println("순서");

		if (commandMap.isEmpty() == false) {
			System.out.println("들어옴");
			Iterator<Entry<String, Object>> iterator = commandMap.getMap()
					.entrySet().iterator();
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ",\tvalue : "
						+ entry.getValue());
				System.out.println("key : " + entry.getKey() + ",\tvalue : "
						+ entry.getValue());
			}
		}

		log.debug("인터셉터 테스트");
		Map<String, Object> selectboardView = boardService
				.selectbnsView(commandMap.getMap());

		if (selectboardView != null && !selectboardView.isEmpty()) {
			mv.addObject("selectboardView", selectboardView);
		}

		return mv;
	}

	@RequestMapping(value = "/board/bnsList.do")
	public ModelAndView selectbnsList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/CommonApps/BoardNews/bnsList");

		List<Map<String, Object>> selectboardList = boardService
				.selectbnsList(commandMap.getMap());
		mv.addObject("selectboardList", selectboardList);

		return mv;
	}
}

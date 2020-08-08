package net.admins.controller;

import net.admins.service.AdminPromoterService;
import net.common.common.CommandMap;
import net.mwav.common.module.Paging;
import net.mwav.common.module.PagingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
public class AdminPromoterController {

    private final AdminPromoterService pmtService;

    @Autowired
    public AdminPromoterController(AdminPromoterService pmtService) {
        this.pmtService = pmtService;
    }

    @RequestMapping(value = "/admins/staff/pmtList.mwav")
    public ModelAndView selectListPmtList(CommandMap commandMap, HttpServletRequest request, HttpServletResponse reponse) throws Exception {
        ModelAndView mv = new ModelAndView("/Admins/CompanyMgr/Staff/PmtList");

        String pageNum = (String) commandMap.get("pageNum");
        Paging paging = new Paging();
        if (pageNum == null) {
            pageNum = "1";
        }
        int totalRow = pmtService.selectPmtOneGetTotalCount(commandMap);


        List<Map<String, Object>> selectListPmtList;
        PagingVO pagingVO = paging.setPagingInfo(totalRow, 5, pageNum); // 총 숫자,
        // 한페이지에
        // 노출 수
        commandMap.put("startRow", paging.getStartRow(pageNum)); // 시작 열
        commandMap.put("endRow", paging.getEndRow(pageNum)); // 끝 열
        if (totalRow > 0) {
            selectListPmtList = pmtService.selectListPmtList(commandMap.getMap());
        } else {
            selectListPmtList = Collections.emptyList();
        }

        mv.addObject("selectListPmtList", selectListPmtList);
        mv.addObject("pagingVO", pagingVO);
        mv.addObject("totalRow", totalRow);

        String mm = "firms";
        mv.addObject("mm", mm);
        mv.addObject("mode", "m_stfList");

        // mv.addObject("paging", pv.print());
        return mv;
    }

    @RequestMapping(value = "/admins/staff/pmtForm.mwav")
    public ModelAndView insertPmtForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/admins/staff/pmtList.mwav");

        // PromoterValueLog_tbl 로그를 위해 최초 IP입력
        commandMap.put("pvlIpAddress", request.getRemoteAddr());
        commandMap.put("pmtSpecialtyName", request.getParameterValues("pmtSpecialtyName"));
        pmtService.insertPmtForm(commandMap);

        // TODO : 등록 후 mode, mm 쿼리스트링 수정필요
        mv.addObject("mm", "firms");
        mv.addObject("mode", "m_stfForm");
        return mv;
    }

    /*
        return
            true : 중복된 아이디가 없음으로 가입이 가능함
            false: 이미 존재하는 아이디가 있으므로 가입이 불가능함
     */
    @RequestMapping(value="/admins/staff/pmtLoginIdCheck.mwav")
    public @ResponseBody
    boolean selectOneMbrPmtIdCheck(String pmtLoginId) throws Exception {
        return pmtService.selectOnePmtLoginIdCheck(pmtLoginId);
    }

    @RequestMapping(value = "/admins/staff/pmtView.mwav")
    public ModelAndView selectPmtView(CommandMap commandMap, String promoter_id) throws Exception {
        ModelAndView mv = new ModelAndView("/Admins/CompanyMgr/Staff/PmtView");
        Map<String, Object> selectPmtView = pmtService.selectPmtView(promoter_id);

        mv.addObject("mm", "firms");
        mv.addObject("mode", "m_stfView");
        mv.addObject("selectPmtView", selectPmtView);

        return mv;
    }

    @RequestMapping(value = "/admins/staff/pmtUpdateForm.mwav")
    public ModelAndView updatePmtform(CommandMap commandMap, String promoter_id) throws Exception {
        ModelAndView mv = new ModelAndView("/Admins/CompanyMgr/Staff/PmtUpdateForm");

        Map<String, Object> map = pmtService.updatePmtForm(promoter_id);

        mv.addObject("mm", "firms");
        mv.addObject("mode", "m_stfUpdate");
        mv.addObject("updatePmtForm", map);
        return mv;
    }

    @RequestMapping(value = "/admins/staff/pmtUpdate.mwav", method = RequestMethod.POST)
    public ModelAndView updatePmt(CommandMap commandMap, HttpServletRequest request, String promoter_id) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/admins/staff/pmtView.mwav");
        // PromoterValueLog_tbl 로그를 위해 최초 IP입력
        commandMap.put("pvlIpAddress", request.getRemoteAddr());
        // 전문 분야 체크 박스
        commandMap.put("pmtSpecialtyName", request.getParameterValues("pmtSpecialtyName"));

        pmtService.updatePmt(commandMap);

        mv.addObject("promoter_id", promoter_id);
        return mv;
    }

    /*
        return
     */
    @RequestMapping(value="/admins/staff/pmtUpdatePassword.mwav", method = RequestMethod.POST)
    public @ResponseBody boolean updatePmtPassword(HttpServletRequest req, CommandMap commandMap) throws Exception {
        commandMap.put("pvlIpAddress", req.getRemoteAddr());
        return pmtService.updatePmtPassword(commandMap);
    }

    @RequestMapping(value = "/admins/staff/pmtLeave.mwav", method = RequestMethod.POST)
    public ModelAndView leavePmt(CommandMap commandMap, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/admins/staff/pmtList.mwav");
        // PromoterValueLog_tbl 로그를 위해 최초 IP입력
        commandMap.put("pvlIpAddress", request.getRemoteAddr());

        pmtService.leavePmt(commandMap);

        return mv;
    }

    @RequestMapping(value = "/admins/staff/selectStaffSeek.mwav", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectStaffSeek(CommandMap commandMap){
        return pmtService.selectStaffSeek(commandMap);
    }

    @RequestMapping(value = "/admins/staff/pmtReturn.mwav", method = RequestMethod.POST)
    public ModelAndView returnPmt(CommandMap commandMap, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/admins/staff/pmtView.mwav");
        // PromoterValueLog_tbl 로그를 위해 최초 IP입력
        commandMap.put("pvlIpAddress", request.getRemoteAddr());

        pmtService.returnPmt(commandMap);

        mv.addObject("promoter_id",commandMap.get("promoter_id"));
        return mv;
    }
}

package net.admins.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import net.common.common.CommandMap;
import net.mwav.common.module.GeneralConfig;

public interface CommonService {

	Map<String, Object> insertGdsUpLoader(Map<String, Object> map, HttpServletRequest request) throws Exception;

	/*========================================등록========================================*/
	public GeneralConfig getFrontFooter(HttpServletRequest request) throws Exception;
}

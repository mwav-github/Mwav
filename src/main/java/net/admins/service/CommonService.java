package net.admins.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.admins.vo.WatchVO;
import net.mwav.common.module.GeneralConfig;

public interface CommonService {

	Map<String, Object> insertGdsUpLoader(Map<String, Object> map, HttpServletRequest request) throws Exception;

	public GeneralConfig getFrontFooter(HttpServletRequest request, String xml) throws Exception;

	public void CreateWatchMap(WatchVO watchVO);
}

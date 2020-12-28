package net.bizLogin.promoter.service;

import net.common.common.CommandMap;

import java.util.Map;

public interface PmtFacilitatorService {
	/*========================================등록========================================*/
	void insertPmtForm(CommandMap commandMap) throws Exception ;
	boolean selectOnePmtLoginIdCheck(String stfLoginId) throws Exception;
	/*========================================업데이트========================================*/

}

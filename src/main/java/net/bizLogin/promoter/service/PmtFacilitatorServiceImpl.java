package net.bizLogin.promoter.service;

import java.util.Map;

import javax.annotation.Resource;

import net.common.common.CommandMap;
import net.mwav.common.module.AesEncryption;
import org.springframework.stereotype.Service;

import net.bizLogin.promoter.dao.PmtFacilitatorDAO;
import org.springframework.transaction.annotation.Transactional;


@Service("pmtFacilitatorService")
public class PmtFacilitatorServiceImpl implements PmtFacilitatorService {

	@Resource(name = "pmtFacilitatorDAO")
	private PmtFacilitatorDAO pmtFacilitatorDAO;

	/**
	 * 메서드에 대한 설명
	 * <pre>
	 * {@code
	 * // 예제코드 작성
	 *
	 * }
	 * </pre>
	 * @param CommonMap Customized CommonMap
	 * @return return 값에 대한 설명(필수)
	 * @throws Exception 발생하는 예외에 대한 설명(필수)
	 * @see 해당 메서드와 연관된 메서드
	 * @since 작성 버전
	 * @version 현재 버전
	 */
	@Transactional
	@Override
	public void insertPmtForm(CommandMap commandMap) throws Exception {
		String pmtLoginId = commandMap.get("pmtLoginId").toString().trim();
		commandMap.put("pmtLoginId", pmtLoginId);
		// AES/CBC/IV 암호화 (키,암호화텍스트,iv)\
		String pmtLoginPw = (String) commandMap.get("pmtLoginPw");
		byte[] encrypted = AesEncryption.aesEncryptCbc(AesEncryption.sKey, pmtLoginPw, AesEncryption.sInitVector);

		// 암호화된 값이 String으로 반환
		commandMap.put("pmtLoginPw", AesEncryption.aesEncodeBuf(encrypted));
		String pmtGender = (String)commandMap.get("pmtGender");
		commandMap.put("pmtGender", (pmtGender.equals("M") ? "0" :"1"));

		String pmtFirstName = commandMap.get("pmtFirstName").toString().trim();
		String pmtLastName = commandMap.get("pmtLastName").toString().trim();
		commandMap.put("pmtFirstName", pmtFirstName);
		commandMap.put("pmtLastName", pmtLastName);

		// Promoter_tbl
		pmtFacilitatorDAO.insertPromoter_tbl(commandMap);
		pmtFacilitatorDAO.insertPromoterValue_tbl(commandMap);
		// PromoterValueLog_tbl
		commandMap.put("pvlRemark", "신규 회원가입");
		pmtFacilitatorDAO.insertPromoterValueLog_tbl (commandMap);
	}
	public boolean selectOnePmtLoginIdCheck(String stfLoginId) throws Exception{
		return pmtFacilitatorDAO.selectOnePmtLoginIdCheck(stfLoginId) == 0 ? true : false;
	}



}

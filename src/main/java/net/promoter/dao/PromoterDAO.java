package net.promoter.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import net.common.dao.AbstractDAO;
import net.mwav.common.module.AesEncryption;
import net.promoter.vo.PromoterValue_VO;
import net.promoter.vo.Promoter_VO;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Repository("promoterDAO")
public class PromoterDAO extends AbstractDAO{
	byte[] decrypted = null;
	byte[] encrypted = null;

	// Abstrat로 변경

	/*
	 * ========================================등록================================
	 * ========
Structure101
	 */

	public int selectNextPmtPk(){
		return (int) selectOne("promoter.selectNextPmtPk");
	}

	public int selectOnePmtLoginIdCheck(String pmtLoginId) {
		// TODO Auto-generated method stub
		int check;
		System.out.println("값이?=" + selectOne("promoter.selectOnePmtLoginIdCheck", pmtLoginId));
		if (selectOne("promoter.selectOnePmtLoginIdCheck", pmtLoginId) == null) {
			check = 0; // 아이디가 없는 경우
		} else {
			check = 1; // 아이디가 있는 경우
		}

		return check;
	}

	@Transactional
	public int insertPmtForm(Promoter_VO promoter) {
		// TODO Auto-generated method stub
		try {
			/*
			 * String sKey = "ABC"; String sInitVector = "123가나다";
			 */
			// byte[] encrypted = null;

//			String b_PmtLoginPw = (String) map.get("pmtLoginPw");
			String b_PmtLoginPw = promoter.getPmtLoginPw();
			
			System.out.println("* AES/CBC/IV");
			System.out.println("b_stfLoginPw=" + b_PmtLoginPw);
			System.out.println("    - KEY : " + AesEncryption.sKey); // Static
																		// 변수
			System.out.println("    - IV : " + AesEncryption.sInitVector); // Static
																			// 변수
			System.out.println("    - TEXT : " + b_PmtLoginPw);

			// AES/CBC/IV 암호화 (키,암호화텍스트,iv)
			encrypted = AesEncryption.aesEncryptCbc(AesEncryption.sKey,
					b_PmtLoginPw, AesEncryption.sInitVector);

			// 암호화된 값이 String으로 반환
			String sBase = AesEncryption.aesEncodeBuf(encrypted);

			// String b2_mbrLoginPw = AesTest.toHexString(encrypted);
			System.out.println("    - TEXT2 : " + sBase);

//			map.put("pmtLoginPw", sBase);
			promoter.setPmtLoginPw(sBase);
			
			if (encrypted == null) {
				System.out.println("    - Encrypted : ERROR!!!");
			} else {
				System.out.println("    - Encrypted : " + sBase); // 암호화된 String
																	// 값
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int result =0;
		int promoterid = (int)selectOne("promoter.selectNextPmtPk");	//Promoter_tbl.promoter_id의 가장 max 값을 가져온다.
		
		promoter.setPromoter_id(promoterid);
		System.out.println(" 최종 : " +  promoter);
		result = (int) insert("promoter.insertPmtForm", promoter);		//한쪽이 에러가 나는 경우를 대비해 트랜잭션 처리를 해야함.. 근데 처리를 위해선 구조를 크게 바꿔야함 (보류)
		result = (int) insert("promoter.insertPmtValueForm",promoter);
		
		return result;
	}

	public List<Map<String, Object>> selectListPmtList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("promoter.selectListPmtList",
				map);
	}
	public int selectOneGetTotalCount(){
		return  (int) selectOne("promoter.selectOneGetTotalCount");
	}

	public Promoter_VO selectOnePmtInfo(String promoter_id){
		return (Promoter_VO)selectOne("promoter.selectOnePmtInfo",promoter_id);
	}

	//update

	public int updatePmtPro(Map<String, Object> map){
		return (int)update("promoter.updatePmtPro",map);
	}

	public int updatePmtValueForm(Map<String, Object> map){
		return (int)update("promoter.updatePmtValueForm",map);
	}

	public int updatePmtVisitNbr(String promoter_id){
		return (int)update("promoter.updatePmtVisitNbr",promoter_id);
	}
	public Promoter_VO selectPmtLogin(Map<String, Object> map){
		return (Promoter_VO)selectOne("promoter.selectPmtLogin",map);
	}

	public Date selectChkPmtCertifyDt(String promoter_id){
		return (Date) selectOne("promoter.selectChkPmtCertifyDt",promoter_id);
	}

}


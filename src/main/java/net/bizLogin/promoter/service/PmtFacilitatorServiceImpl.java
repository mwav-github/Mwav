package net.bizLogin.promoter.service;

import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import net.bizLogin.promoter.dao.PmtFacilitatorDAO;
import net.bizLogin.promoter.vo.PmtFacilitatorSO;
import net.bizLogin.promoter.vo.PmtFacilitatorVO;


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
		 * @param param1 parameter에 대한 설명(필수)
	             * @param param2
		 * @return return 값에 대한 설명(필수)
		 * @throws Exception 발생하는 예외에 대한 설명(필수) 
	 * @see 해당 메서드와 연관된 메서드
	 * @since 작성 버전
	 * @version 현재 버전
	*/
	@Override
	public void insertBoard(Map<String, Object> map) {

		
	}
	
	@Override
	public PmtFacilitatorVO checkSocialJoin(PmtFacilitatorSO so) {
		PmtFacilitatorVO vo = pmtFacilitatorDAO.checkSocialJoin(so);
		return vo;
	}


	@Override
	public PmtFacilitatorVO joinSocialLogin(PmtFacilitatorSO so) {
		PmtFacilitatorVO check = checkSocialJoin(so); // boolean 말고 VO로 받아서 밑에 if문에서 id가 null인지 체크
		// 기가입된 소셜계정이 아니라면 가입시킨다
		if(check == null) {
			pmtFacilitatorDAO.joinSocialLogin(so); // insert 한 뒤 error나는 경우 처리 해주기
			check = checkSocialJoin(so);
		}
		return check; // return VO를 해준다..
	}

}

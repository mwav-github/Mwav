package net.bizLogin.board.service;

import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import net.bizLogin.board.dao.PmtBoardDAO;

@Service("pmtBoardService")
public class PmtBoardServiceImpl implements PmtBoardService {

	@Resource(name = "pmtBoardDAO")
	private PmtBoardDAO pmtBoardDAO;


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



}

package net.sample.service;

import java.util.List;
import java.util.Map;
/*
 * Service 영역은 두개의 파일로 구성된다. Service 인터페이스와 이 인터페이스를 실제로 구현한 ServiceImpl 클래스로 구성이 되어있다. 
 * 이는 Spring의 IoC/DI (Inversion of Control / Dependency Injection) 기능을 이용한 Bean 관리 기능을 사용하기 위함이다. 
 * 
 */

public interface SampleService {
	
	// 하단) 파라미터를 맵으로 받을 것이다. @Param 어노테이션을 사용한 결과 패키지 명으로 받는다. 
	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;

	void insertBoard(Map<String, Object> map) throws Exception;

	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;

	void updateBoard(Map<String, Object> map) throws Exception;

	void deleteBoard(Map<String, Object> map) throws Exception;

}

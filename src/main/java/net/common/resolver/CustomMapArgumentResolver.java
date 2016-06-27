package net.common.resolver;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import net.common.common.CommandMap;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

/*
 * HandlerMethodArgumentResolver 는 스프링 3.1에서 추가된 인터페이스다
 * 스프링 사용 시, 컨트롤러(Controller)에 들어오는 파라미터(Parameter)를 수정하거나 공통적으로 추가를 해주어야 하는 경우가 있다. 
 예를 들어, 로그인을 한 사용자의 사용자 아이디나 닉네임등을 추가하는것을 생각해보자. 
 보통 그런 정보는 세션(Session)에 담아놓고 사용하는데, DB에 그러한 정보를 입력할 때에는 
 결국 세션에서 값을 꺼내와서 파라미터로 추가를 해야한다.
 그런 경우가 뭐 하나나 두번 정도 있다면 몰라도, 여러번 사용되는 값을 그렇게 일일히 세션에서 가져오는건 상당히 번거로운 일이다.
 HandlerMethodArgumentResolver 는 사용자 요청이 Controller에 도달하기 전에 그 요청의 파라미터들을 수정할 수 있도록 해준다.
 * 
 * 
 * 두가지 메서드를 반드시 구현해야 하는데, supportsParameter 메서드와 resolveArgument 메서드가 그것이다. 
 * 
 * 
 * http://www.egovframe.go.kr/wiki/doku.php?id=egovframework:rte2:ptl:annotationcommandmapargumentresolver
 * >히스토리
 * 
 * http://kwonnam.pe.kr/wiki/springframework/mvc/handlermethodargumentresolver
 * >간략설명
 * 
 * http://tedock.tistory.com/203
 * >예시
 */
public class CustomMapArgumentResolver implements HandlerMethodArgumentResolver {
	/*
	 * supportsParameter 메서드는 Resolver가 적용 가능한지 검사하는 역할을 하고, supportsparameter
	 * 메서드는 컨트롤러의 파라미터가 CommandMap 클래스인지 검사하도록 하였다.
	 */
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return CommandMap.class.isAssignableFrom(parameter.getParameterType());
	}

	/*
	 * resolverArgument 메서드는 파라미터와 기타 정보를 받아서 실제 객체를 반환한다. CommandMap 클래스 참조 !
	 * CommandMap 객체를 생성하였다. 그 다음으로, request에 담겨있는 모든 키(key)와 값(value)을
	 * commandMap에 저장하였다. request에 있는 값을 iterator를 이용하여 하나씩 가져오는 로직이다. 마지막으로 모든
	 * 파라미터가 담겨있는 commandMap을 반환하였다.
	 */
	@Override
	public Object resolveArgument(MethodParameter parameter,
			ModelAndViewContainer mavContainer, NativeWebRequest webRequest,
			WebDataBinderFactory binderFactory) throws Exception {
		CommandMap commandMap = new CommandMap();

		HttpServletRequest request = (HttpServletRequest) webRequest
				.getNativeRequest();
		Enumeration<?> enumeration = request.getParameterNames();

		String key = null;
		String[] values = null;
		while (enumeration.hasMoreElements()) {
			key = (String) enumeration.nextElement();
			values = request.getParameterValues(key);
			if (values != null) {
				commandMap.put(key, (values.length > 1) ? values : values[0]);
			}
		}
		return commandMap;
	}

}

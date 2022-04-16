package net.common.resolver;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import net.common.common.CommandMap;

/**
 * 파라미터의 내용을 CommandMap에 binding
 * 
 * @author 남동희
 *
 */
@Component
public class CustomMapArgumentResolver implements HandlerMethodArgumentResolver {

	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(CustomMapArgumentResolver.class);

	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return CommandMap.class.isAssignableFrom(parameter.getParameterType());
	}

	/**
	 * 파라미터의 내용을 CommandMap에 binding
	 */
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		CommandMap commandMap = new CommandMap();

		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
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

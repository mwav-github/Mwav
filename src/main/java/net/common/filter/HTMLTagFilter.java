package net.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @author 김주성
 * @see javax.servlet-api-2.5
 * @see http://linguist79.tistory.com/47
 */
@SuppressWarnings("unused")
public class HTMLTagFilter implements Filter {

	private static final Logger logger = LoggerFactory.getLogger(HTMLTagFilter.class);

	private FilterConfig config;

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		String path = ((HttpServletRequest) request).getRequestURI();

		if (path == null || "".equals(path)) {
			chain.doFilter(request, response);
		}

		boolean isEditor = path.startsWith("/admin/boardNews") || path.startsWith("/admin/boardNotice") || path.startsWith("/admin/marketing") || path.startsWith("/member/mbrTempLoginPwUpdate")
				|| path.startsWith("/qa") || path.startsWith("/admins/promoter/boardmgr");

		if (isEditor) {
			chain.doFilter(request, response);
		} else {
			chain.doFilter(new HTMLTagFilterRequestWrapper((HttpServletRequest) request), response);
		}

	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
	}
}

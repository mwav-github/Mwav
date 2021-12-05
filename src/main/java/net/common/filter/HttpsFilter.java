package net.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

/**
 * https protocol로 redirect
 * @author 김주성
 *
 */
public class HttpsFilter implements Filter {

	private static final Logger logger = LoggerFactory.getLogger(HttpsFilter.class);

	/**
	 * https 연결로 redirect
	 * 개발환경/https 연결은 그대로 진행
	 * 
	 * url patterns
	 * - https://mwav.net
	 * - http://www.mwav.net
	 * - http://mwav.net
	 * - http://www.mwav.net/MasterPage_1.mwav?mode=Default
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI();
		String protocol = req.getScheme().toLowerCase();
		String domain = req.getServerName();
		String parameter = req.getQueryString();

		boolean isDev = domain.contains("localhost") || domain.contains("mwavtst.nanuminet") || domain.contains("koreacentral.cloudapp.azure");
		boolean isHttps = protocol.equals("https") && domain.contains("www.");

		// 운영 환경에서 https 접속이 아닌경우
		if (!isHttps && !isDev) {
			String httpsRedirectPath = "https://";

			// www.domain 형태로 설정
			domain = (domain.contains("www.")) ? domain : "www." + domain;

			// paramter가 존재하지 않을 시 브라우저 스펙상 경로에 / 추가되는 이슈가 존재 
			if (uri == null || uri.equals("") || uri.equals("/")) {
				uri = "";
			}

			// paramter 생성
			parameter = (StringUtils.isEmpty(parameter)) ? "" : "?" + parameter;

			httpsRedirectPath = httpsRedirectPath + domain + uri + parameter;

			// content-type : text/html
			// response : 301 redirect
			res.setContentType("text/html");
			res.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
			res.setHeader("Location", httpsRedirectPath);

			logger.debug("https redirected : " + httpsRedirectPath);
			return;
		}

		chain.doFilter(req, res);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
	}

	@Override
	public void destroy() {
	}
}

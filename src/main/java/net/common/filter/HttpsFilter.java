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

import org.apache.log4j.Logger;

public class HttpsFilter implements Filter {
	Logger logger = Logger.getLogger(this.getClass());

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		logger.debug("User call url : " + req.getRequestURL());

		String getUri = req.getRequestURI();
		String getProtocol = req.getScheme().toLowerCase();
		String getDomain = req.getServerName();
		String getPort = Integer.toString(req.getServerPort());
		String getParameters = req.getQueryString();

		if(getDomain.contains("localhost")){
			// localhost 테스트 환경에서 filter 타지 않도록 로직 구현 : localhost:8080 으로 접근가능
			logger.debug("Local develop 환경 call : localhost:8080");
		} else { // http, https 구분없이 filter 적용

			if(getProtocol.equals("https") && getDomain.contains("www.")){ 
				// https://www.mwav.net 으로 들어오면 filter pass
			} else {
				String httpsRedirectPath = "https://";
				if( getDomain.contains("www.") == false ){// Set www. domain style
					getDomain = "www." + getDomain; 
				}
				if( getUri == null || getUri.equals("") || getUri.equals("/")){
					getUri = ""; // Set URI // paramter 없을때 "/" 슬러시 추가되는 이슈해결 안됨. Browser 스펙상 "/" 강제추가됨 >> 상관없음 됨.
				}
				if( getParameters == null ){ // Set query string
					getParameters = "";
				} else {
					if( getParameters.equals("") ){
						getParameters = "";
					} else {
						getParameters = "?" + getParameters;
					}
				}

				httpsRedirectPath = httpsRedirectPath + getDomain + getUri + getParameters; // New location to be redirected
				logger.debug("https converted check : " + httpsRedirectPath);

				res.setContentType("text/html"); // Set response content type
				res.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY); // http 요청시 301 redirect
				res.sendRedirect(httpsRedirectPath);
				return;
			}
		}
		// Pass request back down the filter chain
		chain.doFilter(req, res);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		logger.debug("HttpsFilter init()");
	}
	@Override
	public void destroy() {
		logger.debug("HttpsFilter destroy()");
	}
}

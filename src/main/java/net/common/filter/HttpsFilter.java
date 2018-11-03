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
		logger.debug("HttpsFilter doFileter()");

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String getUri = req.getRequestURI();
		String getProtocol = req.getScheme();
		String getDomain = req.getServerName();
		String getPort = Integer.toString(req.getServerPort());
		String getParameters = req.getQueryString();

		if(getDomain.equals("localhost") || getDomain.equals("localhost:8080")){
			// localhost 테스트 환경에서 filter 타지 않도록 로직 구현 : localhost:8080 으로 접근가능
		} else { // http, https 구분없이 filter 적용
			// Set www. domain style
			if(!getDomain.contains("www.")){
				getDomain = "www." + getDomain;
			}
			// Set URI
			if(getUri.equals("/") || getUri == null){
				getUri = ""; // paramter 없을때 "/" 슬러시 추가되는 이슈해결 안됨. Browser 스펙상 "/" 강제추가됨 >> 상관없음 됨.
			}
			// Set query string
			if(getParameters == null){
				getParameters = "";
			} else {
				getParameters = "?" + getParameters;
			}
			// Set response content type
			response.setContentType("text/html");

			// New location to be redirected
			String httpsPath = "https" + "://" + getDomain + getUri + getParameters;
			logger.info("httpspath(http) : " + httpsPath);

			String site = new String(httpsPath);
			// http 요청시 301 redirect
			if(getProtocol.toLowerCase().equals("http")){
				res.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
			}
			res.setHeader("Location", site);
			
			/*if (getProtocol.toLowerCase().equals("http")) {
				// Set www. domain style
				if(!getDomain.contains("www.")){
					getDomain = "www." + getDomain;
				}
				// Set URI
				if(getUri.equals("/") || getUri == null){
					getUri = ""; // paramter 없을때 "/" 슬러시 추가되는 이슈해결 안됨. Browser 스펙상 "/" 강제추가됨 >> 상관없음 됨.
				}
				// Set query string
				if(getParameters == null){
					getParameters = "";
				} else {
					getParameters = "?" + getParameters;
				}
				// Set response content type
				response.setContentType("text/html");

				// New location to be redirected
				String httpsPath = "https" + "://" + getDomain + getUri + getParameters;
				logger.info("httpspath(http) : " + httpsPath);

				String site = new String(httpsPath);
				res.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
				res.setHeader("Location", site);
			} else if (getProtocol.toLowerCase().equals("https")) {
				String tempCheckUrl = "";
				if(!getDomain.contains("www.")){
					getDomain = "www." + getDomain;
				}
				// Set URI
				if(getUri.equals("/") || getUri == null){
					getUri = ""; // paramter 없을때 "/" 슬러시 추가되는 이슈해결 안됨. Browser 스펙상 "/" 강제추가됨 >> 상관없음 됨.
				}
				// Set query string
				if(getParameters == null){
					getParameters = "";
				} else {
					getParameters = "?" + getParameters;
				}
				// Set response content type
				response.setContentType("text/html");
				
				tempCheckUrl = "https" + "://" + getDomain + getUri + getParameters;
				
				logger.info("tempCheckUrl(https) : " + tempCheckUrl);
				String site = new String(tempCheckUrl);
//				res.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
				res.setHeader("Location", site);
			} */
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

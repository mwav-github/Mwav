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

		String uri = req.getRequestURI();
		String getProtocol = req.getScheme();
		String getDomain = req.getServerName();
		String getPort = Integer.toString(req.getServerPort());

		if (getProtocol.toLowerCase().equals("http")) {

			// Set response content type
			response.setContentType("text/html");

			// New location to be redirected
			String httpsPath = "https" + "://" + getDomain + ":" + getPort + uri;

			logger.debug("Changed https path : " + httpsPath);

			String site = new String(httpsPath);
			res.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
			res.setHeader("Location", site);
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

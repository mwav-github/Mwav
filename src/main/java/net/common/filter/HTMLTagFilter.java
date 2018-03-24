package net.common.filter;

/*
 * Copyright 2008-2009 MOPAS(MINISTRY OF SECURITY AND PUBLIC ADMINISTRATION).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

//
//javax.servlet-api-2.5jar 포함 필요
// http://linguist79.tistory.com/47
public class HTMLTagFilter implements Filter {

	Logger log = Logger.getLogger(this.getClass());
	private FilterConfig config;

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		log.info("======================================          Filter Start       ======================================");

		String path = ((HttpServletRequest) request).getRequestURI();
		log.info("path"+path);
		log.info("PATH확인 TRUE면 해당 URL"+path.startsWith("/Admins/SiteMgr/"));

		// ckeditor를 사용하는 경우 제외시켜야한다.
		if (path.startsWith("/admin/boardNews") || path.startsWith("/admin/boardNotice") || path.startsWith("/admin/marketing") || path.startsWith("/member/mbrTempLoginPwUpdate") || path.startsWith("/qa")) {
			chain.doFilter(request, response); // 그냥 진행
		} else {
			chain.doFilter(new HTMLTagFilterRequestWrapper(
					(HttpServletRequest) request), response); // Just continue
																// chain.
		}

	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
	}
}

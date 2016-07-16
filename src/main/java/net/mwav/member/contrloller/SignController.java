/*
 * Copyright 2014 the original author or authors.
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
package net.mwav.member.contrloller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.mwav.member.service.MemberService;

import org.apache.log4j.Logger;
import org.apache.maven.model.Model;
import org.springframework.social.ExpiredAuthorizationException;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

@Controller
public class SignController {
	Logger logger = Logger.getLogger(this.getClass());
	private final ProviderSignInUtils providerSignInUtils;

	@Resource(name = "memberService")
	private MemberService memberService;

	@Inject
	public SignController(ConnectionFactoryLocator connectionFactoryLocator,
			UsersConnectionRepository connectionRepository) {
		this.providerSignInUtils = new ProviderSignInUtils(
				connectionFactoryLocator, connectionRepository);
	}

	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void signin() {
		System.out.println("출력3");
	}

	@RequestMapping("/google/expired")
	public void simulateExpiredToken() { // 만료된 토큰 관리
		throw new ExpiredAuthorizationException("google");
	}

	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String signupForm2(WebRequest req, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		Connection<?> connection = providerSignInUtils
				.getConnectionFromSession(req);

		int loginCheck = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		
		String smMember_id = connection.getKey().getProviderUserId();
		String First_Name = connection.fetchUserProfile().getFirstName();
		String Last_Name = connection.fetchUserProfile().getLastName();
		String Email = connection.fetchUserProfile().getEmail();
		if (Last_Name == null)
			Last_Name = null;
		String Gender = null;
		String Link = connection.getProfileUrl();
		if (Link == null)
			Link = null;
		String Picture = connection.getImageUrl();
		if (Picture == null)
			Picture = null;

		logger.debug("smMember_id = " + smMember_id);
		logger.debug("smMember_id = " + smMember_id);
		logger.debug("First_Name = " + First_Name);
		logger.debug("Last_Name = " + Last_Name);
		logger.debug("Email = " + Email);
		logger.debug("Gender = " + Gender);
		logger.debug("Link = " + Link);
		logger.debug("Picture = " + Picture);

		/* ID가 없으면 (Insert), 있으면 (로그인) */
		boolean check;
		check = memberService.selectOneSnsMbrLoginIdCheck(smMember_id);
		logger.info("check = " + check);
		if (check == false) {

			map.put("smMember_id", smMember_id);
			map.put("First_Name", First_Name);
			map.put("Last_Name", Last_Name);
			map.put("Email", Email);
			map.put("Gender", 3);
			map.put("Link", Link);
			map.put("Picture", Picture);

			memberService.insertSnsForm(map);
			logger.info("insertSnsForm success!!!!!!");
		}

		String mbrLoginId = connection.getDisplayName();

		loginCheck = 1;
		session.setAttribute("mbrLoginId", mbrLoginId);
		request.setAttribute("loginCheck", loginCheck);

		return "/Index";
	}

}

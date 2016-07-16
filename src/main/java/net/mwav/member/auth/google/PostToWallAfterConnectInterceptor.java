package net.mwav.member.auth.google;

import org.springframework.social.ApiException;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionFactory;
import org.springframework.social.connect.web.ConnectInterceptor;
import org.springframework.social.google.api.Google;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.WebRequest;

public class PostToWallAfterConnectInterceptor implements ConnectInterceptor<Google> {
/*
 The preConnect() method will be called by ConnectController just before redirecting the browser to the provider’s authorization page. Custom authorization parameters may be added to the provided parameter map. postConnect() will be called immediately after a connection has been persisted linking the user’s local account with the provider profile.

For example, suppose that after connecting a user account with their Twitter profile you want to immediately post a tweet about that connection to the user’s Twitter timeline. To accomplish that, you might write the following connection interceptor:


This interceptor can then be injected into ConnectController when it is created:
> net.mwav.member.auth.config > socialcofing 파일에 존재 


 */
	public void preConnect(ConnectionFactory<Google> connectionFactory, MultiValueMap<String, String> parameters, WebRequest request) {
		if (StringUtils.hasText(request.getParameter(POST_TO_WALL_PARAMETER))) {
			request.setAttribute(POST_TO_WALL_ATTRIBUTE, Boolean.TRUE, WebRequest.SCOPE_SESSION);
		}
	}

	public void postConnect(Connection<Google> connection, WebRequest request) {
		if (request.getAttribute(POST_TO_WALL_ATTRIBUTE, WebRequest.SCOPE_SESSION) != null) {
			try {
				connection.updateStatus("I've connected with the Spring Social Showcase!");
			} catch (ApiException e) {
				// Do nothing: No need to break down if the post-connect post can't be made.
			}
			request.removeAttribute(POST_TO_WALL_ATTRIBUTE, WebRequest.SCOPE_SESSION);
		}
	}

	private static final String POST_TO_WALL_PARAMETER = "postToWall";

	private static final String POST_TO_WALL_ATTRIBUTE = "GoogleConnect." + POST_TO_WALL_PARAMETER;
}

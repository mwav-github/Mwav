package net.mwav.member.vo;

import java.math.BigInteger;
import java.security.SecureRandom;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class SNSDto {

	private String service;
	private String appKey;
	private String appSecret;
	private String redirectUrl;
	private String state;
	private DefaultApi20 api;

	public SNSDto() {
	}

	public SNSDto(String service, String appKey, String appSecret, String redirectUrl, String state, DefaultApi20 api) {
		this.service = service;
		this.appKey = appKey;
		this.appSecret = appSecret;
		this.redirectUrl = redirectUrl;
		this.state = state;
		this.api = api;
	}

	@Override
	public String toString() {
		return "SNSDto [service=" + service + ", appKey=" + appKey + ", appSecret=" + appSecret + ", redirectUrl=" + redirectUrl + ", state=" + state + ", api=" + api + "]";
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getAppKey() {
		return appKey;
	}

	public void setAppKey(String appKey) {
		this.appKey = appKey;
	}

	public String getAppSecret() {
		return appSecret;
	}

	public void setAppSecret(String appSecret) {
		this.appSecret = appSecret;
	}

	public String getRedirectUrl() {
		return redirectUrl;
	}

	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public DefaultApi20 getApi() {
		return api;
	}

	public void setApi(DefaultApi20 api) {
		this.api = api;
	}

}

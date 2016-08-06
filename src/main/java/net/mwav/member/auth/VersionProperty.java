package net.mwav.member.auth;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class VersionProperty {
	@Value("${google.appKey}")
	private String googleKey;
	@Value("${google.appSecret}")
	private String googleSecret;
	
	@Value("${linkedin.appKey}")
	private String linkedinKey;
	@Value("${linkedin.appSecret}")
	private String linkedinSecret;
	
	@Value("${facebook.appKey}")
	private String facebookKey;
	@Value("${facebook.appSecret}")
	private String facebookSecret;
	
	@Value("${twitter.appKey}")
	private String twitterKey;
	@Value("${twitter.appSecret}")
	private String twitterSecret;
	
	public String getTwitterKey() {
		return twitterKey;
	}
	public void setTwitterKey(String twitterKey) {
		this.twitterKey = twitterKey;
	}
	public String getTwitterSecret() {
		return twitterSecret;
	}
	public void setTwitterSecret(String twitterSecret) {
		this.twitterSecret = twitterSecret;
	}
	
	public String getGoogleKey() {
		return googleKey;
	}
	public void setGoogleKey(String googleKey) {
		this.googleKey = googleKey;
	}
	public String getGoogleSecret() {
		return googleSecret;
	}
	public void setGoogleSecret(String googleSecret) {
		this.googleSecret = googleSecret;
	}
	
	
	public String getLinkedinKey() {
		return linkedinKey;
	}
	public void setLinkedinKey(String linkedinKey) {
		this.linkedinKey = linkedinKey;
	}
	public String getLinkedinSecret() {
		return linkedinSecret;
	}
	public void setLinkedinSecret(String linkedinSecret) {
		this.linkedinSecret = linkedinSecret;
	}
	public String getFacebookKey() {
		return facebookKey;
	}
	public void setFacebookKey(String facebookKey) {
		this.facebookKey = facebookKey;
	}
	public String getFacebookSecret() {
		return facebookSecret;
	}
	public void setFacebookSecret(String facebookSecret) {
		this.facebookSecret = facebookSecret;
	}

	
	
	
	
	
}

package net.mwav.member.auth.config;

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
	
	
	
	
	
}

package net.mwav.member.auth;

import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class GoogleUser {
	@JsonProperty("id")
	private String id;

	@JsonProperty("email")
	private String email;

	@JsonProperty("verified_email")
	private boolean verifiedEmail;

	@JsonProperty("name")
	private String name;

	@JsonProperty("given_name")
	private String givenName;

	@JsonProperty("family_name")
	private String familyName;

	@JsonProperty("link")
	private String link;

	@JsonProperty("picture")
	private String picture;

	@JsonProperty("gender")
	private String gender;

	@JsonProperty("birthday")
	private Date birthday;

	@JsonProperty("locale")
	private String locale;

	@JsonProperty("hd")
	private String hd;

	@JsonIgnore
	private boolean isAuthentication;

	public String getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public boolean isVerifiedEmail() {
		return verifiedEmail;
	}

	public String getName() {
		return name;
	}

	public String getGivenName() {
		return givenName;
	}

	public String getFamilyName() {
		return familyName;
	}

	public String getLink() {
		return link;
	}

	public String getGender() {
		return gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public String getLocale() {
		return locale;
	}

	public String getHd() {
		return hd;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isAuthentication() {
		return isAuthentication;
	}

	public void setAuthentication(boolean isAuthentication) {
		this.isAuthentication = isAuthentication;
	}

	public String getPicture() {
		return picture;
	}
}

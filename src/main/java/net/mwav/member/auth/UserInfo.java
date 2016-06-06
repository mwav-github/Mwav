package net.mwav.member.auth;

import java.util.ArrayList;
import java.util.List;


public class UserInfo  {
	private String googleIdentifier;
	private String email;
	private String name;
	private String picture;
	private String gender;
	private String locale;
	private String signdate;
	private String lastDate;
	private boolean state;
	
	private List<String> roleList;
	
	public String getGoogleIdentifier() {
		return googleIdentifier;
	}
	public void setGoogleIdentifier(String googleIdentifier) {
		this.googleIdentifier = googleIdentifier;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getLocale() {
		return locale;
	}
	public void setLocale(String locale) {
		this.locale = locale;
	}
	public String getSigndate() {
		return signdate;
	}
	public void setSigndate(String signdate) {
		this.signdate = signdate;
	}
	public List<String> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<String> roleList) {
		this.roleList = roleList;
	}

	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public boolean isState() {
		return state;
	}
	public void setState(boolean state) {
		this.state = state;
	}
	public static UserInfo createUserInfo(AuthUser user){
		UserInfo userInfo = new UserInfo();
		userInfo.email = user.getEmail();
		userInfo.gender = user.getGender();
		userInfo.googleIdentifier = user.getGoogleIdentifier();
		userInfo.locale = user.getLocale();
		userInfo.name = user.getName();
		userInfo.picture = user.getPicture();
		userInfo.signdate = user.getSigndate().toString("yyyy-MM-dd");
		userInfo.lastDate = user.getLastDate().toString("yyyy-MM-dd");
		userInfo.state = (user.getState() == State.ACTIVE) ? true: false;

		return userInfo;
	}
	
	public static UserInfo createFailUserInfo(String message) {
		UserInfo userInfo = new UserInfo();

		userInfo.roleList = new ArrayList<String>();		
		return userInfo;
	}
	
	
}

package net.mwav.member.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.joda.time.DateTime;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


public class AuthUser implements UserDetails {
	private static final long serialVersionUID = 1L;

	private int userIdx;
	private String googleIdentifier;
	private State state;
	private String email;
	private String name;
	private String picture;
	private String gender;
	private String locale;
	private DateTime signdate = new DateTime();
	private DateTime lastDate = new DateTime();
	private Collection<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();

	public int getUserIdx() {
		return userIdx;
	}

	public String getGoogleIdentifier() {
		return googleIdentifier;
	}

	public void setGoogleIdentifier(String googleIdentifier) {
		this.googleIdentifier = googleIdentifier;
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
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

	public DateTime getSigndate() {
		return signdate;
	}

	public void setSigndate(DateTime signdate) {
		this.signdate = signdate;
	}

	public DateTime getLastDate() {
		return lastDate;
	}

	public void setLastDate(DateTime lastDate) {
		this.lastDate = lastDate;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.authorities;
	}

	public void setAuthorities(Collection<SimpleGrantedAuthority> authorities) {
		if (authorities != null) {
			this.authorities = authorities;
		}
	}

	public void addAuthority(SimpleGrantedAuthority auth) {
		this.authorities.add(auth);
	}

	@Override
	public String getPassword() {
		return null;
	}

	@Override
	public String getUsername() {
		return this.email;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	public static AuthUser createMailUser(String mail) {
		AuthUser user = new AuthUser();
		user.setEmail(mail);
		user.setName("무명");
		user.setState(State.ACTIVE);
		return user;
	}

	public static AuthUser changeUser(UserInfo info) {
		AuthUser user = new AuthUser();
		user.email = info.getEmail();
		user.gender = info.getGender();
		user.googleIdentifier = info.getGoogleIdentifier();
		user.lastDate = new DateTime(info.getLastDate());
		user.locale = info.getLocale();
		user.name = info.getName();
		user.picture = info.getPicture();
		user.signdate = new DateTime(info.getSigndate());
		user.authorities = getAuthorities(info.getRoleList());
		return user;
	}

	private static List<SimpleGrantedAuthority> getAuthorities(List<String> roleList) {
		List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();

		for (String descentdant : roleList) {
			authorities.add(new SimpleGrantedAuthority(descentdant));
		}

		return authorities;
	}

}
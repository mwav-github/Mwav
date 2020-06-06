package net.mwav.login.vo;

import java.sql.Date;

public class LoginVO {
	private Integer auditLogin_id;
	private char alEntityType;
	private Integer alEntityTarget_id;
	private Integer alFailCount;
	private Date alDatetime;
	private String alIpAddress;
	
	public Integer getAuditLogin_id() {
		return auditLogin_id;
	}
	public void setAuditLogin_id(Integer auditLogin_id) {
		this.auditLogin_id = auditLogin_id;
	}
	public char getAlEntityType() {
		return alEntityType;
	}
	public void setAlEntityType(char alEntityType) {
		this.alEntityType = alEntityType;
	}
	public Integer getAlEntityTarget_id() {
		return alEntityTarget_id;
	}
	public void setAlEntityTarget_id(Integer alEntityTarget_id) {
		this.alEntityTarget_id = alEntityTarget_id;
	}
	public Integer getAlFailCount() {
		return alFailCount;
	}
	public void setAlFailCount(Integer alFailCount) {
		this.alFailCount = alFailCount;
	}
	public Date getAlDatetime() {
		return alDatetime;
	}
	public void setAlDatetime(Date alDatetime) {
		this.alDatetime = alDatetime;
	}
	public String getAlIpAddress() {
		return alIpAddress;
	}
	public void setAlIpAddress(String alIpAddress) {
		this.alIpAddress = alIpAddress;
	}
}

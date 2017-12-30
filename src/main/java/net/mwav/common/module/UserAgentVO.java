package net.mwav.common.module;

import java.util.Map;

public class UserAgentVO {
	private String deviceType;                         // 기기타입
    private String deviceInfo;                         // 기기정보
    private String browerInfo;                        // 브라우저정보
    private String osInfo;                        // os정보
    private String mobileYn;                          // 모바일 여부
    private String robotYn;                          // 로봇여부
	public String getDeviceType() {
		return deviceType;
	}
	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}
	public String getDeviceInfo() {
		return deviceInfo;
	}
	public void setDeviceInfo(String deviceInfo) {
		this.deviceInfo = deviceInfo;
	}
	public String getBrowerInfo() {
		return browerInfo;
	}
	public void setBrowerInfo(String browerInfo) {
		this.browerInfo = browerInfo;
	}
	public String getOsInfo() {
		return osInfo;
	}
	public void setOsInfo(String osInfo) {
		this.osInfo = osInfo;
	}
	public String getMobileYn() {
		return mobileYn;
	}
	public void setMobileYn(String mobileYn) {
		this.mobileYn = mobileYn;
	}
	public String getRobotYn() {
		return robotYn;
	}
	public void setRobotYn(String robotYn) {
		this.robotYn = robotYn;
	}
}
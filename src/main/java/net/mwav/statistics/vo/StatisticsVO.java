package net.mwav.statistics.vo;

import java.sql.Timestamp;

public class StatisticsVO {
	private long statistics_id;  
	private String stPageName;
	private String stUrlScheme;
	private String stUrlHost;
	private int stUrlPort;
	private String stUrlLocalPath;
	private String stQueryString;
	private String stUrlPathAndQuery;
	private String stPrePageName;
	private String stUrlReferrerHost;
	private String stUrlReferrer;
	private char stPromoterType;
	private int stPromoterId;
	private int stWhatsAbout;
	private int stMember_id;
	private String stSessionId;
	private String stUserHostAddress;
	private String stUserAgent;
	private String stClientScreen;
	private String stHTTP_UA_CPU;
	private Timestamp stStatisticsDt;
	


	
	public long getStatistics_id() {
		return statistics_id;
	}
	public void setStatistics_id(long statistics_id) {
		this.statistics_id = statistics_id;
	}
	public String getStPageName() {
		return stPageName;
	}
	public void setStPageName(String stPageName) {
		this.stPageName = stPageName;
	}
	public String getStUrlScheme() {
		return stUrlScheme;
	}
	public void setStUrlScheme(String stUrlScheme) {
		this.stUrlScheme = stUrlScheme;
	}
	public String getStUrlHost() {
		return stUrlHost;
	}
	public void setStUrlHost(String stUrlHost) {
		this.stUrlHost = stUrlHost;
	}
	public int getStUrlPort() {
		return stUrlPort;
	}
	public void setStUrlPort(int stUrlPort) {
		this.stUrlPort = stUrlPort;
	}
	public String getStUrlLocalPath() {
		return stUrlLocalPath;
	}
	public void setStUrlLocalPath(String stUrlLocalPath) {
		this.stUrlLocalPath = stUrlLocalPath;
	}
	public String getStQueryString() {
		return stQueryString;
	}
	public void setStQueryString(String stQueryString) {
		this.stQueryString = stQueryString;
	}
	public String getStUrlPathAndQuery() {
		return stUrlPathAndQuery;
	}
	public void setStUrlPathAndQuery(String stUrlPathAndQuery) {
		this.stUrlPathAndQuery = stUrlPathAndQuery;
	}
	public String getStPrePageName() {
		return stPrePageName;
	}
	public void setStPrePageName(String stPrePageName) {
		this.stPrePageName = stPrePageName;
	}
	public String getStUrlReferrerHost() {
		return stUrlReferrerHost;
	}
	public void setStUrlReferrerHost(String stUrlReferrerHost) {
		this.stUrlReferrerHost = stUrlReferrerHost;
	}
	public String getStUrlReferrer() {
		return stUrlReferrer;
	}
	public void setStUrlReferrer(String stUrlReferrer) {
		this.stUrlReferrer = stUrlReferrer;
	}
	public char getStPromoterType() {
		return stPromoterType;
	}
	public void setStPromoterType(char stPromoterType) {
		this.stPromoterType = stPromoterType;
	}
	public int getStPromoterId() {
		return stPromoterId;
	}
	public void setStPromoterId(int stPromoterId) {
		this.stPromoterId = stPromoterId;
	}
	public int getStWhatsAbout() {
		return stWhatsAbout;
	}
	public int setStWhatsAbout(int stWhatsAbout) {
		return this.stWhatsAbout = stWhatsAbout;
	}
	public int getStMember_id() {
		return stMember_id;
	}
	public void setStMember_id(int stMember_id) {
		this.stMember_id = stMember_id;
	}
	public String getStSessionId() {
		return stSessionId;
	}
	public void setStSessionId(String stSessionId) {
		this.stSessionId = stSessionId;
	}
	public String getStUserHostAddress() {
		return stUserHostAddress;
	}
	public void setStUserHostAddress(String stUserHostAddress) {
		this.stUserHostAddress = stUserHostAddress;
	}
	public String getStUserAgent() {
		return stUserAgent;
	}
	public void setStUserAgent(String stUserAgent) {
		this.stUserAgent = stUserAgent;
	}
	public String getStClientScreen() {
		return stClientScreen;
	}
	public void setStClientScreen(String stClientScreen) {
		this.stClientScreen = stClientScreen;
	}
	public String getStHTTP_UA_CPU() {
		return stHTTP_UA_CPU;
	}
	public void setStHTTP_UA_CPU(String stHTTP_UA_CPU) {
		this.stHTTP_UA_CPU = stHTTP_UA_CPU;
	}
	public Timestamp getStStatisticsDt() {
		return stStatisticsDt;
	}
	public void setStStatisticsDt(Timestamp stStatisticsDt) {
		this.stStatisticsDt = stStatisticsDt;
	}
	
	

}

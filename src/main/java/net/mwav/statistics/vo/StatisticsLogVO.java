package net.mwav.statistics.vo;

import java.sql.Timestamp;

public class StatisticsLogVO {

	
	private long statistics_id;  
	private Timestamp slStatLogDt;
	private String slPageName;
	private String slUrlHost;
	private String slUrlLocalPath;
	private String slQueryString;
	
	public long getStatistics_id() {
		return statistics_id;
	}
	public void setStatistics_id(long statistics_id) {
		this.statistics_id = statistics_id;
	}
	public Timestamp getSlStatLogDt() {
		return slStatLogDt;
	}
	public void setSlStatLogDt(Timestamp slStatLogDt) {
		this.slStatLogDt = slStatLogDt;
	}
	public String getSlPageName() {
		return slPageName;
	}
	public void setSlPageName(String slPageName) {
		this.slPageName = slPageName;
	}
	public String getSlUrlHost() {
		return slUrlHost;
	}
	public void setSlUrlHost(String slUrlHost) {
		this.slUrlHost = slUrlHost;
	}
	public String getSlUrlLocalPath() {
		return slUrlLocalPath;
	}
	public void setSlUrlLocalPath(String slUrlLocalPath) {
		this.slUrlLocalPath = slUrlLocalPath;
	}
	public String getSlQueryString() {
		return slQueryString;
	}
	public void setSlQueryString(String slQueryString) {
		this.slQueryString = slQueryString;
	}

}

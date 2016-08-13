package net.mwav.order.vo;

import java.sql.Timestamp;

public class OrderManagementVO {
	private long order_id;
	private int omProfit;
	private Timestamp omOrderDt;
	private String omIpAddress;
	private int statistics_id;
	
	public OrderManagementVO() {}
	public OrderManagementVO(long order_id, int omProfit, Timestamp omOrderDt, String omIpAddress, int statistics_id) {
		this.order_id = order_id;
		this.omProfit = omProfit;
		this.omOrderDt = omOrderDt;
		this.omIpAddress = omIpAddress;
		this.statistics_id = statistics_id;
	}
	
	public long getOrder_id() {
		return order_id;
	}
	public void setOrder_id(long order_id) {
		this.order_id = order_id;
	}
	public int getOmProfit() {
		return omProfit;
	}
	public void setOmProfit(int omProfit) {
		this.omProfit = omProfit;
	}
	public Timestamp getOmOrderDt() {
		return omOrderDt;
	}
	public void setOmOrderDt(Timestamp omOrderDt) {
		this.omOrderDt = omOrderDt;
	}
	public String getOmIpAddress() {
		return omIpAddress;
	}
	public void setOmIpAddress(String omIpAddress) {
		this.omIpAddress = omIpAddress;
	}
	public int getStatistics_id() {
		return statistics_id;
	}
	public void setStatistics_id(int statistics_id) {
		this.statistics_id = statistics_id;
	}
	
}

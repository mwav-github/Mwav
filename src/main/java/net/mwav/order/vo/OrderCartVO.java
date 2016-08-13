package net.mwav.order.vo;

import java.sql.Timestamp;

/*DB와 칼럼명 맞춰줘야한다. */
public class OrderCartVO extends MasterVO { /*상속받았기 때문에 cartActio dao 부분이 가능한 것이다. */ 
	private String orderCart_id;
	private Timestamp ocChoiceDt;
	private int goods_id;
	private String ocOption;
	private int ocAmount;
	private int gcr_id;
	private String ocIpAddress;
	private int statistics_id;
	
	public OrderCartVO() {}
	public OrderCartVO(String orderCart_id, Timestamp ocChoiceDt, int goods_id, 
				int ocAmount, int gcr_id, String ocIpAddress) {
		//this.orderCart_id = orderCart_id;
		this.setOrderCart_id(orderCart_id);
		
		//this.ocChoiceDt = ocChoiceDt;
		this.setOcChoiceDt(ocChoiceDt);
		
		this.setGoods_id(goods_id);
		//this.goods_id = goods_id;
		
		//this.ocAmount = ocAmount;
		this.setOcAmount(ocAmount);
		
		this.setGcr_id(gcr_id);
		//this.gcr_id = gcr_id;
		
		//this.ocIpAddress = ocIpAddress;
		this.setOcIpAddress(ocIpAddress);
	}
	
	public String getOrderCart_id() {
		return orderCart_id;
	}
	public void setOrderCart_id(String orderCart_id) {
		this.orderCart_id = orderCart_id;
	}
	public Timestamp getOcChoiceDt() {
		return ocChoiceDt;
	}
	public void setOcChoiceDt(Timestamp ocChoiceDt) {
		this.ocChoiceDt = ocChoiceDt;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getOcOption() {
		return ocOption;
	}
	public void setOcOption(String ocOption) {
		this.ocOption = ocOption;
	}
	public int getOcAmount() {
		return ocAmount;
	}
	public void setOcAmount(int ocAmount) {
		this.ocAmount = ocAmount;
	}
	public int getGcr_id() {
		return gcr_id;
	}
	public void setGcr_id(int gcr_id) {
		this.gcr_id = gcr_id;
	}
	public String getOcIpAddress() {
		return ocIpAddress;
	}
	public void setOcIpAddress(String ocIpAddress) {
		this.ocIpAddress = ocIpAddress;
	}
	public int getStatistics_id() {
		return statistics_id;
	}
	public void setStatistics_id(int statistics_id) {
		this.statistics_id = statistics_id;
	}
	
	
}

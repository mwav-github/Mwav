package net.mwav.order.vo;

import java.sql.Timestamp;

public class OrderProcessVO {
	private int order_id;
	private int opSeqNbr;
	private String opStatus;
	private Timestamp opProcessDt;
	private String opNoteInside;
	private int opClientReturnCost;
	private int opPtnReturnCost;
	private int opShopReturnCost;
	private String opTraceNbr;
	private Timestamp opDeliveryDt;
	private String opCanceller;
	private Timestamp opCancelDt;
	private String opComment;
	private int staff_id;
	private int pm_id;
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getOpSeqNbr() {
		return opSeqNbr;
	}
	public void setOpSeqNbr(int opSeqNbr) {
		this.opSeqNbr = opSeqNbr;
	}
	public String getOpStatus() {
		return opStatus;
	}
	public void setOpStatus(String opStatus) {
		this.opStatus = opStatus;
	}
	public Timestamp getOpProcessDt() {
		return opProcessDt;
	}
	public void setOpProcessDt(Timestamp opProcessDt) {
		this.opProcessDt = opProcessDt;
	}
	public String getOpNoteInside() {
		return opNoteInside;
	}
	public void setOpNoteInside(String opNoteInside) {
		this.opNoteInside = opNoteInside;
	}
	public int getOpClientReturnCost() {
		return opClientReturnCost;
	}
	public void setOpClientReturnCost(int opClientReturnCost) {
		this.opClientReturnCost = opClientReturnCost;
	}
	public int getOpPtnReturnCost() {
		return opPtnReturnCost;
	}
	public void setOpPtnReturnCost(int opPtnReturnCost) {
		this.opPtnReturnCost = opPtnReturnCost;
	}
	public int getOpShopReturnCost() {
		return opShopReturnCost;
	}
	public void setOpShopReturnCost(int opShopReturnCost) {
		this.opShopReturnCost = opShopReturnCost;
	}
	public String getOpTraceNbr() {
		return opTraceNbr;
	}
	public void setOpTraceNbr(String opTraceNbr) {
		this.opTraceNbr = opTraceNbr;
	}
	public Timestamp getOpDeliveryDt() {
		return opDeliveryDt;
	}
	public void setOpDeliveryDt(Timestamp opDeliveryDt) {
		this.opDeliveryDt = opDeliveryDt;
	}
	public String getOpCanceller() {
		return opCanceller;
	}
	public void setOpCanceller(String opCanceller) {
		this.opCanceller = opCanceller;
	}
	public Timestamp getOpCancelDt() {
		return opCancelDt;
	}
	public void setOpCancelDt(Timestamp opCancelDt) {
		this.opCancelDt = opCancelDt;
	}
	public String getOpComment() {
		return opComment;
	}
	public void setOpComment(String opComment) {
		this.opComment = opComment;
	}
	public int getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(int staff_id) {
		this.staff_id = staff_id;
	}
	public int getPm_id() {
		return pm_id;
	}
	public void setPm_id(int pm_id) {
		this.pm_id = pm_id;
	}
	
	
}

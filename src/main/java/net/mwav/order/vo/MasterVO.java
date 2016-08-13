package net.mwav.order.vo;

import java.sql.*;

/* 
========상품관련 VO ==========
용도 : GoodsMaster_tbl의 정보를 담을 그릇

========일자 별 설명=========

순번  |    요일    |             내용              |     
ㅡㅡㅡ------ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
1.   12 06     기본적인 틀 생성
*/
public class MasterVO {
	private int goods_id;// 상품유일코드; (10000부터), not null
	private String gModelNbr;// 모델번호, not null
	private String gName;// 상품명, not null
	private int gMemberPrice;// 회원(사용자)판매가
	private int gConsumerPrice;// 일반판매가 (소비자가)
	private char gWhoDeliveryCost;// 누가 지불할 것인가?(C:고객, P:파트너 제조사, ShopSelf:자사),
									// not null, default 'C'
	private int gDeliveryCost;// 배송료(+2500)
	private String gManufacturer;// 제조사
	private String gPlaceofOrigin;// 원산지
	private String gNote;// 특이사항
	private String gDescription;// 제품설명(상세파일과 함께 이용)
	private int gOrder;// 정렬순서, not null
	private Timestamp gPostStart;// (postStart < Getdate()) OR (postEnd >
									// Getdate())
	private Timestamp gPostEnd;// null, null; 게시하지 않음, 날짜, null; displayOk보다
								// 게시일을 사용하는 편이 게시시간을 조정할 수 있다.
	private int gStatus;// 구매가능여부-일시품절등(관리자직관) -- 공급계약일&제고로자동판단(1-ok)(시스템에의해),
						// not null, default 1
	private String gKeywords;// 검색키워드 ;
	private Timestamp gInsertDt;// 제품등록일(신제품기준), not null
	private Timestamp gUdateDt;// 제품수정일
	private char gRegister;// 등록 및 수정인(S:직원, P:관계사), not null, default 'S'
	private int gRegisterId;// 등록 및 수정인 아이디, not null, 아이디 pk sesson값으로 불러옴
	private String gIpAddress;// PC아이피

	/* 이미지 처리를 위해 임의로 놓은 것 */
	private String gBasicFileName;// 파일명, not null
	private String gFrontFileName;// 파일명, not null

	public MasterVO() {
	}

	public MasterVO(String gModelNbr, String gName, int gMemberPrice,
			int gConsumerPrice, int gDeliveryCost, String gManufacturer,
			String gPlaceofOrigin, String gNote, String gDescription,
			int gOrder, int gRegisterId, String gIpAddress) {
		this.gModelNbr = gModelNbr;
		this.gName = gName;
		this.gMemberPrice = gMemberPrice;
		this.gConsumerPrice = gConsumerPrice;
		this.gDeliveryCost = gDeliveryCost;
		this.gManufacturer = gManufacturer;
		this.gPlaceofOrigin = gPlaceofOrigin;
		this.gNote = gNote;
		this.gDescription = gDescription;
		this.gOrder = gOrder;
		this.gRegisterId = gRegisterId;
		this.gIpAddress = gIpAddress;
	}

	public int getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}

	public String getgModelNbr() {
		return gModelNbr;
	}

	public void setgModelNbr(String gModelNbr) {
		this.gModelNbr = gModelNbr;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public int getgMemberPrice() {
		return gMemberPrice;
	}

	public void setgMemberPrice(int gMemberPrice) {
		this.gMemberPrice = gMemberPrice;
	}

	public int getgConsumerPrice() {
		return gConsumerPrice;
	}

	public void setgConsumerPrice(int gConsumerPrice) {
		this.gConsumerPrice = gConsumerPrice;
	}

	public char getgWhoDeliveryCost() {
		return gWhoDeliveryCost;
	}

	public void setgWhoDeliveryCost(char gWhoDeliveryCost) {
		this.gWhoDeliveryCost = gWhoDeliveryCost;
	}

	public int getgDeliveryCost() {
		return gDeliveryCost;
	}

	public void setgDeliveryCost(int gDeliveryCost) {
		this.gDeliveryCost = gDeliveryCost;
	}

	public String getgManufacturer() {
		return gManufacturer;
	}

	public void setgManufacturer(String gManufacturer) {
		this.gManufacturer = gManufacturer;
	}

	public String getgPlaceofOrigin() {
		return gPlaceofOrigin;
	}

	public void setgPlaceofOrigin(String gPlaceofOrigin) {
		this.gPlaceofOrigin = gPlaceofOrigin;
	}

	public String getgNote() {
		return gNote;
	}

	public void setgNote(String gNote) {
		this.gNote = gNote;
	}

	public String getgDescription() {
		return gDescription;
	}

	public void setgDescription(String gDescription) {
		this.gDescription = gDescription;
	}

	public int getgOrder() {
		return gOrder;
	}

	public void setgOrder(int gOrder) {
		this.gOrder = gOrder;
	}

	public Timestamp getgPostStart() {
		return gPostStart;
	}

	public void setgPostStart(Timestamp gPostStart) {
		this.gPostStart = gPostStart;
	}

	public Timestamp getgPostEnd() {
		return gPostEnd;
	}

	public void setgPostEnd(Timestamp gPostEnd) {
		this.gPostEnd = gPostEnd;
	}

	public int getgStatus() {
		return gStatus;
	}

	public void setgStatus(int gStatus) {
		this.gStatus = gStatus;
	}

	public String getgKeywords() {
		return gKeywords;
	}

	public void setgKeywords(String gKeywords) {
		this.gKeywords = gKeywords;
	}

	public Timestamp getgInsertDt() {
		return gInsertDt;
	}

	public void setgInsertDt(Timestamp gInsertDt) {
		this.gInsertDt = gInsertDt;
	}

	public Timestamp getgUdateDt() {
		return gUdateDt;
	}

	public void setgUdateDt(Timestamp gUdateDt) {
		this.gUdateDt = gUdateDt;
	}

	public char getgRegister() {
		return gRegister;
	}

	public void setgRegister(char gRegister) {
		this.gRegister = gRegister;
	}

	public int getgRegisterId() {
		return gRegisterId;
	}

	public void setgRegisterId(int gRegisterId) {
		this.gRegisterId = gRegisterId;
	}

	public String getgIpAddress() {
		return gIpAddress;
	}

	public void setgIpAddress(String gIpAddress) {
		this.gIpAddress = gIpAddress;
	}

	public String getgBasicFileName() {
		return gBasicFileName;
	}

	public void setgBasicFileName(String gBasicFileName) {
		this.gBasicFileName = gBasicFileName;
	}

	public String getgFrontFileName() {
		return gFrontFileName;
	}

	public void setgFrontFileName(String gFrontFileName) {
		this.gFrontFileName = gFrontFileName;
	}

}

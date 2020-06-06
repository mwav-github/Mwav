package net.common.common;

public enum Status {

	/** 성공 */
	OK("OK"),
	/** 실패 */
	FAIL("FAIL"),
	/** 사용자 입력 오류 */
	INPUT_ERROR("INPUT_ERROR");
	
	/** 응답 결과 */
	String reason;

	Status(String reason) {
		this.reason = reason;
	}
	
	public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
}

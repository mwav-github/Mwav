package net.mwav.member.auth;

public class CommonResult {
	private String message;
	private boolean success;
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	
	public static CommonResult createSuccess() {
		CommonResult c = new CommonResult();
		c.success=true;
		c.message = "";
		return c;
	}
	
	public static CommonResult createFail(String message) {
		CommonResult c= new CommonResult();
		c.success= false;
		c.message = message;
		return c;
		
	}
}

package net.common.common;

public class LeftFrame_VO {
      private String eName;
      private String hKName;
      private String hEName;
      private String url;
      private String mAuthority;
      private String dAuthority;
      
      public LeftFrame_VO() {
		// TODO Auto-generated constructor stub
    	  
	}public LeftFrame_VO(String eName, String hKName, String hEName, String url, String mAuthority,String dAuthority) {
		// TODO Auto-generated constructor stub
    	this.eName = eName;
    	this.hKName = hKName;
    	this.hEName = hEName;
    	this.url = url;
    	this.mAuthority = mAuthority;
    	this.dAuthority = dAuthority;
	}
      
      public String gethKName() {
		return hKName;
	}
	public void sethKName(String hKName) {
		this.hKName = hKName;
	}
	public String gethEName() {
		return hEName;
	}
	public void sethEName(String hEName) {
		this.hEName = hEName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
	}
	public String geturl() {
		return url;
	}
	public void seturl(String url) {
		this.url = url;
	}
	public String getmAuthority() {
		return mAuthority;
	}
	public void setmAuthority(String mAuthority) {
		this.mAuthority = mAuthority;
	}
	public String getdAuthority() {
		return dAuthority;
	}
	public void setdAuthority(String dAuthority) {
		this.dAuthority = dAuthority;
	}
      
}

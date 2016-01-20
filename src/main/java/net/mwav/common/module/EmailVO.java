package net.mwav.common.module;

public class EmailVO {
	private String subject;
	private String content;
	private String receiver;
	private String Name;
	

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
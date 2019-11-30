package net.mwav.common.module;

import java.io.Serializable;
import java.util.Properties;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "MailConfig")
@XmlAccessorType(XmlAccessType.PROPERTY)
public class MailConfig implements Serializable {

	private static final long serialVersionUID = -5179262290367133550L;

	@XmlElement(name = "mail.smtp.host")
	private String host;

	@XmlElement(name = "mail.smtp.port")
	private String port;
	
	@XmlElement(name = "mail.smtp.auth")
	private String auth;
	
	@XmlElement(name = "mail.smtp.starttls.enable")
	private String starttls;
	
	@XmlElement(name = "mail.smtp.user")
	private String user;
	
	@XmlElement(name = "mail.smtp.password")
	private String password;

	public MailConfig() {
		super();
	}

	public String getHost() {
		return host;
	}

	public String getPort() {
		return port;
	}

	public String getAuth() {
		return auth;
	}

	public String getStarttls() {
		return starttls;
	}

	public String getUser() {
		return user;
	}

	public String getPassword() {
		return password;
	}
	
	public Properties getCollectAllFieldProp() {
		Properties prop = new Properties(); 
		prop.setProperty("mail.smtp.host", host);
		prop.setProperty("mail.smtp.port", port);
		prop.setProperty("mail.smtp.auth", auth);
		prop.setProperty("mail.smtp.starttls.enable", starttls);
		prop.setProperty("mail.smtp.user", user);
		prop.setProperty("mail.smtp.password", password);
		return prop;
	}
	
}

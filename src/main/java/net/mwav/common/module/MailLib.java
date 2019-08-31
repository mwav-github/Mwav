package net.mwav.common.module;

import javax.mail.Message;
import javax.mail.Transport;

public class MailLib{

	private static class MailLibSingleton{
		private static final MailLib instance = new MailLib();
	}
	
	public static MailLib getInstance() {
		return MailLibSingleton.instance;
	}	
	
	//메세지 발송. boolean를 사용하여 보냄여부를 한번 더 체크
	public void send(Message msg) throws Exception{
		Transport.send(msg);
	}
	
}

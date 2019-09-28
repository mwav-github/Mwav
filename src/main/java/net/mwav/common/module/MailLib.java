package net.mwav.common.module;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;

/**
 * <pre>description : Email과 관련된 라이브러리</pre>
 *@class name : MailLib.java
 *@author : (정) 공태현
            (부)
 *@since : 2019. 8. 31.
 *@version : v1.0
 *@see
 * @history :
   ----------------------------------------
   * Modification Information(개정이력)
   ----------------------------------------
           수정일                  수정자                         수정내용
   --------    --------    ----------------
   2019. 8. 31.     John    
 */
public class MailLib{

	private static class MailLibSingleton{
		private static final MailLib instance = new MailLib();
	}
	
	/** 
	 * <pre>description : MailLib를 싱글톤으로 생성</pre>
	 * @method name : getInstance
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 8. 31.
	 * @version : v1.0
	 * @see :
	   #method : 현재 클래스의 메소드나 변수 연결
	   MyClass#method : MyClass 클래스의 메소드나 변수 연결
	   my.package.MyClass#method : my.package 에 있는 MyClass 클래스의 메소드나 변수 연결
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
		  수정일 	          수정자    		        수정내용
	   --------    --------    ----------------
	   2019. 8. 31.     John     
	 * @param :
	 * @return : 싱글톤으로 생성된 MailLib
	 * @throws : 
	 <pre>
	 * {@code : 예제 코드 작성
	 * MailLib.getInstance();
	 * } 
	 </pre>
	*/
	public static MailLib getInstance() {
		return MailLibSingleton.instance;
	}	
	
	/** 
	 * <pre>description : Message객체를 받아 전송</pre>
	 * @method name : send
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 8. 31.
	 * @version : v1.0
	 * @see : javax.mail.Transport
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
		  수정일 	          수정자    		        수정내용
	   --------    --------    ----------------
	   2019. 8. 31.     John     
	 * @param : Message의 타입의 객체
	 * @return : 
	 * @throws MessagingException 
	 <pre>
	 * {@code : 예제 코드 작성
	 * MailLib.getInstance().send(msg);
	 * } 
	 </pre>
	*/
	public void send(Message msg) throws MessagingException{
		Transport.send(msg);
	}
	
}

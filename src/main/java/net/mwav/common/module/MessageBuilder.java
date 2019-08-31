package net.mwav.common.module;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MessageBuilder{
   
   Message msg;   
   
   public Message build() {
      return this.msg;
   }
   
   public MessageBuilder createMessage(Properties props) {
      //초기 MimeMessage 작업시 필요
      Session session = Session.getInstance(props, new Authenticator() {
         @Override
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(props.getProperty("user"), props.getProperty("password"));
         }
      });
      
      this.msg = new MimeMessage(session);
      
      return this;
   }
   
   /** 
     * <pre>description : 이메일을 문자열로 전달받아 Addess로 반환한다.</pre>
	 * @method name : convertAddress
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 8. 31.
	 * @version : v1.0
	 * @see : javax.mail.Address;
	 * @description :
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
		  수정일 	          수정자    		        수정내용
	   --------    --------    ----------------
	   2019. 8. 31.     John     
	 * @param : 이메일주소
	 * @return : 전달받은 이메일로 Address 객체 생성
	 * @throws : AddressException
	 <pre>
	 * {@code : 예제 코드 작성
	 * 	convertAddress("email@gmail.com");
	 * } 
	 </pre>
	*/
   public Address convertAddress(String address) throws AddressException {
      return new InternetAddress(address);
   }

   /** 
	 * <pre>description : 이메일과 수신자이름을 받아 Address로 반환한다.</pre>
	 * @method name : convertAddress
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 8. 31.
	 * @version : v1.0
	 * @see : javax.mail.Address;
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
		  수정일 	          수정자    		        수정내용
	   --------    --------    ----------------
	   2019. 8. 31.     John     
	 * @param : 이메일주소, 수신자이름
	 * @return : 전달받은 이메일로 Address 객체 생성
	 * @throws : AddressException, UnsupportedEncodingException
	 <pre>
	 * {@code : 예제 코드 작성
	 * convertAddress("email.gmail.com", "홍길동");
	 * } 
	 </pre>
	*/
	public Address convertAddress(String address, String recipentName) throws AddressException, UnsupportedEncodingException {
      return new InternetAddress(address, recipentName);
   }
   
   /** 
	 * <pre>description : 이메일주소 List를 받아 Addres[]로 반환한다.</pre>
	 * @method name : convertAddress
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 8. 31.
	 * @version : v1.0
	 * @see : javax.mail.Address;
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
		  수정일 	          수정자    		        수정내용
	   --------    --------    ----------------
	   2019. 8. 31.     John     
	 * @param : 이메일주소 문자열이 담긴 List<String>
	 * @return : Address[]로 반환
	 * @throws : AddressException
	 <pre>
	 * {@code : 예제 코드 작성
	 *  addressList.add("email1@gmail.com");
	 *  addressList.add("email2@gmail.com");
	 *  convertAddress(addressList);
	 * } 
	 </pre>
	*/
   public Address[] convertAddress(List<String> addressList) throws AddressException {
      return (Address[]) addressList.toArray();
   }
   
   public Address[] convertAddress(Map<String, String> addressList) throws AddressException {
	  return null; 	
   }
   
   public MessageBuilder setSubject(String subject) throws MessagingException {
      this.msg.setSubject(subject);
      return this;
   }
   
   public MessageBuilder setText(String text) throws MessagingException {
      this.msg.setText(text);
      return this;
   }
   
   public MessageBuilder setRecipient(String address) throws MessagingException, UnsupportedEncodingException {
      this.msg.setRecipient(RecipientType.TO, convertAddress(address));
      return this;
   }
   
   public MessageBuilder setRecipient(String address, String recipentName) throws MessagingException, UnsupportedEncodingException {
      Address ad = new InternetAddress(address, recipentName);
      this.msg.setRecipient(RecipientType.TO, ad);
      return this;
   }
   
   public MessageBuilder setFrom(String address) throws MessagingException{
	   this.msg.setFrom(convertAddress(address));
	   return this;
   }
   
}
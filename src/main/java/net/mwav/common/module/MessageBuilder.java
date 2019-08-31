package net.mwav.common.module;

import java.io.UnsupportedEncodingException;
import java.util.List;
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

/**
 * <pre>description : Email객체 생성을 도와주는 빌더패턴의 객체</pre>
 *@class name : MessageBuilder.java
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
public class MessageBuilder{
   
   Message msg;   
   
   /** 
    * <pre>description : MessageBuilder는 필수로 email 정보가 담긴 properties를 받야만 한다.</pre>
	 * @constructors
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
	 <pre>
	 * {@code : 예제 코드 작성
	 * 	new MessageBuilder(props);
	 * } 
	 </pre>
	*/
   public MessageBuilder(Properties props) {
      Session session = Session.getInstance(props, new Authenticator() {
          @Override
          protected PasswordAuthentication getPasswordAuthentication() {
             return new PasswordAuthentication(props.getProperty("user"), props.getProperty("password"));
          }
       });
       
       this.msg = new MimeMessage(session);
   }

   public Message build() {
      return this.msg;
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
	  Address[] address = new Address[addressList.size()]; 
	   
	  for(int i=0; i<addressList.size(); i++){
		  address[i] = new InternetAddress(addressList.get(i));
	  }
	  
      return address;
   }
   
   /** 
	 * <pre>description : 이메일을 제목을 설정한다.</pre>
	 * @method name : setSubject
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 8. 31.
	 * @version : v1.0
	 * @see : 
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
		  수정일 	          수정자    		        수정내용
	   --------    --------    ----------------
	   2019. 8. 31.     John     
	 * @param : 이메일 제목 문자열
	 * @return : 자기자신을 반환받아 builder 패턴을 적용
	 * @throws : MessagingException
	 <pre>
	 * {@code : 예제 코드 작성
	 * setSubject("이메일 제목입니다.");
	 * } 
	 </pre>
	*/
   public MessageBuilder setSubject(String subject) throws MessagingException {
      this.msg.setSubject(subject);
      return this;
   }
   
   /** 
	 * <pre>description : 이메일 본문을 작성한다. htmlYN이 true라면 html형식으로 false면 text로 적용</pre>
	 * @method name : setContent
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
	 * @param : String타입의 본문, html적용여부 Y/N
	 * @return : 자기자신을 반환받아 builder 패턴을 적용
	 * @throws : MessagingException
	 <pre>
	 * {@code : 예제 코드 작성
	 * String content = VelocityEngineUtils.mergeTemplateIntoString(velocityConfig.createVelocityEngine(), "/Templates/GeneralMail/PWSeekEmail.vm", "UTF-8", map);
	 * setContent(content, true)
	 * } 
	 </pre>
	*/
   public MessageBuilder setContent(String content, boolean htmlYN) throws MessagingException {
	  if(htmlYN)
		  this.msg.setContent(content, "text/html; charset=UTF-8");
	  else
		  this.msg.setText(content);
      return this;
   }
   
   /** 
	 * <pre>description : 수신자의 이메일주소를 받는다.</pre>
	 * @method name : setRecipient
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 8. 31.
	 * @version : v1.0
	 * @see : javax.mail.Message.RecipientType.TO
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
		  수정일 	          수정자    		        수정내용
	   --------    --------    ----------------
	   2019. 8. 31.     John     
	 * @param : 전달받을 수신자 이메일주소
	 * @return : 자기자신을 반환받아 builder 패턴을 적용
	 * @throws : MessagingException, UnsupportedEncodingException
	 <pre>
	 * {@code : 예제 코드 작성
	 * setRecipent("email@gmail.com");
	 * } 
	 </pre>
	*/
   public MessageBuilder setRecipient(String address) throws MessagingException, UnsupportedEncodingException {
      this.msg.setRecipient(RecipientType.TO, convertAddress(address));
      return this;
   }
   
   /** 
	 * <pre>description : 수신자의 이메일주소와 수신자 이름을 받는다.</pre>
	 * @method name : setRecipient
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 8. 31.
	 * @version : v1.0
	 * @see : javax.mail.Message.RecipientType.TO
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
		  수정일 	          수정자    		        수정내용
	   --------    --------    ----------------
	   2019. 8. 31.     John     
	 * @param : 전달받을 수신자 이메일주소, 수신자 이름
	 * @return : 자기자신을 반환받아 builder 패턴을 적용
	 * @throws : MessagingException, UnsupportedEncodingException
	 <pre>
	 * {@code : 예제 코드 작성
	 * setRecipent("email@gmail.com", "홍길동");
	 * } 
	 </pre>
	*/
   public MessageBuilder setRecipient(String address, String recipentName) throws MessagingException, UnsupportedEncodingException {
      Address ad = new InternetAddress(address, recipentName);
      this.msg.setRecipient(RecipientType.TO, ad);
      return this;
   }
   
   /** 
	 * <pre>description : 발신자 이메일주소를 받는다.</pre>
	 * @method name : setFrom
	 * @author : (정) 공태현
	             (부)
	 * @since  : 2019. 8. 31.
	 * @version : v1.0
	 * @see :
	 * @history :
	   ----------------------------------------
	   * Modification Information(개정이력)
	   ----------------------------------------
		  수정일 	          수정자    		        수정내용
	   --------    --------    ----------------
	   2019. 8. 31.     John     
	 * @param : 발신자의 이메일주소
	 * @return : 자기자신을 반환받아 builder 패턴을 적용
	 * @throws : MessagingException
	 <pre>
	 * {@code : 예제 코드 작성
	 *  setFrom("email@gmail.com");
	 * } 
	 </pre>
	*/
   public MessageBuilder setFrom(String address) throws MessagingException{
	   this.msg.setFrom(convertAddress(address));
	   return this;
   }
   
   /** 
	 * <pre>description : 발신자 이메일주소와 이름을 받는다.</pre>
	 * @method name : setFrom
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
	 * @param : 발신자의 이메일주소, 발신자 이름
	 * @return : 자기자신을 반환받아 builder 패턴을 적용
	 * @throws : MessagingException, UnsupportedEncodingException
	 <pre>
	 * {@code : 예제 코드 작성
	 * setFrom("email@gmail.com", "홍길동");
	 * } 
	 </pre>
	*/
   public MessageBuilder setFrom(String address, String fromName) throws MessagingException, UnsupportedEncodingException{
	   this.msg.setFrom(convertAddress(address, fromName));
	   return this;
   }
   
}
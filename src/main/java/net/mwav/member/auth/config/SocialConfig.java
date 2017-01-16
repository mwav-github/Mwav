/*
 * Copyright 2014 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package net.mwav.member.auth.config;


import javax.inject.Inject;
import javax.sql.DataSource;
import net.mwav.member.auth.VersionProperty;
import net.mwav.member.auth.google.PostToWallAfterConnectInterceptor;
import net.mwav.member.auth.util.SimpleSignInAdapter;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.core.env.Environment;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.social.UserIdSource;
import org.springframework.social.config.annotation.ConnectionFactoryConfigurer;
import org.springframework.social.config.annotation.EnableSocial;
import org.springframework.social.config.annotation.SocialConfigurer;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.jdbc.JdbcUsersConnectionRepository;
import org.springframework.social.connect.web.ConnectController;
import org.springframework.social.connect.web.ProviderSignInController;
import org.springframework.social.connect.web.ReconnectFilter;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.linkedin.api.LinkedIn;
import org.springframework.social.linkedin.connect.LinkedInConnectionFactory;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;

import org.springframework.social.twitter.api.Twitter;
import org.springframework.social.twitter.connect.TwitterConnectionFactory;

import net.mwav.member.auth.config.SimpleConnectionSignUp;


/**
 * Spring Social Configuration. This configuration demonstrates the use of the
 * simplified Spring Social configuration options from Spring Social 1.1.
 * 
 * @author Craig Walls
 */

/*
 [스프링 소셜 설정]
 * 
 * 
 SocialConfigurer 인터페이스를 구현하는 어플리케이션 콘텍스트 설정클래스를  
@Configuration 어노테이션과 함께 만든다.   
SocialConfigurer 인터페이스는 스프링소셜을 설정하는데 쓰이는 콜백메소드를 선언한다.
@EnableSocial어노테이션을 사용함으로써 스프링 소셜을 활성화하고, 스프링소셜설정클래스를 임포트한다.
DataSource필드를 추가하고 @Autowired 적용하라.


SocialConfigurer interface의 addConnectionFactories() 메소드를 생성된 설정 클래스에 추가한다.
이 메소드는 다음에 설명된 두개의 파라미터를 가진다.
1. 첫번째 파라미터는 커넥션팩토리에 사용되는  ConnectionFactoryConfigurer 객체이다.
2. 두번째 파라미터는 예제프로그램이 돌아가는 환경을 나타내는   Environment 객체이다.

addConnectionFactories() 메소드 를 다음단계로 구현한다.
1.  새로운   TwitterConnectionFactory object를 만들고 consumer key 와 consumer secret을 생성자의 파라미터로 전달한다.

2.   ConnectionFactoryConfigurer인터페이스의  addConnectionFactory() 를 호출함으로써 생성된  TwitterConnectionFactory객체를 전달한다. 
            생성된 TwitterConnectionFactory 객체를 메소드의 파라미터로 전달한다.
            
3.   FacebookConnectionFactory 객체를 만들고 어플리케이션 아이디와 secrect을 생성자 파라미터로 전달한다.
4.  ConnectionFactoryConfigurer인터페이스의 메소드를 호출함으로써  FacebookConnectionFactory 객체를 만들고 메소드 파라미터로 전달한다. 

SocialConfigurer 인터페이스의  getUserIdSource()메소드를 생성된 클래스에 추가한다. 
이 메소드에 의해 반환된  UserIdSource 객체는 정확한 유저계정의 아이디를 결정하는 책임이 있다. 
우리의 예제 프로그램은 username 을 계정 id로 사용하기 때문에 우리는   AuthenticationNameUserIdSource객체를 반환하는 메소드를 구현해야 한다. 

SocialConfigurer interface의  getUsersConnectionRepository()  메소드를 생성된 클래스에 추가한다. 
이 메소드는  ConnectionFactoryLocator 객체를 메소드 파라미터로 받으며  UsersConnectionRepository object.를 반환한다.

getUsersConnectionRepository() 메소드의 구현은 다음 단계를 거친다.
1.   JdbcUsersConnectionRepository 객체를 만들고 다음 객체들을 생성자필드로 전달한다.
  1.1 첫번째 필드는 dataSource
  1.2 두번째 필드는  ConnectionFactoryLocator 이며, 우리는  ConnectionFactoryLocator 값을두번째 파라미터로 전달.
  1.3 세번째 파라미터는   TextEncryptor 객체이며,  우리 프로그램과 SaaS API 프로바이더사이에 연결된 코넥션의 인증세부사항을을 암호화한다. 
              우리는  noOpText() method of the Encryptors class를 통해 이것을 생성할 수 있으며, 
               이것은 우리의 예제가 평문으로 이러한 세부정보를 저장한다는 것을 의미한다. 개발때는 간편하지만 실제사용에서는 쓰지말아야 한다. 
               
2. 생성된 객체를 반납한다.
 ConnectController 빈을 설정한다. 이 메소드는 두개의 파라미터를 가진다. 첫
   번째 파라미터는   ConnectionFactoryLocator bean이고 두번째 파라미터는   ConnectionRepository bean이다..  
  ConnectController 객체를 생성할때 이 파라미터들을 전달하라.
 * 
 * 
 */
@Configuration
@EnableSocial
public class SocialConfig implements SocialConfigurer {

	Logger logger = Logger.getLogger(this.getClass());
	@Inject
	private DataSource dataSource;
	
	@Inject
	private VersionProperty versionProperty;

	@Override
	
	///To register one or more ConnectionFactory objects, override the addConnectionFactories() method from SocialConfigurer as follows:
	public void addConnectionFactories(ConnectionFactoryConfigurer cfConfig, Environment env) {
		cfConfig.addConnectionFactory(
				new GoogleConnectionFactory(versionProperty.getGoogleKey(), versionProperty.getGoogleSecret()));
		cfConfig.addConnectionFactory(
				new LinkedInConnectionFactory(versionProperty.getLinkedinKey(), versionProperty.getLinkedinSecret()));
		cfConfig.addConnectionFactory(
				new FacebookConnectionFactory(versionProperty.getFacebookKey(), versionProperty.getFacebookSecret()));
		cfConfig.addConnectionFactory(
				new TwitterConnectionFactory(versionProperty.getTwitterKey(), versionProperty.getTwitterSecret()));

	}
	
	
	
	
	
	
	
	/*
	 client_id : Client의 id
client_secret : client_id를 위한 secret 값이다. 이 값으로 Client를 인증하기 때문에, 다른 누구에게도 노출되면 안된다.
	 */
	

	//Internally, Spring Social’s configuration support will use the UsersConnectionRepository to create a request-scoped ConnectionRepository bean. In doing so, it must identify the current user. Therefore, we must also override the getUserIdSource() to return an instance of a UserIdSource.
	//In this case, we’re returning an instance of AuthenticationNameUserIdSource. This implementation of the UserIdSource interface assumes that the application is secured with Spring Security. It uses the SecurityContextHolder to lookup a SecurityContext, and from that return the name property of the Authentication object.
	// getUserId String 리턴
	@Override
	public UserIdSource getUserIdSource() {  // getUserIdSource는 어디서 UserId를 갖고 와서 리턴해주면 되는 지 설정해달라는 메소드이다.
		return new UserIdSource() {
			@Override
			public String getUserId() {
				Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
				//SecurityContextHolder 우리는 앞서 로그인 한 유저를 UserDetails 객체로 담아서, Authentication 으로 인증시켜 준 후에 SecurityContext로 넣어주는 프로세스를 알고있다.
				/*
				 최초 로그인할 때 반드시 SecurityContextHolder 를 통해 SecurityContext에 인증된 User 정보를 담아두어야 하는 것이다. 정리하자면 이 메소드는 이런 이야기다.
                 connection 한 이후에 provider랑 또 연결해야하면 나는 UserId를 어디서 갖고 오면 되니?"
                 "최초 로그인할 때 SecurityContext 에 담아줄테니 그 이후에는 거기서 가져가 쓰렴"
				 */
				
				if (authentication == null) {
					throw new IllegalStateException("ConnectionRepository 사용불가: no user signed in");
				}
				return authentication.getName();
			}
		};
	}

	//DataSource (which is configured elsewhere and autowired into this configuration class)
	//n ConnectionFactoryLocator, and a text encryptor
	//The text encryptor is any implementation of the TextEncryptor interface from Spring Security’s crypto module
	// > 엑세스 토큰 등 암호화 
	
	
	/*
	 한번 provider와 커넥션을 맺고나면 connection 들은 유저 단위로 connectionRepository 라는 곳에 저장된다. 
	  여기에서는 connectionRepository 를 어디에 저장할 것인지 설정할 수 있다. "어디에" 저장하냐는 문제는 매우 중요한데, 어디에 저장하느냐에 따라 connection 이 얼마나 지속되는 지를 결정할 수 있기 때문이다. 
         디폴트 셋팅은 inmemroy 지만, jdbc-based repository 도 제공한다. 
         이 이야기인즉슨 RDBMS 와 연결이 되어 있는 동안 내내 user의 Connection 을 유지시켜 줄 수 있다는 뜻. 
         예제도 jdbcUserRepository 를 채택하고 있어서 나도 그걸로 그냥 따라했다. 
         
         http://www.programcreek.com/java-api-examples/index.php?class=org.springframework.social.connect.jdbc.JdbcUsersConnectionRepository&method=setConnectionSignUp
	 * (non-Javadoc)
	 * @see org.springframework.social.config.annotation.SocialConfigurer#getUsersConnectionRepository(org.springframework.social.connect.ConnectionFactoryLocator)
	 */
	@Override
	public UsersConnectionRepository getUsersConnectionRepository(ConnectionFactoryLocator connectionFactoryLocator) {
	
		logger.debug("여기까지왔다.");
		System.out.println("요기요기");
		logger.debug("inside the usersConnectionRepository");
		
		JdbcUsersConnectionRepository repository = new JdbcUsersConnectionRepository(
		        dataSource, connectionFactoryLocator, Encryptors.noOpText());
		        //repository.setConnectionSignUp(new SimpleConnectionSignUp());
		    return repository;
	
	}

	// API Binding Beans
	// post wall 에서 온다.
	// 해당 xml 은 WEB-INF/config/socail.xml
	// ConnectController에서 인터셉터 부르면 위의 xml로 간다 
	
	@Bean
	public ConnectController connectController(ConnectionFactoryLocator connectionFactoryLocator,
			ConnectionRepository connectionRepository) {
		ConnectController connectController = new ConnectController(connectionFactoryLocator, connectionRepository);
		connectController.addInterceptor(new PostToWallAfterConnectInterceptor());
		return connectController;
	}

	@Bean
	@Scope(value = "request", proxyMode = ScopedProxyMode.INTERFACES)
	public Google googleConnection(ConnectionRepository repository) {
		Connection<Google> connection = repository.findPrimaryConnection(Google.class);
		return connection != null ? connection.getApi() : null;
	}
	
	@Bean
	@Scope(value="request", proxyMode=ScopedProxyMode.INTERFACES)
	public LinkedIn linkedin(ConnectionRepository repository) {
		Connection<LinkedIn> connection = repository.findPrimaryConnection(LinkedIn.class);
		return connection != null ? connection.getApi() : null;
	}
	
	@Bean
	@Scope(value="request", proxyMode=ScopedProxyMode.INTERFACES)
	public Facebook Facebook(ConnectionRepository repository) {
		Connection<Facebook> connection = repository.findPrimaryConnection(Facebook.class);
		return connection != null ? connection.getApi() : null;
	}
	
	@Bean
	public ProviderSignInController providerSignInController(
	            ConnectionFactoryLocator connectionFactoryLocator,
	            UsersConnectionRepository usersConnectionRepository) {
		logger.debug("여기까지왔다.");
	    ProviderSignInController controller = new ProviderSignInController(
	        connectionFactoryLocator,
	        usersConnectionRepository,
	        new SimpleSignInAdapter(new HttpSessionRequestCache()));
	        controller.setSignUpUrl("/signup.mwav");
	    return controller;
	}

/*	@Bean
	public ReconnectFilter apiExceptionHandler(UsersConnectionRepository usersConnectionRepository,
			UserIdSource userIdSource) {
		return new ReconnectFilter(usersConnectionRepository, userIdSource);
	}
*/
}

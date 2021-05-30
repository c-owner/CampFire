package com.campfire.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.campfire.domain.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserServiceTests {
	@Setter(onMethod_ = @Autowired)
	private UserService service;
	
//	@Test
//	public void test() {
//		log.info(service);
//	}
	
//	@Test
//	public void testRegister() {
//		log.info("register..............");
//		UserVO user = new UserVO();
//		user.setUserId("Juno");
//		user.setUserPw("1234");
//		user.setUserEmail("darktraces@nate.com");
//		log.info(service.register(user));
//	}
	
//	@Test
//	public void testCheckEmail() {
//		log.info(service.checkEmail("darktraces@nate.com"));
//	}
	
//	@Test
//	public void testCheckId() {
//		log.info(service.checkId("Juno"));
//	}
	
	@Test
	public void testLogin() {
		log.info(service.login("Juno", "1234"));
	}
	
}

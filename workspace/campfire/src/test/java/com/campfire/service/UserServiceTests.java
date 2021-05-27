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
	
	@Test
	public void testRegister() {
		log.info("register..............");
		UserVO user = new UserVO();
		user.setUserId("test688");
		user.setUserPw("1234");
		user.setUserEmail("zxc@naver.com");
		log.info(service.register(user));
	}
}

package com.campfire.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
//	@Test
//	public void testSelectPw() {
//		log.info(mapper.selectPw("tester"));
//	}
	
//	@Test
//	public void testSelectEmail() {
//		log.info(mapper.selectEmail("test@test.com"));
//	}
	
//	@Test
//	public void testSelectId() {
//		log.info(mapper.selectId("tester"));
//	}
	
//	@Test
//	public void testInsert() {
//		UserVO user = new UserVO();
//		user.setUserEmail("test1@test.com");
//		user.setUserId("tester1");
//		user.setUserPw("testerPw1");
//		
//		log.info(mapper.insert(user));
//	}
//	
//	@Test
//	public void testFindId() {
//		log.info(mapper.findId("abc@naver.com"));
//	}
	
//	@Test
//	public void testFindPw() {
//		log.info(mapper.findPw("test123", "ac@naver.com"));
//	}
}

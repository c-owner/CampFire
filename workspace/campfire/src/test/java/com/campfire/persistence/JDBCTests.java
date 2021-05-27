package com.campfire.persistence;

import static org.junit.Assert.fail;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class) // 테스트 코드가 스프링을 실행
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") // 지정된 클래스나 문자열을 이용해서 필요한 객체들을 스프링 내에 객체로 등록
@Log4j
public class JDBCTests {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		// try(Statement) : 소괄호 안에 close를 필요로하는 인스턴스를 작성하면 자동으로 close()를 실행해 준다.
		try(Connection conn =
				DriverManager.getConnection("jdbc:oracle:thin:@camp-fire.kro.kr:1521:XE",
						"camp",
						"camp")){
			log.info(conn);
		}catch(Exception e) {
			fail(e.getMessage());
		}
	}
	
}
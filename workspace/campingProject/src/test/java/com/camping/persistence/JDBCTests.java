package com.camping.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class JDBCTests {
	
	static {
		try {
			Class.forName("oracle.jdbc.driver.oracleDriver");
		}catch (Exception e) {;}
	}
	
	@Test
	public void testConnection() {
		try(Connection conn = 
				DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE",
									"hr",
									"hr")){
			log.info(conn);
		}catch (Exception e) {;}
	}

}

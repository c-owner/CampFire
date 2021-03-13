package com.corner.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * 
 * @author corner
 * @api activation jaf-1.1.1 + javamail-1.4.7
 */
public class Gmail extends Authenticator {
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		
		return new PasswordAuthentication("qwe133553@gmail.com", "northface3499");
		// 구글 아이디와 비밀번호를 넣어야 하는 것
		/*
		 실제로 사용자한테 메일을 전송한 , 메일을 보내는 사람 (관리자 자신의 계정을 넣는 것이다.)
		 */
	}
}

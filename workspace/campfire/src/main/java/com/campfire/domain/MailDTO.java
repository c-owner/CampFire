package com.campfire.domain;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Data
@Log4j
public class MailDTO {
	private String receiver;
	private String title;
	private String content;
	
	public MailDTO(String receiver, String title, String content) {
		this.receiver = receiver;
		this.title = title;
		this.content = content;
	}
	
	public boolean sendmail() {
		final String user = "campfire2105"; //발신자의 이메일 아이디를 입력
		final String password = "Modak555%"; //발신자 이메일의 패스워드를 입력
		
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(this.receiver));
			
			message.setSubject(this.title);
			message.setText(this.content);
			
			Transport.send(message);
		} catch (Exception e) {
			log.info(e.getMessage());
			return false;
		}
		return true;
		
	}
}

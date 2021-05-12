package com.corner.camp.member.controller;

import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.corner.action.Action;
import com.corner.action.ActionForward;
import com.corner.util.Gmail;

public class MemberVerifyEmailAction implements Action{
    
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	      req.setCharacterEncoding("UTF-8");
	      resp.setContentType("text/html;charset=utf-8");
	      
	      ActionForward forward = null;
		
//	      Random r = new Random();
//		  int dice = r.nextInt(4589362) + 49311;
	      Random r = new Random();
	  		  int dice = r.nextInt(4589362) + 49311;
	          
	      String memberEmail = null;
	  	if(req.getParameter("email") != null ) {
	       memberEmail = req.getParameter("email");
	  	}
	  	
	      String host = "http://corner-camp.kro.kr/";
	      String from = "qwe133553@gmail.com"; 
	      String to = memberEmail;
	      String subject = "CampCorner 사이트 이용을 위한 회원가입 이메일 인증 메일입니다.";
	      String content = 
	               "안녕하세요 회원님. 저희 홈페이지를 찾아주셔서 감사합니다."
	              + "<br> 인증번호 : " +dice+ "   "
	               +"<br>받으신 인증번호로 입력 해주세요. 감사합니다."; 
	      
			Properties p = new Properties();
			p.put("mail.smtp.user", from);
			p.put("mail.smtp.host", "smtp.googlemail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			
			try {
				Authenticator auth = new Gmail();
				Session ses = Session.getInstance(p, auth);
				ses.setDebug(true);
				MimeMessage msg = new MimeMessage(ses);
				msg.setSubject(subject); // 메일제목
				Address fromAddr = new InternetAddress(from);
				msg.setFrom(fromAddr); //  보내는 사람 
				Address toAddr = new InternetAddress(to); 
				msg.addRecipient(Message.RecipientType.TO, toAddr); 
				
				msg.setContent(content, "text/html;charset=UTF-8");
				Transport.send(msg);
				
 
				String result = Integer.toString(dice); 
				resp.setContentType("text/html;charset=UTF-8");
				PrintWriter script = resp.getWriter();
				script.println(result);
				script.close();
			}catch (Exception e) {
				e.printStackTrace();
				PrintWriter script = resp.getWriter();
				script.println("<script>");
				script.println("alert('오류가 발생했습니다.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
			}
			
			
			return forward;
	}
	
	
	
}

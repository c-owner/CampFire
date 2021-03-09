package com.corner.camp.member.controller;

import java.io.PrintWriter;
import java.util.Properties;

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
import com.corner.camp.member.dao.MemberDAO;
import com.corner.camp.member.vo.MemberVO;
import com.corner.util.Gmail;

public class MemberEmailFindPwAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		
		String memberEmail = null;
		String memberId = null;
		if(req.getParameter("email") != null ) {
			memberEmail = req.getParameter("email");
		} 
	 System.out.println("이메일 체크1");
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		// id와 이메일을 불러왔다면 임시 비밀번호 갱신
		vo.setMemberPw(dao.encrypt("null"));
		String temp_pw = vo.getMemberPw();
		
		memberId = vo.getMemberId();
		System.out.println("이메일 체크2");
		
		if(dao.tempPassword(temp_pw.length())) {
			// 만약 임시 비밀번호 길이를 갱신했다면 
		// 임시 비밀번호를 보여주어야한다.
			System.out.println("이메일 체크3 -if");
			temp_pw = dao.getUserPw(vo);
			
		} else {
			System.out.println("이메일 체크3 -else");
			// 임시 비밀번호 갱신이 되지 않았다면 
			// id , email이 존재하지 않거나, 틀리거나, DB update 문제
			return null;
		}
		
		System.out.println(memberEmail + "\n"+ memberId);
		
		System.out.println("이메일 체크4");
		String host = "http://corner-camp.kro.kr/";
		String from = "qwe133553@gmail.com"; 
		String to = dao.getUserEmail(memberId);
		String subject = "CampCorner 사이트 비밀번호 찾기 이메일입니다.";
		String content = "다음 링크에 접속하여 로그인을 진행하세요."
				+ "\n사용자 임시 비밀번호 : "+temp_pw+"\n ";
		
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
			msg.setSubject(subject);
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			
			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("/user/MemberLogin.me");
			
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

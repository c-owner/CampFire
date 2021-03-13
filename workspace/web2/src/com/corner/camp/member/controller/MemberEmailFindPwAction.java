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
import com.corner.util.SHA256;

public class MemberEmailFindPwAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		ActionForward forward = null;
		
		String memberEmail = null;
		if(req.getParameter("email") != null ) {
			memberEmail = req.getParameter("email");
		}
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		String memberId = null;
		memberId = dao.getUserId(memberEmail);

		vo.setMemberId(memberId);
		vo.setMemberPw(dao.encrypt(dao.tempPassword()));
		vo.setMemberEmail(memberEmail);
		vo.setMemberEmailHash(SHA256.getSHA256(memberEmail));
		vo.setMemberEmailChecked(1);
		
		
		boolean check = dao.setTempPw(vo);
String memberPw = null;
		if(check) {
			memberPw = dao.decrypt(vo.getMemberPw());
			System.out.println(memberPw);
		} else {
			PrintWriter script = resp.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생했습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		}
		
		String host = "http://corner-camp.kro.kr/";
		String from = "qwe133553@gmail.com"; 
		String to = dao.getUserEmail(memberId);
		String subject = "CampCorner 사이트 PW찾기 이메일입니다.";
		String content = "다음 링크에 접속하여 로그인을 진행하세요."
				+ "\n사용자 임시 비밀번호  : "+memberPw+"\n ";
		
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

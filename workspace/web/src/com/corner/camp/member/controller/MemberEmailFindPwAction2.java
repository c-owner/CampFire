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

public class MemberEmailFindPwAction2 implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");

		ActionForward forward = null;
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		String memberEmail = null;
		String memberId = null;
		String memberPw = null;
		
		if(req.getParameter("email") != null ) {
			memberEmail = req.getParameter("email");
			memberId = dao.getUserId(memberEmail);
		} 
		
		vo.setMemberId(memberId);
		vo.setMemberEmail(req.getParameter("email"));
		vo.setMemberPw(dao.tempPassword());
		vo.setMemberEmailHash(SHA256.getSHA256(dao.getUserEmail(memberId)));
		vo.setMemberEmailChecked(1);
		
		System.out.println(vo.getMemberEmail());
		System.out.println(vo.getMemberId());
		System.out.println(vo.getMemberPw());
		System.out.println(vo.getMemberEmailHash());
		System.out.println(vo.getMemberEmailChecked());
		
		System.out.println("이메일 체크2");
		
		boolean check = dao.setUserPw(memberId);
		if(check) {
			memberPw = dao.getUserPw(memberEmail);
			System.out.println(memberEmail + "\n"+ memberId +"\n"+memberPw);
			
		} else {
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('아이디와 이메일을 조회하지 못하였습니다. 잠시 후 다시 시도바랍니다.');");
			out.println("location.href='/user/MemberLogin.me' ");
			out.println("</script>");
			out.close();
		}
		
		
		System.out.println("이메일 체크3");
		// 임시 비밀번호 꺼내기 
		memberPw = dao.getUserPw(dao.decrypt(memberPw));
		
		String host = "http://corner-camp.kro.kr/";
		String from = "qwe133553@gmail.com"; 
		String to = dao.getUserEmail(memberId);
		String subject = "CampCorner 사이트 비밀번호 찾기 이메일입니다.";
		String content = "다음 링크에 접속하여 로그인을 진행하세요."
				+ "\n사용자 임시 비밀번호 : "+memberPw+"\n ";
		
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

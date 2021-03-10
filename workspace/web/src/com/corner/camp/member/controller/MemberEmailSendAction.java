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
import javax.servlet.http.HttpSession;

import com.corner.action.Action;
import com.corner.action.ActionForward;
import com.corner.camp.member.dao.MemberDAO;
import com.corner.util.Gmail;
import com.corner.util.SHA256;

public class MemberEmailSendAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	      req.setCharacterEncoding("UTF-8");
	      HttpSession session = req.getSession();
	      
	      MemberDAO dao = new MemberDAO();
		
	      ActionForward forward = null;
	      String memberId = null;
		
		if(session.getAttribute("memberId") != null ) {
			memberId = (String) session.getAttribute("memberId");
		}
		
		if(memberId == null ) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/user/MemberLogin.me");
		}
		
		boolean emailChecked = dao.getUserEmailChecked(memberId);
		if(emailChecked) {
			// 이미 인증된 회원은 메인으로 보낸다.
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("/Main.me");
		}  
		
		try {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("/user/emailSendAction.jsp");
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

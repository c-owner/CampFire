package com.corner.camp.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.corner.action.Action;
import com.corner.action.ActionForward;
import com.corner.camp.member.dao.MemberDAO;
import com.corner.util.SHA256;

public class MemberEmailAccessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		HttpSession session = req.getSession();
		
		String code = null;
		if(req.getParameter("code") != null ) {
			code = req.getParameter("code");
		}
		
		MemberDAO dao = new MemberDAO();
		String memberId = (String) session.getAttribute("memberId");
		
		if(session.getAttribute("memberId") != null ) { 
		memberId = (String) req.getAttribute("memberId");
		}
		
		if(memberId == null ) {
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('로그인을 해주세요.');");
			out.println("location.href = '/user/MemberLogin.me' ");
			out.println("</script>");
			out.close();
		}
		
		String memberEmail = dao.getUserEmail(memberId);
		boolean emailHashCheck = (new SHA256().getSHA256(memberEmail).equals(code)) ? true : false;
		PrintWriter out = resp.getWriter();
		
		if(emailHashCheck) {
			dao.setUserEmailChecked(memberId);
        	session.setAttribute("memberId", memberId);
			out.println("<script>");
			out.println("alert('인증에 성공했습니다.');");
			out.println("location.href = '/Main.me?type=login' ");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('유효한 코드가 아닙니다.');");
			out.println("location.href = '/Main.me' ");
			out.println("</script>");
		}
		out.close();
		
		return null;
	}
}

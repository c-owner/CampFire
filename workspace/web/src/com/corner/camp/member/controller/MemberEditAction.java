package com.corner.camp.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.corner.action.Action;
import com.corner.action.ActionForward;
import com.corner.camp.member.dao.MemberDAO;
import com.corner.camp.member.vo.MemberVO;
import com.corner.util.SHA256;

public class MemberEditAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String memberId= req.getParameter("memberId");
		String new_pw = req.getParameter("memberPw");
		System.out.println("check");
		ActionForward forward = null;
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		if(req.getAttribute("memberId") != null ) { 
		memberId = (String) req.getAttribute("memberId");
		}
		
		String memberEmail = dao.getUserEmail(memberId);
		
		
		vo.setMemberId(memberId);
		vo.setMemberPw(dao.encrypt(new_pw));
		vo.setMemberEmail(memberEmail);
		vo.setMemberEmailHash(SHA256.getSHA256(memberEmail));
		vo.setMemberEmailChecked(1);
		
		boolean check = dao.setUserPw(vo);
	
		if(check) {
			PrintWriter script = resp.getWriter();
			script.println("<script>");
			script.println("alert('성공적으로 비밀번호를 갱신하였습니다. 다시 로그인 해주세요.');");
			script.println(" location.href = '/Main.me'; ");
			script.println("</script>");
			script.close();
		} else { 
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('서버에 오류가 있습니다. 다시 시도해주세요.');");
			out.println("location.back(); ");
			out.println("</script>");
			out.close();
		}
		
		
		return forward;
	}
}

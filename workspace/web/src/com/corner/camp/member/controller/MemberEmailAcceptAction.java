package com.corner.camp.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.corner.action.Action;
import com.corner.action.ActionForward;
import com.corner.camp.member.dao.MemberDAO;
import com.corner.camp.member.vo.MemberVO;
import com.corner.util.SHA256;

public class MemberEmailAcceptAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		ActionForward forward = null;

		String memberId = null;
		String memberPw = null;
		String memberEmail = null;
		String memberEmailHash = null;
		final int memberEmailChecked = 0;

		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();

		memberId = req.getParameter("memberId");
		memberPw = req.getParameter("memberPw");
		memberEmail = req.getParameter("memberEmail");
		memberEmailHash = SHA256.getSHA256(memberEmail);

		vo.setMemberId(memberId);
		vo.setMemberPw(memberPw);
		vo.setMemberEmail(memberEmail);
		vo.setMemberEmailHash(memberEmailHash);
		vo.setMemberEmailChecked(memberEmailChecked);

		System.out.println("memberId : " + memberId);
		System.out.println("memberPw : " + memberPw);
		System.out.println("memberEmail : " + memberEmail);
		System.out.println("memberEmailHash : " + memberEmailHash);
		System.out.println("memberEmailChecked : " + memberEmailChecked);
		System.out.println("체크 2");

		if (!dao.join(vo)) {
			System.out.println("회원가입 실패");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/user/MemberJoin.me?join=false");
		} else {
			System.out.println("회원가입 성공");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/user/MemberLogin.me");
		}
		System.out.println("체크 3");
		return forward;
	}

}

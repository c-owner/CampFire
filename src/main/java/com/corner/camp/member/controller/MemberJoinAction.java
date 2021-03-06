package com.corner.camp.member.controller;

import com.corner.action.Action;
import com.corner.action.ActionForward;
import com.corner.camp.member.dao.MemberDAO;
import com.corner.camp.member.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class MemberJoinAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

        req.setCharacterEncoding("UTF-8");

        ActionForward forward = null;

        MemberDAO dao = new MemberDAO();
        MemberVO vo = new MemberVO();

        vo.setMemberId(req.getParameter("memberId"));
        vo.setMemberPw(req.getParameter("memberPw"));
        vo.setMemberEmail(req.getParameter("memberEmail"));

        if(!dao.join(vo)){
            PrintWriter out = resp.getWriter();
            resp.setContentType("text/html;charset=utf-8");
            out.println("<script>alert('서버가 불안정합니다. 잠시 후 다시 시도해주세요.')</script>");
            out.close();
        } else {
            forward = new ActionForward();
            forward.setRedirect(true);
            forward.setPath("/member/MemberLogin.me");
        }

        return forward;
    }
}

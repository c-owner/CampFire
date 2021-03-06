package com.corner.camp.member.controller;

import com.corner.action.Action;
import com.corner.action.ActionForward;
import com.corner.camp.member.dao.MemberDAO;
import com.corner.camp.member.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;

public class MemberLoginAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        req.setCharacterEncoding("UTF-8");

        String id = req.getParameter("memberId");
        String pw = req.getParameter("memberPw");

        MemberDAO dao = new MemberDAO();
        MemberVO vo = new MemberVO();
        HashMap<String, String> datas = new HashMap<>();

        String en_pw = dao.encrypt(pw);

        datas.put("memberId", id);
        datas.put("memberPw", en_pw);

        vo = dao.login(datas);

        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();
        ActionForward forward = null;
        if(vo == null ) {
            out.println("<script>alert('로그인 실패: 아이디가 존재하지 않거나" +
                    " 아이디와 패스워드를 확인하고 다시 시도해주세요.');" +
                    "history.back();</script>");
            out.close();

            return null;
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("memberId", id);
            out.close();

            forward.setRedirect(false);
            forward.setPath("/MainForm.me");
        }

        return forward;


    }
}

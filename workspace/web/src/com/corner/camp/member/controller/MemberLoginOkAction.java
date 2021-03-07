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

public class MemberLoginOkAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        req.setCharacterEncoding("UTF-8");
        System.out.println("체크 1 ");
        String id = req.getParameter("memberId");
        String pw = req.getParameter("memberPw");

        MemberDAO dao = new MemberDAO();
        MemberVO vo = new MemberVO();
        System.out.println(" 체크 1-1");
        HashMap<String, String> datas = new HashMap<>();

        String en_pw = dao.encrypt(pw); // 이게 문제 있다고? ㅋㅋ 어이가없네 
        
        System.out.println(" 체크 1-2");

        datas.put("memberId", id);
        datas.put("memberPw", en_pw);
        System.out.println(" 체크   : " + en_pw);
        vo = dao.login(datas);
        
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();
        ActionForward forward = null;
        
        System.out.println(" 체크 2 ");
        
         
        if (vo == null || vo.getMemberId().equals(id) || vo.getMemberPw().equals(en_pw)) {
        	System.out.println(" 로그인 실패 ");
            out.println("<script>alert('로그인 실패: 아이디가 존재하지 않거나" +
                    " 아이디와 패스워드를 확인하고 다시 시도해주세요.');" +
                    "history.back();</script>");
            out.close();
            return null;
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("memberId", id);
            System.out.println("로그인 성공");
            
            out.close();
            forward.setPath("/MainForm.me");
            forward.setRedirect(false);
        }

        return forward;


    }
}

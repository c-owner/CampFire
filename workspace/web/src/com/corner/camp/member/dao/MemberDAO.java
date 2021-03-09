package com.corner.camp.member.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.corner.camp.member.vo.MemberVO;
import com.corner.mybatis.config.SqlMapConfig;
import com.corner.util.SHA256;

public class MemberDAO {

    private static final int KEY = 3;

    SqlSessionFactory sessionFactory = SqlMapConfig.getSqlMapInstance();
    SqlSession session;

    public MemberDAO() {
        session = sessionFactory.openSession(true);
    }

    /**
     * @param vo
     * @return true : insert Success <br> false : insert Failed
     * @Constributors Corner
     */
	public boolean join(MemberVO member) {
		member.setMemberPw(encrypt(member.getMemberPw()));
		member.setMemberEmailHash(SHA256.getSHA256(member.getMemberEmail()));
		member.setMemberEmailChecked(0);
		return session.insert("Member.join", member) == 1;
	}

    /**
     * Id Overlap Check
     *
     * @param id
     * @return true : overlap <br> false : Available
     */
    public boolean checkId(String id) {
        return (Integer) session.selectOne("Member.checkId", id) == 1;
    }

    /**
     * Password Encrypt
     *
     * @param pw
     * @return String en_pw;
     */
	public String encrypt(String pw) {
		String en_pw = "";
		for (int i = 0; i < pw.length(); i++) {
			en_pw += (char) (pw.charAt(i) * KEY);
		}
		return en_pw;
	}
	public String decrypt(String en_pw) { 
		String de_pw = "";
		for(int i = 0; i < en_pw.length(); i++ ) {
			de_pw += (char)(en_pw.charAt(i) / KEY);
		}
		return de_pw;
	}
	
	//로그인
	/**
	 * 
	 * @param id
	 * @param pw
	 * @return
	 * true (1) : success <br> false (!1) : failed 
	 */
	public boolean login(String id, String pw) {
		HashMap<String, String> member = new HashMap<>();
		
		member.put("id", id);
		member.put("pw", encrypt(pw));
		return (Integer)session.selectOne("Member.login", member) == 1;
	}
	
	public String getUserEmail(String id) {
		return session.selectOne("Member.getEmail", id);
	}
	
	/**
	 * 
	 * @param id
	 * @return 
	 * boolean : true(1) : access // false(!1) : none 
	 */
	public boolean getUserEmailChecked(String id) {
		// 1 이면 인증된 회원 true, 0 이면 미인증 회원 false
		return (Integer) session.selectOne("Member.emailChecked", id) == 1;
	}
	/**
	 * 
	 * @param id
	 * @apiNote memberEmailChecked = 1로 업데이트 해주는 메소드
	 * @return boolean => true : Update Success <br> false : Update Failed
	 */
	public boolean setUserEmailChecked(String id) {
		return (Integer) session.update("Member.emailCheckUpdate", id) == 1;
	}

	/**
	 * @param email(String) 
	 * @return String(id)
	 */
	public String getUserId(String email) {
		return session.selectOne("getId", email);
	}
	
	/**
	 * 
	 * @param email
	 * @return boolean : true(email존재) & false (email없음)
	 */
	public boolean emailFindCheck(String email) {
		return (Integer)session.selectOne("Member.emailFindCheck", email) == 1;
	}
	
	/**
	 * 
	 * @param MemberVO member
	 * @return boolean : true(갱신완료) & false(갱신실패)
	 */
	public boolean updateUserPw(MemberVO member) {
		member.setMemberPw(encrypt(member.getMemberPw()));
		
		return (Integer)session.update("Member.updatePw", member) == 1;
	}
	
	
	/**
	 * 
	 * @param pw
	 * @return boolean (true:임시 비밀번호 갱신 성공)<br>(false:실패)
	 * <br> note : 사용자 임시 비밀번호 갱신 
	 */
	public boolean tempPassword(String id, String email) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4',
				'5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
				'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
				};
		int len = 6;
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		String temp_pw = null;
		for(int i = 0; i < len; i++ ) {
			idx = (int) (charSet.length * Math.random());
			sb.append(charSet[idx]);
		}
		HashMap<String, String> member = new HashMap<>();
		
		member.put("memberId", id);
		member.put("memberEmail", email);
		System.out.println("\n\n임시 비밀번호 : " + sb.toString() + " \n\n");
		temp_pw += sb.toString();
		
		return (Integer) session.update("Member.tempPw", member) == 1;
	}
	
	
	
	/**
	 * 
	 * @param member
	 * @return String (임시비밀번호를 반환)
	 * <br>Note : 사용자 임시 비밀번호 보여주기
	 */
	public String getUserPw(String email) {
		return session.selectOne("getPw", email);
	}
	
	public boolean emailFindPwCheck(String email) {
		return (Integer)session.selectOne("Member.emailFindCheck", email) == 1;
	}
	
}


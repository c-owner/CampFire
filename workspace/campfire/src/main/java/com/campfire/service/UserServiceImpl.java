package com.campfire.service;

import org.springframework.stereotype.Service;

import com.campfire.domain.UserVO;
import com.campfire.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class UserServiceImpl implements UserService{
	private static final int KEY = 3;
	private UserMapper mapper;

	/**
	 * true : 아이디 중복, false : 아이디 사용 가능
	 */
	@Override
	public boolean checkId(String userId) {
		return mapper.selectId(userId) == 1;
	}

	/**
	 * true : 이메일 중복, false : 이메일 사용 가능
	 */
	@Override
	public boolean checkEmail(String userEmail) {
		return mapper.selectEmail(userEmail) == 1;
	}

	@Override
	public boolean register(UserVO user) {
		user.setUserPw(encrypt(user.getUserPw()));
		return mapper.insert(user) == 1;
	}

	@Override
	public boolean login(String userId, String userPw) {
		boolean check = false;
		String realPw = mapper.selectPw(userId);
		if(realPw.equals(encrypt(userPw))) {
			check = true;
		}
		return check;
	}

	@Override
	public String encrypt(String pw) {
		String en_pw = "";
		for (int i = 0; i < pw.length(); i++) {
			en_pw += (char)(pw.charAt(i) * KEY);
		}
		return en_pw;
	}
	
}

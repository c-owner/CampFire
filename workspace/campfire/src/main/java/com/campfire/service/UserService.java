package com.campfire.service;

import com.campfire.domain.UserVO;

public interface UserService {
	public boolean checkId(String userId);
	public boolean checkEmail(String userEmail);
	public String encrypt(String pw);
	public boolean signUp(UserVO user);
	public boolean signIn(String userId, String userPw);
	public String findId(String userEmail);
	public boolean findPw(String userId, String userEmail);
}

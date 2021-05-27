package com.campfire.service;

import com.campfire.domain.UserVO;

public interface UserService {
	public boolean checkId(String userId);
	public boolean checkEmail(String userEmail);
	public boolean register(UserVO user);
	public boolean login(String userId, String userPw);
}

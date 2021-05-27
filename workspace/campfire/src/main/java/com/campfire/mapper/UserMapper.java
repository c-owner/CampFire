package com.campfire.mapper;

import com.campfire.domain.UserVO;

public interface UserMapper {
	public int selectId(String userId);
	public int selectEmail(String userEmail);
	public int insert(UserVO user);
	public String selectPw(String userId);
}

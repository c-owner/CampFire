package com.campfire.mapper;

import org.apache.ibatis.annotations.Param;

import com.campfire.domain.UserVO;

public interface AdminMapper {
	public int selectId(String userId);
	public int selectEmail(String userEmail);
	public int insert(UserVO user);
	public String selectPw(String userId);
	public String findId(String userEmail);
	public int findPw(@Param("userId") String userId, @Param("userEmail") String userEmail);
}

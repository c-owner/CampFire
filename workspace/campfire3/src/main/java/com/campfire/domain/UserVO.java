package com.campfire.domain;

import lombok.Data;

@Data
public class UserVO {
	private String userId;
	private String userPw;
	private String userEmail;
}
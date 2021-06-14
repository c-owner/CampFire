package com.campfire.domain;

import lombok.Data;

//CREATE TABLE TBL_POLICY_BOARD(
//		BNO NUMBER(10),
//		TITLE VARCHAR2(200) NOT NULL,
//		CONTENT VARCHAR2(2000) NOT NULL,
//		WRITER VARCHAR2(200) NOT NULL,
//		REGDATE DATE DEFAULT SYSDATE,
//		UPDATEDATE DATE DEFAULT SYSDATE,
//		CATEGORY VARCHAR2(30) NOT NULL
//	);

@Data
public class PolicyVO {

	private Long bno;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private String updateDate;
	private String policyKeyword;
	
	
}

package com.campfire.domain;

import lombok.Data;

@Data
public class ReviewBoardVO {
	
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private String updateDate;
	private String zipcode;
	private String address;
	private String addressDetail;
	private String addressEtc;
	
	private int likeCnt;
	private int readCnt;
	
	private int replyCnt;
	

}

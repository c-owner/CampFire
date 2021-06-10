package com.campfire.domain.reviewBoard;

import java.util.List;

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
	private String star; 
	private String thumb;
	private String campName;
	
	private List<ReviewBoardAttachVO> attachList;

}
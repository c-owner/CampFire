package com.campfire.domain;

import lombok.Data;

@Data
public class MarketBoardVO {
	
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private String updateDate;
	
	private int likeCnt;
	private int readCnt;
	
	private int replyCnt;
	

}

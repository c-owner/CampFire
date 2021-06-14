package com.campfire.domain.foodBoard;

import java.util.List;

import lombok.Data;

@Data
public class FoodBoardVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private String updateDate;
	private int likeCnt;
	private int replyCnt;
	private int readCnt;
	
	private List<FoodBoardAttachVO> attachList;
}

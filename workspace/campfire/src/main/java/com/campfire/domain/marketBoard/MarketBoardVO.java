package com.campfire.domain.marketBoard;

import java.util.List;

import lombok.Data;

@Data
public class MarketBoardVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private String updateDate;
	private int replyCnt;
	private List<MarketBoardAttachVO> attachList;
}

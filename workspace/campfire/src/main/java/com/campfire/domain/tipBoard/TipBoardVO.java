package com.campfire.domain.tipBoard;

import java.util.List;

import lombok.Data;

@Data
public class TipBoardVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private String updateDate;
	private int likeCnt;
	private int replyCnt;
	private List<TipBoardAttachVO> attachList;
	private int readCnt;
}

package com.campfire.domain.freeBoard;

import java.util.List;

import lombok.Data;

@Data
public class FreeBoardVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private String updateDate;
	private int likeCnt;
	private int replyCnt;
	private List<FreeBoardAttachVO> attachList;
	private int readCnt;
}

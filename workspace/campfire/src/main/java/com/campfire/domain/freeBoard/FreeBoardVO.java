package com.campfire.domain.freeBoard;

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
}

package com.campfire.domain.guideBoard;

import java.util.List;

import lombok.Data;
@Data
public class GuideBoardVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private String updateDate;
	private int likeCnt;
	private int replyCnt;
	private List<GuideBoardAttachVO> attachList;
	private int readCnt;
}

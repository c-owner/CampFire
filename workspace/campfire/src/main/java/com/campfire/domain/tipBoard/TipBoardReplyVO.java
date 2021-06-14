package com.campfire.domain.tipBoard;

import lombok.Data;

@Data
public class TipBoardReplyVO {
	private Long rno;
	private Long bno;
	private String reply;
	private String replyer;
	private String replyDate;
	private String updateDate;
}

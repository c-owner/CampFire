package com.campfire.domain.freeBoard;

import lombok.Data;

@Data
public class FreeBoardReplyVO {
	private Long rno;
	private Long bno;
	private String reply;
	private String replyer;
	private String replyDate;
	private String updateDate;
}

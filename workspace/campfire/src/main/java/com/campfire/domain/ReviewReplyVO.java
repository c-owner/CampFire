package com.campfire.domain;

import lombok.Data;

@Data
public class ReviewReplyVO {
	private Long rno;
	private Long bno;
	private String reply;
	private String replyer;
	private String replyDate;
	private String updateDate;
}

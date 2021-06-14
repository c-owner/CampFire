package com.campfire.domain.guideBoard;

import lombok.Data;

@Data
public class GuideBoardReplyVO {
	private Long rno;
	private Long bno;
	private String reply;
	private String replyer;
	private String replyDate;
	private String updateDate;
}

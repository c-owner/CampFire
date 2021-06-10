package com.campfire.domain.marketBoard;

import lombok.Data;

@Data
public class MarketReplyVO {
	private Long rno;
	private Long bno;
	private String reply;
	private String replyer;
	private String replyDate;
	private String updateDate;
}

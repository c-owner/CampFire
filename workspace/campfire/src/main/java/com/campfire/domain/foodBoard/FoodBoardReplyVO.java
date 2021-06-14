package com.campfire.domain.foodBoard;

import lombok.Data;

@Data
public class FoodBoardReplyVO {
	private Long rno;
	private Long bno;
	private String reply;
	private String replyer;
	private String replyDate;
	private String updateDate;
}

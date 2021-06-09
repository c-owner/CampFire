package com.campfire.domain;

import java.util.List;

import com.campfire.domain.reviewBoard.ReviewReplyVO;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplyPageDTO {
	private int replyCnt; 
	private List<ReviewReplyVO> list;
}
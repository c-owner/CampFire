package com.campfire.service;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.ReplyPageDTO;
import com.campfire.domain.reviewBoard.ReviewReplyVO;

public interface ReviewReplyService {
	public boolean register(ReviewReplyVO reply);
	public ReviewReplyVO view(Long rno);
	public boolean modify(ReviewReplyVO reply);
	public boolean remove(Long rno);
	public PageDTO selectReplyList(Criteria cri, Long bno);
	
}

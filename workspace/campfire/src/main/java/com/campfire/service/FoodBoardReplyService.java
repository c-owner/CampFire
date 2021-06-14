package com.campfire.service;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.foodBoard.FoodBoardReplyVO;

public interface FoodBoardReplyService {
	public boolean register(FoodBoardReplyVO reply);
	public FoodBoardReplyVO view(Long rno);
	public boolean modify(FoodBoardReplyVO reply);
	public boolean remove(Long rno);
	public PageDTO selectReplyList(Criteria cri, Long bno);
}

package com.campfire.service;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.marketBoard.MarketReplyVO;

public interface MarketReplyService {
	public int register(MarketReplyVO vo);
	public MarketReplyVO get(Long rno);
	public int remove(Long rno);
	public int modify(MarketReplyVO vo);
	public PageDTO getList(Criteria cri, Long bno);
}

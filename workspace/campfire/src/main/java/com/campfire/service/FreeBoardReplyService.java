package com.campfire.service;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.freeBoard.FreeBoardReplyVO;

public interface FreeBoardReplyService {
	public PageDTO getList(Criteria cri, Long bno);
	public int register(FreeBoardReplyVO f_vo);
	public FreeBoardReplyVO get(Long rno);
	public int remove(Long rno);
	public int modify(FreeBoardReplyVO f_vo);
}

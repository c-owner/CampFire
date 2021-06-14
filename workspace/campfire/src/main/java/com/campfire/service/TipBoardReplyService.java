package com.campfire.service;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.tipBoard.TipBoardReplyVO;

public interface TipBoardReplyService {
	public PageDTO getList(Criteria cri, Long bno);
	public int register(TipBoardReplyVO t_vo);
	public TipBoardReplyVO get(Long rno);
	public int remove(Long rno);
	public int modify(TipBoardReplyVO t_vo);
}

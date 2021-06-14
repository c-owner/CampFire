package com.campfire.service;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.guideBoard.GuideBoardReplyVO;

public interface GuideBoardReplyService {
	public PageDTO getList(Criteria cri, Long bno);
	public int register(GuideBoardReplyVO g_vo);
	public GuideBoardReplyVO get(Long rno);
	public int remove(Long rno);
	public int modify(GuideBoardReplyVO g_vo);
}

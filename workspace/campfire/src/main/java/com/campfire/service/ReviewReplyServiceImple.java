package com.campfire.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.reviewBoard.ReviewReplyVO;
import com.campfire.mapper.ReviewBoardMapper;
import com.campfire.mapper.ReviewReplyMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReviewReplyServiceImple implements ReviewReplyService{

	private ReviewReplyMapper rmapper;
	private ReviewBoardMapper bmapper;
	
	@Transactional
	@Override
	public boolean register(ReviewReplyVO reply) {
		bmapper.updateReplyCnt(reply.getBno(), 1);
		return rmapper.insertReply(reply) == 1;
	}

	@Override
	public ReviewReplyVO view(Long rno) {
		return rmapper.selectReply(rno);
	}

	@Override
	public boolean modify(ReviewReplyVO reply) {
		return rmapper.updateReply(reply) == 1;
	}

	@Transactional
	@Override
	public boolean remove(Long rno) {
		bmapper.updateReplyCnt(view(rno).getBno(), -1);
		return rmapper.deleteReply(rno) == 1;
	}

	@Override
	public PageDTO getList(Criteria cri, Long bno) {
		return new PageDTO(cri, rmapper.getTotal(bno), rmapper.selectReplyList(cri, bno));
	}

}

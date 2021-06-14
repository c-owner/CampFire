package com.campfire.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.foodBoard.FoodBoardReplyVO;
import com.campfire.mapper.FoodBoardMapper;
import com.campfire.mapper.FoodReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class FoodBoardReplyServiceImple implements FoodBoardReplyService {
	private FoodReplyMapper mapper;
	private FoodBoardMapper bmapper;
	
	@Transactional
	@Override
	public boolean register(FoodBoardReplyVO reply) {
		bmapper.updateReplyCnt(reply.getBno(), 1);
		return mapper.insertReply(reply) == 1;
	}

	@Override
	public FoodBoardReplyVO view(Long rno) {
		return mapper.selectReply(rno);
	}

	@Override
	public boolean modify(FoodBoardReplyVO reply) {
		return mapper.updateReply(reply) == 1;
	}

	@Transactional
	@Override
	public boolean remove(Long rno) {
		bmapper.updateReplyCnt(view(rno).getBno(), -1);
		return mapper.deleteReply(rno) == 1;
	}

	@Override
	public PageDTO selectReplyList(Criteria cri, Long bno) {
		return new PageDTO(mapper.getTotal(bno), mapper.selectReplyList(cri, bno), cri);
	}

}

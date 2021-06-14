package com.campfire.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.marketBoard.MarketReplyVO;
import com.campfire.mapper.MarketBoardMapper;
import com.campfire.mapper.MarketReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MarketReplyServiceImple implements MarketReplyService {
	private MarketReplyMapper r_mapper;
	private MarketBoardMapper b_mapper;
	
	@Transactional
	@Override
	public int register(MarketReplyVO reply) {
		log.info("장터댓글등록 " + reply);
		b_mapper.updateReplyCnt(reply.getBno(), 1);
		return r_mapper.insertReply(reply);
	}

	@Override
	public MarketReplyVO get(Long rno) {
		log.info("장터댓글겟 " + rno);
		return r_mapper.selectReply(rno);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("장터댓글삭제 " +rno);
		b_mapper.updateReplyCnt(r_mapper.selectReply(rno).getBno(), -1);
		return r_mapper.deleteReply(rno);
	}

	@Override
	public int modify(MarketReplyVO reply) {
		log.info("장터댓글수정 " + reply);
		return r_mapper.updateReply(reply);
	}

	@Override
	public PageDTO getList(Criteria cri, Long bno) {
		log.info("장터댓글리스트 " + bno);
		return new PageDTO(r_mapper.getTotal(bno), cri, r_mapper.selectReplyList(cri, bno));
	}

}

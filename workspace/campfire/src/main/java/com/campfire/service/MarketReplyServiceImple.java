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
	public int register(MarketReplyVO vo) {
		b_mapper.updateReplyCnt(vo.getBno(), 1);
		return r_mapper.insertReply(vo);
	}

	@Override
	public MarketReplyVO get(Long rno) {
		return r_mapper.selectReply(rno);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		b_mapper.updateReplyCnt(r_mapper.selectReply(rno).getBno(), -1);
		return r_mapper.deleteReply(rno);
	}

	@Override
	public int modify(MarketReplyVO vo) {
		return r_mapper.updateReply(vo);
	}

	@Override
	public PageDTO getList(Criteria cri, Long bno) {
		return new PageDTO(r_mapper.getTotal(bno), cri, r_mapper.selectReplyList(cri, bno));
	}

}

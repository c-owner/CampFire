package com.campfire.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.freeBoard.FreeBoardReplyVO;
import com.campfire.mapper.FreeBoardMapper;
import com.campfire.mapper.FreeBoardReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class FreeBoardReplyServiceImple implements FreeBoardReplyService{
	
	private FreeBoardReplyMapper r_mapper;
	private FreeBoardMapper f_mapper;
	
	@Override
	public PageDTO getList(Criteria cri, Long bno) {
		return new PageDTO(cri, r_mapper.getTotal(bno), r_mapper.getListWidhPaging(cri, bno));
	}

	@Transactional
	@Override
	public int register(FreeBoardReplyVO f_vo) {
		f_mapper.updateReplyCnt(f_vo.getBno(), 1);
		return r_mapper.insert(f_vo);
	}

	@Override
	public FreeBoardReplyVO get(Long rno) {
		return r_mapper.read(rno);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		f_mapper.updateReplyCnt(r_mapper.read(rno).getBno(), -1);
		return r_mapper.delete(rno);
	}

	@Override
	public int modify(FreeBoardReplyVO f_vo) {
		return r_mapper.update(f_vo);
	}
	
}

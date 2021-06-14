package com.campfire.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.freeBoard.FreeBoardReplyVO;
import com.campfire.domain.guideBoard.GuideBoardReplyVO;
import com.campfire.mapper.GuideBoardMapper;
import com.campfire.mapper.GuideBoardReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class GuideBoardReplyServiceImple implements GuideBoardReplyService{
	private GuideBoardReplyMapper r_mapper;
	private GuideBoardMapper g_mapper;
	
	@Override
	public PageDTO getList(Criteria cri, Long bno) {
		return new PageDTO(r_mapper.getListWidhPaging(cri, bno), r_mapper.getTotal(bno), cri);
	}
	
	@Transactional
	@Override
	public int register(GuideBoardReplyVO g_vo) {
		g_mapper.updateReplyCnt(g_vo.getBno(), 1);
		return r_mapper.insert(g_vo);
	}

	@Override
	public GuideBoardReplyVO get(Long rno) {
		return r_mapper.read(rno);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		g_mapper.updateReplyCnt(r_mapper.read(rno).getBno(), -1);
		return r_mapper.delete(rno);
	}

	@Override
	public int modify(GuideBoardReplyVO g_vo) {
		return r_mapper.update(g_vo);
	}
	
}

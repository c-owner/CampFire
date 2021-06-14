package com.campfire.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.tipBoard.TipBoardReplyVO;
import com.campfire.mapper.TipBoardMapper;
import com.campfire.mapper.TipBoardReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class TipBoardReplyServiceImpl implements TipBoardReplyService{
	private TipBoardReplyMapper r_mapper;
	private TipBoardMapper f_mapper;
	
	@Override
	public PageDTO getList(Criteria cri, Long bno) {
		return new PageDTO(r_mapper.getListWidhPaging(cri, bno), cri, r_mapper.getTotal(bno));
	}

	@Transactional
	@Override
	public int register(TipBoardReplyVO t_vo) {
		f_mapper.updateReplyCnt(t_vo.getBno(), 1);
		return r_mapper.insert(t_vo);
	}

	@Override
	public TipBoardReplyVO get(Long rno) {
		return r_mapper.read(rno);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		f_mapper.updateReplyCnt(r_mapper.read(rno).getBno(), -1);
		return r_mapper.delete(rno);
	}

	@Override
	public int modify(TipBoardReplyVO t_vo) {
		return r_mapper.update(t_vo);
	}
}

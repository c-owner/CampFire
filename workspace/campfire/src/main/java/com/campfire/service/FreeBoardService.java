package com.campfire.service;

import java.util.List;

import com.campfire.domain.Criteria;
import com.campfire.domain.freeBoard.FreeBoardAttachVO;
import com.campfire.domain.freeBoard.FreeBoardVO;

public interface FreeBoardService {
	public List<FreeBoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public void register(FreeBoardVO f_vo);
	public FreeBoardVO get(Long bno);
	public boolean remove(Long bno);
	public boolean modify(FreeBoardVO f_vo);
	public List<FreeBoardAttachVO> getAttachList(Long bno);
}

package com.campfire.service;

import java.util.List;

import com.campfire.domain.Criteria;
import com.campfire.domain.freeBoard.FreeBoardVO;
import com.campfire.domain.tipBoard.TipBoardAttachVO;
import com.campfire.domain.tipBoard.TipBoardVO;

public interface TipBoardService {
	public List<TipBoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public void register(TipBoardVO t_vo);
	public TipBoardVO get(Long bno);
	public boolean remove(Long bno);
	public boolean modify(TipBoardVO t_vo);
	public List<TipBoardAttachVO> getAttachList(Long bno);
}

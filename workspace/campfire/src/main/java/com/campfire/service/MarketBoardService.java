package com.campfire.service;

import java.util.List;

import com.campfire.domain.Criteria;
import com.campfire.domain.marketBoard.MarketBoardVO;

public interface MarketBoardService {
	public List<MarketBoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public void register(MarketBoardVO vo);
	public MarketBoardVO get(Long bno);
	public boolean remove(Long bno);
	public boolean modify(MarketBoardVO vo);
	public List<MarketBoardVO> getAttachList(Long bno);
}

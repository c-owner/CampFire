package com.campfire.service;

import java.util.List;

import com.campfire.domain.Criteria;
import com.campfire.domain.marketBoard.MarketBoardAttachVO;
import com.campfire.domain.marketBoard.MarketBoardVO;

public interface MarketBoardService {
	public List<MarketBoardVO> getList(Criteria cri, String marketKeyword);
	public int getTotal(Criteria cri);
	public void register(MarketBoardVO vo);
	public MarketBoardVO get(Long bno);
	public boolean remove(Long bno);
	public boolean modify(MarketBoardVO vo);
	public List<MarketBoardAttachVO> getAttachList(Long bno);
	public List<MarketBoardAttachVO> thumbnail(Long bno);
	public int categoryTotal(String marketKeyword);
}

package com.campfire.mapper;

import java.util.List;

import com.campfire.domain.marketBoard.MarketBoardAttachVO;

public interface MarketBoardAttachMapper {
	public List<MarketBoardAttachVO> findByBno(Long bno);
	public List<MarketBoardAttachVO> getOldFiles();
	public void insert(MarketBoardAttachVO attach);
	public void delete(String uuid);
	public void deleteAll(Long bno);
	public List<MarketBoardAttachVO> thumbnail(Long bno);
}

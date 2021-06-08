package com.campfire.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campfire.domain.Criteria;
import com.campfire.domain.marketBoard.MarketBoardVO;

public interface MarketBoardMapper {
	public List<MarketBoardVO> selectBoardList(Criteria cri);
	public int getTotal();
	public int getTotal(Criteria cri);
	public void insertBoard(MarketBoardVO board);
	public int updateBoard(MarketBoardVO board);
	public int deleteBoard(Long bno);
	public int updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
}

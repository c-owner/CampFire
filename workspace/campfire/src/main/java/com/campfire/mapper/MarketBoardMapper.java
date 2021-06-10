package com.campfire.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campfire.domain.Criteria;
import com.campfire.domain.marketBoard.MarketBoardVO;

public interface MarketBoardMapper {
	public List<MarketBoardVO> getListWithPaging(HashMap<String, Object> map);
	public int getTotal(Criteria cri);
	public MarketBoardVO read(Long bno);
	public void insertBoard(MarketBoardVO board);
	public int updateBoard(MarketBoardVO board);
	public int deleteBoard(Long bno);
	public int updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
}

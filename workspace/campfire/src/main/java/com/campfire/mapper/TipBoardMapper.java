package com.campfire.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campfire.domain.Criteria;
import com.campfire.domain.freeBoard.FreeBoardVO;
import com.campfire.domain.tipBoard.TipBoardVO;

public interface TipBoardMapper {
	public List<TipBoardVO> getListWithPaging(Criteria cri);
	public int getTotal(Criteria cri);
	public void insert(TipBoardVO t_board);
	public TipBoardVO read(Long bno);
	public int delete(Long bno);
	public int update(TipBoardVO t_board);
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	public int readCntUp(Long bno);
}

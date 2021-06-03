package com.campfire.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campfire.domain.Criteria;
import com.campfire.domain.freeBoard.FreeBoardVO;


public interface FreeBoardMapper {
	public List<FreeBoardVO> getListWithPaging(Criteria cri);
	public int getTotal(Criteria cri);
	public void insert(FreeBoardVO f_board);
	public FreeBoardVO read(Long bno);
	public int delete(Long bno);
	public int update(FreeBoardVO f_board);
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
}

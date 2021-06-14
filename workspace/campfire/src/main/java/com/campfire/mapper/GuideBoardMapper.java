package com.campfire.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campfire.domain.Criteria;
import com.campfire.domain.guideBoard.GuideBoardVO;

public interface GuideBoardMapper {
	public List<GuideBoardVO> getListWithPaging(Criteria cri);
	public int getTotal(Criteria cri);
	public void insert(GuideBoardVO g_board);
	public GuideBoardVO read(Long bno);
	public int delete(Long bno);
	public int update(GuideBoardVO g_board);
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	public int readCntUp(Long bno);
}

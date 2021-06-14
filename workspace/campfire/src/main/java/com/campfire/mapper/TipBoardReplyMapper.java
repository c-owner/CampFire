package com.campfire.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campfire.domain.Criteria;
import com.campfire.domain.tipBoard.TipBoardReplyVO;

public interface TipBoardReplyMapper {
	public List<TipBoardReplyVO> getListWidhPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	public int getTotal(Long bno);
	public int insert(TipBoardReplyVO t_vo);
	public TipBoardReplyVO read(Long rno);
	public int delete(Long rno);
	public int update(TipBoardReplyVO t_vo);
}

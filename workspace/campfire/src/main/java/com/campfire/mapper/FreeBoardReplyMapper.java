package com.campfire.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campfire.domain.Criteria;
import com.campfire.domain.freeBoard.FreeBoardReplyVO;

public interface FreeBoardReplyMapper {
	public List<FreeBoardReplyVO> getListWidhPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	public int getTotal(Long bno);
	public int insert(FreeBoardReplyVO f_vo);
	public FreeBoardReplyVO read(Long rno);
	public int delete(Long rno);
	public int update(FreeBoardReplyVO f_vo);
}

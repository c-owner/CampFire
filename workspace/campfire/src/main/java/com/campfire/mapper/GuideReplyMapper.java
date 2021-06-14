package com.campfire.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campfire.domain.Criteria;
import com.campfire.domain.guideBoard.GuideBoardReplyVO;

public interface GuideReplyMapper {
	public List<GuideBoardReplyVO> getListWidhPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	public int getTotal(Long bno);
	public int insert(GuideBoardReplyVO g_vo);
	public GuideBoardReplyVO read(Long rno);
	public int delete(Long rno);
	public int update(GuideBoardReplyVO g_vo);
}

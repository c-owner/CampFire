package com.campfire.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campfire.domain.Criteria;
import com.campfire.domain.reviewBoard.ReviewReplyVO;

public interface ReviewReplyMapper {
	public int insertReply(ReviewReplyVO reply);
	public ReviewReplyVO selectReply(Long rno);
	public int updateReply(ReviewReplyVO reply);
	public int deleteReply(Long rno);
	
	public List<ReviewReplyVO> selectReplyList(@Param("cri") Criteria cri, @Param("bno") Long bno);
	
	public int getTotal(Long bno);
}

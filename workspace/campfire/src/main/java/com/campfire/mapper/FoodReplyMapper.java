package com.campfire.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campfire.domain.Criteria;
import com.campfire.domain.foodBoard.FoodBoardReplyVO;

public interface FoodReplyMapper {
	public int insertReply(FoodBoardReplyVO reply);
	public FoodBoardReplyVO selectReply(Long rno);
	public int updateReply(FoodBoardReplyVO reply);
	public int deleteReply(Long rno);
	public int getTotal(Long bno);	
	public List<FoodBoardReplyVO> selectReplyList(@Param("cri") Criteria cri, @Param("bno") Long bno);
	
}

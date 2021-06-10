package com.campfire.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campfire.domain.Criteria;
import com.campfire.domain.marketBoard.MarketReplyVO;

public interface MarketReplyMapper {
	public int insertReply(MarketReplyVO reply);
	public MarketReplyVO selectReply(Long rno);
	public int updateReply(MarketReplyVO reply);
	public int deleteReply(Long rno);
	public List<MarketReplyVO> selectReplyList(@Param("cri") Criteria cri, @Param("bno") Long bno);
	public int getTotal(Long bno);
}

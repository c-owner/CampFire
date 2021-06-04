package com.campfire.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campfire.domain.Criteria;
import com.campfire.domain.ReviewBoardVO;

public interface ReviewBoardMapper {
	public List<ReviewBoardVO> selectBoardList(Criteria cri);
	public int getTotal();
	public int getTotal(Criteria cri);
	public ReviewBoardVO selectBoard(Long bno);
	public void insertBoard(ReviewBoardVO board);
	public int updateBoard(ReviewBoardVO board);
	public int deleteBoard(Long bno);
	public int updateReadCnt(Long bno);
	public int updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	public int updateLikeCnt(@Param("bno") Long bno, @Param("amount") int amount);
	public int insertLike(@Param("bno") Long bno, @Param("userId") String userId);
	public int checkLike(@Param("bno") Long bno, @Param("userId") String userId);
	public int deleteLike(@Param("bno") Long bno, @Param("userId") String userId);
	public int minusLikeCnt(Long bno);
	public int plusLikeCnt(Long bno);
	
	
}

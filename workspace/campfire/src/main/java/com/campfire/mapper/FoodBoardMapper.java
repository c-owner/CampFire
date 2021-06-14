package com.campfire.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campfire.domain.Criteria;
import com.campfire.domain.foodBoard.FoodBoardVO;

public interface FoodBoardMapper {
	public List<FoodBoardVO> selectBoardList(Criteria cri);
	public int getTotal();
	public int getTotal(Criteria cri);
	public FoodBoardVO selectBoard(Long bno);
	public void insertBoard(FoodBoardVO fvo);
	public int updateBoard(FoodBoardVO fvo);
	public int deleteBoard(Long bno);
	public int updateReadCnt(Long bno);
	public int updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	public int updateLikeCnt(@Param("bno") Long bno, @Param("amount") int amount);
	public int insertLike(@Param("bno") Long bno, @Param("userId") String userId);
	public int checkLike(@Param("bno") Long bno, @Param("userId") String userId);
	public int deleteLike(@Param("bno") Long bno, @Param("userId") String userId);
	public int minusLikeCnt(Long bno);
	public int plusLikeCnt(Long bno);
	public int getLikeCnt(Long bno);
}

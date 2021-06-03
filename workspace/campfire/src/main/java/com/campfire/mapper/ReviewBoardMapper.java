package com.campfire.mapper;

import java.util.List;

import com.campfire.domain.ReviewBoardVO;

public interface ReviewBoardMapper {
	public List<ReviewBoardVO> selectBoardList(Criteria cri);
	public int getTotal();
	public ReviewBoardVO selectBoard(Long bno);
	public void insertBoard(ReviewBoardVO board);
	public int updateBoard(ReviewBoardVO board);
	public int deleteBoard(Long bno);
	
}

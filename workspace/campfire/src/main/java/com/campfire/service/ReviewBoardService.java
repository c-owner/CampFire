package com.campfire.service;

import java.util.List;

import com.campfire.domain.Criteria;
import com.campfire.domain.ReviewBoardVO;

public interface ReviewBoardService {
	public void register(ReviewBoardVO board);
	public ReviewBoardVO view(Long bno);
	public boolean modify(ReviewBoardVO board);
	public boolean remove(Long bno);
	public List<ReviewBoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public int getTotal();
	public boolean insertLike(Long bno, String userId);
	public boolean deleteLike(Long bno, String userId);
	public boolean checkLike(Long bno, String userId);
	public int getLikeCnt(Long bno);
}
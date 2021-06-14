package com.campfire.service;

import java.util.List;

import com.campfire.domain.Criteria;
import com.campfire.domain.foodBoard.FoodBoardAttachVO;
import com.campfire.domain.foodBoard.FoodBoardVO;

public interface FoodBoardService {
	public void register(FoodBoardVO fvo);
	public FoodBoardVO get(Long bno);
	public boolean modify(FoodBoardVO fvo);
	public boolean remove(Long bno);
	public List<FoodBoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public int getTotal();
	public boolean insertLike(Long bno, String userId);
	public boolean deleteLike(Long bno, String userId);
	public boolean checkLike(Long bno, String userId);
	public int getLikeCnt(Long bno);
	
	public List<FoodBoardAttachVO> getAttachList(Long bno);
}

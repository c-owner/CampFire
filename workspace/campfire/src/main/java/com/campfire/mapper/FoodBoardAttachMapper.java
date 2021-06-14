package com.campfire.mapper;

import java.util.List;

import com.campfire.domain.foodBoard.FoodBoardAttachVO;

public interface FoodBoardAttachMapper {
	public List<FoodBoardAttachVO> findByBno(Long bno);
	public void insert(FoodBoardAttachVO attach);
	public void delete(String uuid);
	public void deleteAll(Long bno);
}
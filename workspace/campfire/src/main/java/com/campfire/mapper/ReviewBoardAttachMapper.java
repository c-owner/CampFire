package com.campfire.mapper;

import java.util.List;

import com.campfire.domain.reviewBoard.ReviewBoardAttachVO;

public interface ReviewBoardAttachMapper {

	public List<ReviewBoardAttachVO> findByBno(Long bno);
	public List<ReviewBoardAttachVO> getOldFiles();
	public void insert(ReviewBoardAttachVO attach);
	public void delete(String uuid);
	public void deleteAll(Long bno);
}

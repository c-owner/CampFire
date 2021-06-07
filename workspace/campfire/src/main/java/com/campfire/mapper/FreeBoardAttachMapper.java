package com.campfire.mapper;

import java.util.List;

import com.campfire.domain.freeBoard.FreeBoardAttachVO;

public interface FreeBoardAttachMapper {
	public List<FreeBoardAttachVO> findByBno(Long bno);
	//일정 기간마다 파일 자동 삭제
	public List<FreeBoardAttachVO> getOldFiles();
	public void insert(FreeBoardAttachVO f_vo);
	public void delete(String uuid);
	public void deleteAll(Long bno);
}

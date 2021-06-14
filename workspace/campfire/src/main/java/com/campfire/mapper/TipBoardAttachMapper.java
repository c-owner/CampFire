package com.campfire.mapper;

import java.util.List;

import com.campfire.domain.tipBoard.TipBoardAttachVO;


public interface TipBoardAttachMapper {
	public List<TipBoardAttachVO> findByBno(Long bno);
	//일정 기간마다 파일 자동 삭제
	public List<TipBoardAttachVO> getOldFiles();
	public void insert(TipBoardAttachVO t_vo);
	public void delete(String uuid);
	public void deleteAll(Long bno);
}

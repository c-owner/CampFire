package com.campfire.mapper;

import java.util.List;

import com.campfire.domain.guideBoard.GuideBoardAttachVO;

public interface GuideBoardAttachMapper {
	public List<GuideBoardAttachVO> findByBno(Long bno);
	//일정 기간마다 파일 자동 삭제
	public List<GuideBoardAttachVO> getOldFiles();
	public void insert(GuideBoardAttachVO g_vo);
	public void delete(String uuid);
	public void deleteAll(Long bno);
}

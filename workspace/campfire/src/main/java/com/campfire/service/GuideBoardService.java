package com.campfire.service;

import java.util.List;

import com.campfire.domain.Criteria;
import com.campfire.domain.guideBoard.GuideBoardAttachVO;
import com.campfire.domain.guideBoard.GuideBoardVO;

public interface GuideBoardService {
	public List<GuideBoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public void register(GuideBoardVO g_vo);
	public GuideBoardVO get(Long bno);
	public boolean remove(Long bno);
	public boolean modify(GuideBoardVO g_vo);
	public List<GuideBoardAttachVO> getAttachList(Long bno);
}

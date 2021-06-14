package com.campfire.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campfire.domain.Criteria;
import com.campfire.domain.guideBoard.GuideBoardAttachVO;
import com.campfire.domain.guideBoard.GuideBoardVO;
import com.campfire.mapper.GuideBoardAttachMapper;
import com.campfire.mapper.GuideBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class GuideBoardServiceImple implements GuideBoardService {
	private GuideBoardMapper mapper;
	private GuideBoardAttachMapper a_mapper;
	
	@Override
	public List<GuideBoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

	@Override
	public void register(GuideBoardVO g_vo) {
		mapper.insert(g_vo);
		List<GuideBoardAttachVO> attachList = g_vo.getAttachList();
		if(attachList == null || attachList.size() <= 0) {return;}
		
		attachList.forEach(vo -> {
			vo.setBno(g_vo.getBno());
			a_mapper.insert(vo);
		});
	}

	@Transactional
	@Override
	public GuideBoardVO get(Long bno) {
		mapper.readCntUp(bno);
		return mapper.read(bno);
	}

	@Override
	public boolean remove(Long bno) {
		a_mapper.deleteAll(bno);
		return mapper.delete(bno) == 1;
	}

	@Transactional
	@Override
	public boolean modify(GuideBoardVO g_vo) {
		a_mapper.deleteAll(g_vo.getBno());
		boolean modifyResult = mapper.update(g_vo) == 1;
		
		if(modifyResult && g_vo.getAttachList() != null) {
			if(g_vo.getAttachList().size() != 0) {
				g_vo.getAttachList().forEach(vo -> {
					vo.setBno(g_vo.getBno());
					a_mapper.insert(vo);
				});
			}
		}
		return modifyResult;
	}

	@Override
	public List<GuideBoardAttachVO> getAttachList(Long bno) {
		return a_mapper.findByBno(bno);
	}
	
}

package com.campfire.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campfire.domain.Criteria;
import com.campfire.domain.tipBoard.TipBoardAttachVO;
import com.campfire.domain.tipBoard.TipBoardVO;
import com.campfire.mapper.FreeBoardAttachMapper;
import com.campfire.mapper.FreeBoardMapper;
import com.campfire.mapper.TipBoardAttachMapper;
import com.campfire.mapper.TipBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class TipBoardServiceImpl implements TipBoardService{
	private TipBoardMapper mapper;
	private TipBoardAttachMapper a_mapper;

	@Override
	public List<TipBoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

	//@Transactional
	@Override
	public void register(TipBoardVO t_vo) {
		mapper.insert(t_vo);
		List<TipBoardAttachVO> attachList = t_vo.getAttachList();
		if(attachList == null || attachList.size() <= 0) {return;}
		
		attachList.forEach(vo -> {
			vo.setBno(t_vo.getBno());
			a_mapper.insert(vo);
		});
	}

	@Transactional
	@Override
	public TipBoardVO get(Long bno) {
		mapper.readCntUp(bno);
		return mapper.read(bno);
	}

	//@Transactional
	@Override
	public boolean remove(Long bno) {
		a_mapper.deleteAll(bno);
		return mapper.delete(bno) == 1;
	}

	@Transactional
	@Override
	public boolean modify(TipBoardVO t_vo) {
		a_mapper.deleteAll(t_vo.getBno());
		boolean modifyResult = mapper.update(t_vo) == 1;
		
		if(modifyResult && t_vo.getAttachList() != null) {
			if(t_vo.getAttachList().size() != 0) {
				t_vo.getAttachList().forEach(vo -> {
					vo.setBno(t_vo.getBno());
					a_mapper.insert(vo);
				});
			}
		}
		return modifyResult;
	}

	@Override
	public List<TipBoardAttachVO> getAttachList(Long bno) {
		return a_mapper.findByBno(bno);
	}
}

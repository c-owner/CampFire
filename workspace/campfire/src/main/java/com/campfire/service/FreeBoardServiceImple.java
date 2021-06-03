package com.campfire.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campfire.domain.Criteria;
import com.campfire.domain.freeBoard.FreeBoardAttachVO;
import com.campfire.domain.freeBoard.FreeBoardVO;
import com.campfire.mapper.FreeBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class FreeBoardServiceImple implements FreeBoardService{
	private FreeBoardMapper mapper;
	//private FreeBoardAttachMapper a_mapper;

	@Override
	public List<FreeBoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

	//@Transactional
	@Override
	public void register(FreeBoardVO f_vo) {
		mapper.insert(f_vo);
		List<FreeBoardAttachVO> attachList = f_vo.getAttachList();
		if(attachList == null || attachList.size() <= 0) {return;}
		
		attachList.forEach(vo -> {
			vo.setBno(f_vo.getBno());
			//a_mapper.insert(attach);
		});
	}

	@Override
	public FreeBoardVO get(Long bno) {
		return mapper.read(bno);
	}

	//@Transactional
	@Override
	public boolean remove(Long bno) {
		//a_mapper.deleteAll(bno);
		return mapper.delete(bno) == 1;
	}

	@Transactional
	@Override
	public boolean modify(FreeBoardVO f_vo) {
		//a_mapper.deleteAll(f_vo.getBno());
		boolean modifyResult = mapper.update(f_vo) == 1;
		
		if(modifyResult && f_vo.getAttachList() != null) {
			if(f_vo.getAttachList().size() != 0) {
				f_vo.getAttachList().forEach(vo -> {
					vo.setBno(f_vo.getBno());
					//a_mapper.insert(attach);
				});
			}
		}
		return modifyResult;
	}

	@Override
	public List<FreeBoardAttachVO> getAttachList(Long bno) {
		//return a_mapper.findByBno(bno);
		return null;
	}
}

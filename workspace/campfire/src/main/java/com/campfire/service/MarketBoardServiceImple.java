package com.campfire.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campfire.domain.Criteria;
import com.campfire.domain.marketBoard.MarketBoardAttachVO;
import com.campfire.domain.marketBoard.MarketBoardVO;
import com.campfire.mapper.MarketBoardAttachMapper;
import com.campfire.mapper.MarketBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MarketBoardServiceImple implements MarketBoardService {
	private MarketBoardMapper mapper;
	private MarketBoardAttachMapper Amapper;

	@Transactional
	@Override
	public List<MarketBoardVO> getList(Criteria cri, String marketKeyword) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("pageNum", cri.getPageNum());
		map.put("amount", cri.getAmount());
		map.put("marketKeyword", marketKeyword);
		map.put("type", cri.getType());
		map.put("keyword", cri.getKeyword());
		map.put("typeList", cri.getTypeList());
		return 	mapper.getListWithPaging(map);  
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}
	
	@Override
	public int categoryTotal(Criteria cri, String marketKeyword) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("pageNum", cri.getPageNum());
		map.put("amount", cri.getAmount());
		map.put("marketKeyword", marketKeyword);
		map.put("type", cri.getType());
		map.put("keyword", cri.getKeyword());
		map.put("typeList", cri.getTypeList());
		return mapper.categoryTotal(map);
	}

	@Override
	public void register(MarketBoardVO m_vo) {
		mapper.insertBoard(m_vo);
		List<MarketBoardAttachVO> attachList = m_vo.getAttachList();
		if(attachList == null || attachList.size() <= 0) {return;}
		
		for(int i=0; i<attachList.size(); i++) {
			if(attachList.get(i).getUuid() == null) {continue;}
			attachList.get(i).setBno(m_vo.getBno());
			Amapper.insert(attachList.get(i));
		}
	}
	
	@Transactional
	@Override
	public MarketBoardVO get(Long bno) {
		mapper.read(bno);
		return mapper.read(bno);
	}

	@Override
	public boolean remove(Long bno) {
		Amapper.deleteAll(bno);
		return mapper.deleteBoard(bno) == 1;
	}

	@Transactional
	@Override
	public boolean modify(MarketBoardVO vo) {
		Amapper.deleteAll(vo.getBno());
		boolean modifyResult = mapper.updateBoard(vo) == 1;
		
		if(modifyResult && vo.getAttachList() != null) {
			if(vo.getAttachList().size() != 0) {
				for(int i=0; i<vo.getAttachList().size(); i++) {
					if(vo.getAttachList().get(i).getUuid() == null) {continue;}
					vo.getAttachList().get(i).setBno(vo.getBno());
					Amapper.insert(vo.getAttachList().get(i));
				}
			}
		}
		
		return modifyResult;
	}

	@Override
	public List<MarketBoardAttachVO> getAttachList(Long bno) {
		return Amapper.findByBno(bno);
	}

	//썸네일
	public List<MarketBoardAttachVO> thumbnail(Long bno){
		return Amapper.thumbnail(bno);
	}

}

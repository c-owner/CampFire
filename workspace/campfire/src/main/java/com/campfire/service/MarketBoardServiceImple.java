package com.campfire.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.campfire.domain.Criteria;
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

	@Override
	public List<MarketBoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

	@Override
	public void register(MarketBoardVO vo) {
		
	}

	@Override
	public MarketBoardVO get(Long bno) {
		return null;
	}

	@Override
	public boolean remove(Long bno) {
		return false;
	}

	@Override
	public boolean modify(MarketBoardVO vo) {
		return false;
	}

	@Override
	public List<MarketBoardVO> getAttachList(Long bno) {
		return null;
	}

}

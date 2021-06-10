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

	@Override
	public List<MarketBoardVO> getList(Criteria cri, String marketKeyword) {
		System.out.println(cri.getPageNum());
		System.out.println(cri.getAmount());
		System.err.println(marketKeyword);
		HashMap<String, Object> map = new HashMap<>();
		map.put("pageNum", cri.getPageNum());
		map.put("amount", cri.getAmount());
		map.put("marketKeyword", marketKeyword);
		return mapper.getListWithPaging(map);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

	@Override
	public void register(MarketBoardVO vo) {
		mapper.insertBoard(vo);
		List<MarketBoardAttachVO> attachList = vo.getAttachList();
		if(attachList == null || attachList.size() <= 0) {return;}
		
		attachList.forEach(mvo -> {
			mvo.setBno(vo.getBno());
			Amapper.insert(mvo);
		});
		
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
				vo.getAttachList().forEach(mvo -> {
					mvo.setBno(vo.getBno());
					Amapper.insert(mvo);
				});
			}
		}
		
		return modifyResult;
	}

	@Override
	public List<MarketBoardAttachVO> getAttachList(Long bno) {
		return Amapper.findByBno(bno);
	}

}

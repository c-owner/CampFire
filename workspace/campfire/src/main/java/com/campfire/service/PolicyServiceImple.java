package com.campfire.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.campfire.domain.Criteria;
import com.campfire.domain.PolicyVO;
import com.campfire.mapper.PolicyMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PolicyServiceImple implements PolicyService {

	private PolicyMapper mapper;
	
	@Override
	public List<PolicyVO> getList(Criteria cri, String tab) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("pageNum", cri.getPageNum());
		map.put("amount", cri.getAmount());
		map.put("tab", tab);
		map.put("keyword", cri.getKeyword());
		return 	mapper.selectBoardList(map);  
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}
	
	@Override
	public int categoryTotal(Criteria cri, String tab) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("pageNum", cri.getPageNum());
		map.put("amount", cri.getAmount());
		map.put("tab", tab);
		map.put("keyword", cri.getKeyword());
		return mapper.categoryTotal(map);
	}

	@Override
	public void register(PolicyVO vo) {
		mapper.insertBoard(vo);
	}
	
	@Override
	public PolicyVO view(Long bno) {
		return mapper.read(bno);
	}

	@Override
	public boolean remove(Long bno) {
		return mapper.deleteBoard(bno) == 1;
	}

	@Override
	public boolean modify(PolicyVO vo) {
		boolean modifyResult = mapper.updateBoard(vo) == 1;
		return modifyResult;
	}

}

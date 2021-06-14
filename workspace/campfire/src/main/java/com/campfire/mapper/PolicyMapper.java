package com.campfire.mapper;

import java.util.HashMap;
import java.util.List;

import com.campfire.domain.Criteria;
import com.campfire.domain.PolicyVO;

public interface PolicyMapper {
	
	public List<PolicyVO> getListWithPaging(HashMap<String, Object> map);
	public int getTotal(Criteria cri);
	public PolicyVO read(Long bno);
	public void insertBoard(PolicyVO board);
	public int updateBoard(PolicyVO board);
	public int deleteBoard(Long bno);
	public int categoryTotal(HashMap<String, Object> map);
}

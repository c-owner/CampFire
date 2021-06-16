package com.campfire.service;

import java.util.List;

import com.campfire.domain.Criteria;
import com.campfire.domain.PolicyVO;

public interface PolicyService {
	public List<PolicyVO> getList(Criteria cri, String policyKeyword);
	public int getTotal(Criteria cri);
	public void register(PolicyVO vo);
	public PolicyVO view(Long bno);
	public boolean remove(Long bno);
	public boolean modify(PolicyVO vo);
	public int categoryTotal(Criteria cri, String policyKeyword);
}

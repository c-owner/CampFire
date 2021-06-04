package com.campfire.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campfire.domain.Criteria;
import com.campfire.domain.ReviewBoardVO;
import com.campfire.mapper.ReviewBoardMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReviewBoardServiceImple implements ReviewBoardService {

	private ReviewBoardMapper mapper;
	
	@Override
	public void register(ReviewBoardVO board) {
		mapper.insertBoard(board);
	}

	@Override
	public ReviewBoardVO view(Long bno) {
		mapper.updateReadCnt(bno);
		return mapper.selectBoard(bno);
	}

	@Override
	public boolean modify(ReviewBoardVO board) {
		return mapper.updateBoard(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		return mapper.deleteBoard(bno) == 1;
	}

	@Override
	public List<ReviewBoardVO> getList(Criteria cri) {
		return mapper.selectBoardList(cri);
	}

	@Override
	public int getTotal() {
		return mapper.getTotal();
	}
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

	@Override
	@Transactional
	public boolean insertLike(Long bno, String userId) {
		if(mapper.plusLikeCnt(bno) == 1 && mapper.insertLike(bno, userId) == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean checkLike(Long bno, String userId) {
		return mapper.checkLike(bno, userId) != 0;
	}

	@Override
	public boolean deleteLike(Long bno, String userId) {
		if(mapper.minusLikeCnt(bno) == 1 && mapper.deleteLike(bno, userId) == 1) {
			return true;
		}
		return false;
	}
	

}

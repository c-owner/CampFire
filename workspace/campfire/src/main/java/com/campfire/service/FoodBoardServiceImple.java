package com.campfire.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campfire.domain.Criteria;
import com.campfire.domain.foodBoard.FoodBoardAttachVO;
import com.campfire.domain.foodBoard.FoodBoardVO;
import com.campfire.mapper.FoodBoardAttachMapper;
import com.campfire.mapper.FoodBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class FoodBoardServiceImple implements FoodBoardService {
	private FoodBoardMapper mapper;
	private FoodBoardAttachMapper Amapper;

	@Override
	public void register(FoodBoardVO fvo) {
		mapper.insertBoard(fvo);
		List<FoodBoardAttachVO> attachList = fvo.getAttachList();
		if(attachList == null || attachList.size() <= 0) {return;}
		
		attachList.forEach(fbvo -> {
			fbvo.setBno(fvo.getBno());
			Amapper.insert(fbvo);
		});

	}

	@Transactional
	@Override
	public FoodBoardVO get(Long bno) {
		mapper.updateReadCnt(bno);
		return mapper.selectBoard(bno);
	}

	@Transactional
	@Override
	public boolean modify(FoodBoardVO fvo) {
		Amapper.deleteAll(fvo.getBno());
		boolean modifyResult = mapper.updateBoard(fvo) == 1;
		
		if(modifyResult && fvo.getAttachList() != null) {
			if(fvo.getAttachList().size() != 0) {
				fvo.getAttachList().forEach(fbvo -> {
					fbvo.setBno(fvo.getBno());
					Amapper.insert(fbvo);
				});
			}
		}
		
		return false;
	}

	@Override
	public boolean remove(Long bno) {
		Amapper.deleteAll(bno);
		return mapper.deleteBoard(bno) == 1;
	}

	@Override
	public List<FoodBoardVO> getList(Criteria cri) {
		return mapper.selectBoardList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

	@Override
	public int getTotal() {
		return mapper.getTotal();
	}

	@Transactional
	@Override
	public boolean insertLike(Long bno, String userId) {
		if(mapper.plusLikeCnt(bno) == 1 && mapper.insertLike(bno, userId) == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteLike(Long bno, String userId) {
		if(mapper.minusLikeCnt(bno) == 1 && mapper.deleteLike(bno, userId) == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean checkLike(Long bno, String userId) {
		return mapper.checkLike(bno, userId) != 0;
	}

	@Override
	public int getLikeCnt(Long bno) {
		return mapper.getLikeCnt(bno);
	}

	@Override
	public List<FoodBoardAttachVO> getAttachList(Long bno) {
		return Amapper.findByBno(bno);
	}

}

package com.campfire.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campfire.domain.Criteria;
import com.campfire.domain.reviewBoard.ReviewBoardAttachVO;
import com.campfire.domain.reviewBoard.ReviewBoardVO;
import com.campfire.mapper.ReviewBoardAttachMapper;
import com.campfire.mapper.ReviewBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReviewBoardServiceImple implements ReviewBoardService {

	private ReviewBoardMapper mapper;
	private ReviewBoardAttachMapper attach;
	
	@Transactional
	@Override
	public void register(ReviewBoardVO board) {
		
		int cntStar = Integer.parseInt(board.getStar()); 
		String star = "★";
		if(cntStar == 1 ) {
			star = "★";
		} else if (cntStar == 2 ) {
			star = "★★";
		} else if (cntStar == 3 ) {
			star = "★★★";
		} else if (cntStar == 4 ) {
			star = "★★★★";
		} else if (cntStar == 5 ) {
			star = "★★★★★";
		} else {
			star = "평점없음";
		}
		board.setStar(star);
		log.info("CATEGORIES " + board.getCategories());
		log.info("thumb::::" + board.getThumb());
		if(board.getThumb() == null) {
			board.setThumb("");
		}
		mapper.insertBoard(board);
		List<ReviewBoardAttachVO> attachList = board.getAttachList();
		if(attachList == null || attachList.size() <= 0) {
			return;
		}
		attachList.forEach(vo -> {
			vo.setBno(board.getBno());
			log.info("첨부파일 저장이 바로 밑에!!!!");
			attach.insert(vo);
		});
	}

	@Transactional
	@Override
	public ReviewBoardVO view(Long bno) {
		mapper.updateReadCnt(bno);
		return mapper.selectBoard(bno);
	}

	@Override
	public boolean modify(ReviewBoardVO board) {
		Criteria cri = new Criteria();
		cri.setKeyword("");
		cri.setType("");
		
		
		boolean result = mapper.updateBoard(board) == 1;
		
		if(result && board.getAttachList() != null ) {
			if(board.getAttachList().size() != 0 ) {
				board.getAttachList().forEach(vo -> {
					vo.setBno(board.getBno());
					attach.insert(vo);
				});
			}
		}
		return result;
	}

	@Transactional
	@Override
	public boolean remove(Long bno) {
		attach.deleteAll(bno);
		return mapper.deleteBoard(bno) == 1;
	}

	@Override
	public List<ReviewBoardVO> getList(Criteria cri) {
		log.info("===============================");
		log.info(" type : " + cri.getCategories());
		log.info("===============================");
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

	@Override
	public int getLikeCnt(Long bno) {
		log.info("service = " + bno);
		return mapper.getLikeCnt(bno);
	}
	
	@Override
	public List<ReviewBoardAttachVO> getAttachList(Long bno) {
		return attach.findByBno(bno);
	}

}

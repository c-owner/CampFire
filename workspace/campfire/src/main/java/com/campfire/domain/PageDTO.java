package com.campfire.domain;

import java.util.List;

import com.campfire.domain.foodBoard.FoodBoardReplyVO;
import com.campfire.domain.freeBoard.FreeBoardReplyVO;
import com.campfire.domain.guideBoard.GuideBoardReplyVO;
import com.campfire.domain.marketBoard.MarketReplyVO;
import com.campfire.domain.reviewBoard.ReviewReplyVO;
import com.campfire.domain.tipBoard.TipBoardReplyVO;

import lombok.Data;

@Data
public class PageDTO {
	private int startPage;
	private int endPage;
	private int realEnd;
	private int total;
	private boolean prev, next;
	private Criteria cri;
	private List<ReviewReplyVO> reviewReplyList;
	private List<FreeBoardReplyVO> freeBoardReplyList;
	private List<TipBoardReplyVO> tipBoardReplyList;
	private List<MarketReplyVO> marketReplyList;
<<<<<<< HEAD
	private List<FoodBoardReplyVO> foodReplyList;
=======
	private List<GuideBoardReplyVO> guideBoardReplyList;
>>>>>>> 40ec9bc426eabca2450d6e2635e6d1239994d15e
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / (cri.getAmount() * 1.0))) * cri.getAmount();
		this.startPage = endPage - cri.getAmount() + 1;
		
		this.realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		if(this.realEnd < this.endPage) {
			this.endPage = this.realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < this.realEnd;
	}
	
	public PageDTO(Criteria cri, int total, List<ReviewReplyVO> reviewReplyList) {
		this(cri, total);
		this.reviewReplyList = reviewReplyList;
	}
	
	public PageDTO(Criteria cri, List<FreeBoardReplyVO> freeBoardReplyList ,int total) {
		this(cri, total);
		this.freeBoardReplyList = freeBoardReplyList;
	}
	
	public PageDTO(List<TipBoardReplyVO> tipBoardReplyList ,Criteria cri, int total) {
		this(cri, total);
		this.tipBoardReplyList = tipBoardReplyList;
	}
	
	public PageDTO(int total, Criteria cri, List<MarketReplyVO> marketReplyList) {
		this(cri, total);
		this.marketReplyList = marketReplyList;
	}
<<<<<<< HEAD
	
	public PageDTO(int total, List<FoodBoardReplyVO> foodReplyList, Criteria cri) {
		this(cri, total);
		this.foodReplyList = foodReplyList;
=======
	public PageDTO(Criteria cri, List<GuideBoardReplyVO> guideBoardReplyList, String total) {
		this(cri, Integer.parseInt(total));
		this.guideBoardReplyList = guideBoardReplyList;
>>>>>>> 40ec9bc426eabca2450d6e2635e6d1239994d15e
	}
}

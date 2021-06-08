package com.campfire.domain;

import java.util.List;

import com.campfire.domain.freeBoard.FreeBoardAttachVO;
import com.campfire.domain.marketBoard.MarketBoardAttachVO;
import com.campfire.domain.reviewBoard.ReviewBoardAttachVO;

import lombok.Data;

@Data
public class AllFileDTO {
	List<FreeBoardAttachVO> f_succeedList;
	List<FreeBoardAttachVO> f_failureList;
	List<MarketBoardAttachVO> m_succeedList;
	List<MarketBoardAttachVO> m_failureList;
	List<ReviewBoardAttachVO> r_succeedList;
	List<ReviewBoardAttachVO> r_failureList;
}

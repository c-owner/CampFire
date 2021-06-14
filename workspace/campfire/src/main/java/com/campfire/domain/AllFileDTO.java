package com.campfire.domain;

import java.util.List;

import com.campfire.domain.freeBoard.FreeBoardAttachVO;
import com.campfire.domain.guideBoard.GuideBoardAttachVO;
import com.campfire.domain.marketBoard.MarketBoardAttachVO;
import com.campfire.domain.reviewBoard.ReviewBoardAttachVO;
import com.campfire.domain.tipBoard.TipBoardAttachVO;

import lombok.Data;

@Data
public class AllFileDTO {
	List<FreeBoardAttachVO> f_succeedList;
	List<FreeBoardAttachVO> f_failureList;
	List<MarketBoardAttachVO> m_succeedList;
	List<MarketBoardAttachVO> m_failureList;
	List<ReviewBoardAttachVO> r_succeedList;
	List<ReviewBoardAttachVO> r_failureList;
	List<GuideBoardAttachVO> g_succeedList;
	List<GuideBoardAttachVO> g_failureList;
	List<TipBoardAttachVO> t_succeedList;
	List<TipBoardAttachVO> t_failureList;
}

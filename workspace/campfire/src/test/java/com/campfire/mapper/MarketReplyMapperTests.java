package com.campfire.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.campfire.domain.Criteria;
import com.campfire.domain.marketBoard.MarketBoardVO;
import com.campfire.domain.marketBoard.MarketReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MarketReplyMapperTests {
	@Setter(onMethod_ = @Autowired)
	private MarketReplyMapper mapper;
	@Setter(onMethod_ = @Autowired)
	private MarketBoardMapper boardMapper;
	
	/*@Test
	public void testInsertReply() {
		MarketReplyVO vo = new MarketReplyVO();
		vo.setReply("마켓 매퍼테스트  댓글 추가");
		vo.setReplyer("test1");
		vo.setBno(44L);
		mapper.insertReply(vo);
	}*/
	
	/*@Test
	public void testUpdateReply() {
		MarketReplyVO vo = new MarketReplyVO();
		vo.setReply("마켓 수정 댓글");
		vo.setRno(21L);
		mapper.updateReply(vo);
	}*/
	
	/*@Test
	public void testDeleteReply() {
		mapper.deleteReply(21L);
	}*/
	
	/*@Test
	public void testGetTotal() {
		mapper.getTotal(44L);
	}*/
	
	
	
}

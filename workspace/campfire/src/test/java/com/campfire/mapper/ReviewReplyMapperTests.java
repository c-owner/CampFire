package com.campfire.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.campfire.domain.Criteria;
import com.campfire.domain.reviewBoard.ReviewBoardVO;
import com.campfire.domain.reviewBoard.ReviewReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewReplyMapperTests {
	@Setter(onMethod_=@Autowired)
	private ReviewReplyMapper rmapper;
	
	@Setter(onMethod_=@Autowired)
	private ReviewBoardMapper bmapper;
	
//	@Test
//	public void testInsert() {
//		List<ReviewBoardVO> boards = bmapper.selectBoardList(new Criteria(1, 5));
//		IntStream.rangeClosed(1, 10).forEach(i -> {
//			ReviewReplyVO reply = new ReviewReplyVO();
//			reply.setReply("댓글 추가여 " + i);
//			reply.setReplyer("test1");
//			
//			// 0~n : n+1로 나눈 나머지
//			reply.setBno(boards.get(i % 5).getBno());
//			rmapper.insertReply(reply);
//			log.info(reply);
//		});
//	}
	
//	@Test
//	public void testSelect() {
//		log.info(rmapper.selectReply(6L));
//	}
	
//	@Test
//	public void testUpdate() {
//		ReviewReplyVO reply = new ReviewReplyVO();
//		reply.setReply("댓글 수정이여 ");
//		reply.setRno(6L);
//		log.info(rmapper.updateReply(reply));
//	}
	
//	@Test
//	public void testDelete() {
//		log.info(rmapper.deleteReply(8L));
//	}
	
//	@Test
//	public void testGetTotal() {
//		log.info(rmapper.getTotal(404L));
//	}
	
//	@Test
//	public void testGetList() {
//		log.info(rmapper.selectReplyList(new Criteria(), 404L));
//	}
}

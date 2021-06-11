package com.campfire.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.campfire.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewReplyServiceTests {
	@Setter(onMethod_ = @Autowired)
	private ReviewReplyService service;
	
//	@Test
//	public void test() {
//		log.info(service);
//	}
	
//	@Test
//	public void testList() {
//		Criteria cri = new Criteria(1, 12);
//		log.info(service.selectReplyList(cri, 404L));
//	}
	
//	@Test
//	public void testRegister() {
//		ReviewReplyVO vo = new ReviewReplyVO();
//		vo.setBno(404L);
//		vo.setReply("이모 여기 서비스 좀 주세요");
//		vo.setReplyer("test1");
//		service.register(vo);
//	}
	
//	@Test
//	public void testModify() {
//		ReviewReplyVO vo = service.view(21L);
//		vo.setReply("이모이모");
//		service.modify(vo);
//	}
	
//	@Test
//	public void testRemove() {
//		service.remove(11L);
//	}
}

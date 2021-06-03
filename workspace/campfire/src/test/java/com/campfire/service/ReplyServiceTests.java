package com.campfire.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.campfire.domain.Criteria;
import com.campfire.domain.freeBoard.FreeBoardReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyServiceTests {
	@Setter(onMethod_ = @Autowired)
	private FreeBoardReplyService service;
	
//	@Test
//	public void test() {
//		log.info(service);
//	}
	
	@Test
	public void testList() {
		Criteria cri = new Criteria(1, 12);
		log.info(service.getList(cri, 30L));
	}
	
//	@Test
//	public void testRegister() {
//		FreeBoardReplyVO vo = new FreeBoardReplyVO();
//		vo.setBno(30L);
//		vo.setReply("이모 여기 서비스 좀 주세요");
//		vo.setReplyer("test1");
//		service.register(vo);
//	}
	
//	@Test
//	public void testModify() {
//		FreeBoardReplyVO vo = service.get(25L);
//		vo.setReply("이모이모");
//		service.modify(vo);
//	}
	
//	@Test
//	public void testRemove() {
//		service.remove(25L);
//	}
}

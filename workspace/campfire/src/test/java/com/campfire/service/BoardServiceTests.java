package com.campfire.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.campfire.domain.Criteria;
import com.campfire.domain.freeBoard.FreeBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
	@Setter(onMethod_ = @Autowired)
	private FreeBoardService service;

	@Setter(onMethod_ = @Autowired)
	private MarketBoardService s;
	
	
	@Test
	public void testList() {
		Criteria cri = new Criteria(1, 10);
		s.getList(cri, "S").forEach(log::info);
	}
	
//	@Test
//	public void test() {
//		log.info(service);
//	}
	
//	@Test
//	public void testList() {
//		Criteria c = new Criteria(1, 10);
//		service.getList(c).forEach(log::info);
//	}
	
//	@Test
//	public void testTotal() {
//		Criteria c = new Criteria(1, 10);
//		log.info(service.getTotal(c));
//	}
	
//	@Test
//	public void testRegister() {
//		FreeBoardVO f_vo = new FreeBoardVO();
//		f_vo.setTitle("손님 서비스입니다.");
//		f_vo.setContent("저쪽분께서 전달해드리라고 하셨습니다.");
//		f_vo.setWriter("test1");
//		service.register(f_vo);
//	}
	
//	@Test
//	public void testGet() {
//		log.info(service.get(33L));
//	}
	
//	@Test
//	public void testRemove() {
//		log.info(service.remove(33L));
//	}
	
//	@Test
//	public void testModify() {
//		FreeBoardVO f_vo = service.get(34L);
//		f_vo.setTitle("저쪽 신사분께서 한잔 드리고 싶다고 하셨습니다.");
//		f_vo.setContent("안먹을래용");
//		log.info(service.modify(f_vo));
//	}
	
//	@Test
//	public void testGetAttachList() {
//		service.getAttachList(34L).forEach(log::info);
//	}
}

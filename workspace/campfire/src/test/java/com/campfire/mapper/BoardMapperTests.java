package com.campfire.mapper;

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
public class BoardMapperTests {
	@Setter(onMethod_ = @Autowired)
	private FreeBoardMapper mapper;
	
//	@Test
//	public void testReadCnt() {
//		log.info("조회수 : "+mapper.readCntUp(126L));
//	}
	
	
//	@Test
//	public void testList() {
//		Criteria c = new Criteria(1, 10);
//		mapper.getListWithPaging(c).forEach(log::info);
//	}
	
//	@Test
//	public void testTotal() {
//		Criteria c = new Criteria(1, 10);
//		log.info(mapper.getTotal(c));
//	}
	
//	@Test
//	public void testUpdate() {
//		FreeBoardVO vo = mapper.read(22L);
//		vo.setTitle("멈춰!");
//		vo.setContent("가던길 멈춰!");
//		mapper.update(vo);
//	}
	
//	@Test
//	public void testInsert() {
//		FreeBoardVO vo = new FreeBoardVO();
//		vo.setBno(29L);
//		vo.setTitle("인디꼬");
//		vo.setContent("위젓꼬");
//		vo.setWriter("test1");
//		mapper.insert(vo);
//	}

//	@Test
//	public void testDelete() {
//		log.info("CNT : "+mapper.delete(31L));
//	}
	
//	@Test
//	public void testReplyPlus() {
//		mapper.updateReplyCnt(30L, 1);
//	}
}

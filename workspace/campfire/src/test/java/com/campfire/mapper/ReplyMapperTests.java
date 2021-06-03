package com.campfire.mapper;

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
public class ReplyMapperTests {
	@Setter(onMethod_ = @Autowired)
	private FreeBoardReplyMapper mapper;
	
//	@Test
//	public void test() {
//		log.info(mapper);
//	}
	
//	@Test
//	public void testInsert() {
//		FreeBoardReplyVO vo = new FreeBoardReplyVO();
//		vo.setBno(30L);
//		vo.setReply("히위고");
//		vo.setReplyer("test1");
//		mapper.insert(vo);
//	}
	
//	@Test
//	public void testList() {
//		Criteria cri = new Criteria(1, 10);
//		mapper.getListWidhPaging(cri, 30L);
//	}
	
//	@Test
//	public void testTotal() {
//		log.info(mapper.getTotal(30L));
//	}
	
//	@Test
//	public void testRead() {
//		log.info(mapper.read(24L));
//	}
	
//	@Test
//	public void testUpdate() {
//		FreeBoardReplyVO f_vo = mapper.read(24L);
//		f_vo.setReply("후워어어어어어우어");
//		log.info("CNT : "+mapper.update(f_vo));
//	}
	
//	@Test
//	public void testDelete() {
//		log.info("CNT : "+mapper.delete(24L));
//	}
}

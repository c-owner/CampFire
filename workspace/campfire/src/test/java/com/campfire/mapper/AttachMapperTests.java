package com.campfire.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.campfire.domain.freeBoard.FreeBoardAttachVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AttachMapperTests {
	@Setter(onMethod_ = @Autowired)
	private FreeBoardAttachMapper mapper;
	
//	@Test
//	public void test() {
//		log.info(mapper);
//	}
	
//	@Test
//	public void testInsert() {
//		FreeBoardAttachVO vo = new FreeBoardAttachVO();
//		vo.setUuid("TEST1");
//		vo.setUploadPath("TEST~");
//		vo.setFileName("빠일네임");
//		vo.setFileType(true);
//		vo.setBno(23L);
//		mapper.insert(vo);
//	}
	
	@Test
	public void testFind() {
		mapper.findByBno(23L).forEach(log::info);
	}
	
//	@Test
//	public void testOld() {
//		mapper.getOldFiles().forEach(log::info);
//	}
	
//	@Test
//	public void testDelete() {
//		mapper.delete("TEST");
//	}
	
//	@Test
//	public void testDeleteAll() {
//		mapper.deleteAll(23L);
//	}
}

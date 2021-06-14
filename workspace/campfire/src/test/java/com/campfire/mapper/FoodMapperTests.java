package com.campfire.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.campfire.domain.Criteria;
import com.campfire.domain.foodBoard.FoodBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class FoodMapperTests {

	@Setter(onMethod_ = @Autowired)
	private FoodBoardMapper mapper;
	
	@Test
	public void testList() {
		Criteria c = new Criteria(1,10);
		mapper.selectBoardList(c).forEach(log::info);
	}
	
	/*@Test
	public void testUpdate() {
		FoodBoardVO fvo = mapper.selectBoard(22L);
		fvo.setTitle("푸드 수정제목 매테");
		fvo.setContent("푸드 수정내용 매테");
		mapper.updateBoard(fvo);
	}*/
	
	/*@Test
	public void testSelect() {
		mapper.selectBoard(22L);
	}*/
	
	/*@Test
	public void testTotal() {
		log.info(mapper.getTotal());
	}*/
	
	/*@Test
	public void testInsert() {
		FoodBoardVO fvo = new FoodBoardVO();
		fvo.setBno(22L);
		fvo.setTitle("푸드 제목 매퍼테스트");
		fvo.setContent("푸드 내용 매퍼테스트");
		fvo.setWriter("bbbb0603");
		mapper.insertBoard(fvo);
	}*/
}

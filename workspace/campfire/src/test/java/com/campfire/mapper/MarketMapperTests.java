package com.campfire.mapper;

import java.util.HashMap;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

import com.campfire.domain.Criteria;
import com.campfire.domain.marketBoard.MarketBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MarketMapperTests {
	@Setter(onMethod_ = @Autowired)
	private MarketBoardMapper mapper;
	
	/*@Test
	public void testInsert() {
		MarketBoardVO vo = new MarketBoardVO();
		vo.setBno(50L);
		vo.setTitle("마켓테스트 제목");
		vo.setContent("마켓테스트 내용");
		vo.setWriter("test1");
		vo.setMarketKeyword("F");
		mapper.insertBoard(vo);
	}*/
	
	/*@Test
	public void testDelete() {
		mapper.deleteBoard(22L);
	}*/
	
	/*@Test
	public void testUpdate() {
		MarketBoardVO vo = mapper.read(41L);
		vo.setTitle("마켓 수정 제목");
		vo.setContent("마켓 수정 내용");
		mapper.updateBoard(vo);
	}*/
	
	@Test
	public void testList() {
		HashMap<String, Object> map = new HashMap<>();
		map.put("pageNum", 1);
		map.put("amount", 12);
		map.put("marketKeyword", "S");
		map.put("type", null);
		map.put("keyword", null);
		Criteria c = new Criteria(1, 10);
		mapper.getListWithPaging(map).forEach(log::info);
	}
	
	/*@Test
	public void testTotal() {
		Criteria cri = new Criteria(1,10);
		mapper.getTotal(cri);
	}*/
}

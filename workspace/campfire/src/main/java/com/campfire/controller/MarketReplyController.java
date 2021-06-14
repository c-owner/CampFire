package com.campfire.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.marketBoard.MarketReplyVO;
import com.campfire.service.MarketReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/marketReplies/*")
@RestController
@Log4j
public class MarketReplyController {
	@Setter(onMethod_ = @Autowired)
	private MarketReplyService service;
	
	//댓글 등록
	@PostMapping(value = "/write", consumes = "application/json", produces = "text/html; charset=utf-8")
	public ResponseEntity<String> create(@RequestBody MarketReplyVO reply) {
	int insertCnt = 0;
    insertCnt = service.register(reply);
    return insertCnt == 1 ? new ResponseEntity<>("댓글 등록을 완료했습니다.", HttpStatus.OK) /*200 OK*/:
       new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); /*500 Server Error*/
 	}
	
	//게시글 댓글 전체 조회
	@GetMapping(value="/marketReplyList/{bno}/{page}", produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<PageDTO> getList(
			@PathVariable("page") int page,
			@PathVariable("bno") Long bno){
		Criteria cri = new Criteria(page, 10);
		return new ResponseEntity<PageDTO> (service.getList(cri, bno), HttpStatus.OK); 
	}
	
	//댓글 조회
	@GetMapping(value = "/{rno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MarketReplyVO> get(@PathVariable("rno") Long rno) {
		return new ResponseEntity<MarketReplyVO>(service.get(rno), HttpStatus.OK);
	}
	
	//댓글 수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value="/{rno}", consumes = "application/json", produces = "text/html; charset=utf-8")
	public ResponseEntity<String> modify(@RequestBody MarketReplyVO reply, @PathVariable("rno") Long rno) {
		  reply.setRno(rno);
		  int modifyCnt = 0;
	      
	      modifyCnt = service.modify(reply);
	      
	      return modifyCnt == 1 ? new ResponseEntity<String>("댓글 수정을 완료했습니다.", HttpStatus.OK) :
	         new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	   }
	
	//댓글 삭제
	@DeleteMapping(value = "/{rno}", produces = "text/html; charset=utf-8")
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
	  return service.remove(rno) == 1 ? new ResponseEntity<>("댓글이 삭제되었습니다.", HttpStatus.OK) :
	         new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	   }
	
	

}

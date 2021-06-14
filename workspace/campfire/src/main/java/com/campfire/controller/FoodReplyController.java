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
import com.campfire.domain.foodBoard.FoodBoardReplyVO;
import com.campfire.domain.reviewBoard.ReviewReplyVO;
import com.campfire.service.FoodBoardReplyService;

import lombok.Setter;

@RequestMapping("/foodReplies/*")
@RestController
public class FoodReplyController {
	
		@Setter(onMethod_ = @Autowired)
		private FoodBoardReplyService service;
		
		@PostMapping(value = "/write", consumes = "application/json", produces = "text/html; charset=utf-8")
		public ResponseEntity<String> create(@RequestBody FoodBoardReplyVO reply) {
			boolean check = service.register(reply);
			return check == true ? new ResponseEntity<String>("댓글 등록을 완료했습니다.", HttpStatus.OK)
						: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		@GetMapping(value="/foodReplyList/{bno}/{page}", produces = {
				MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE
		})
		public ResponseEntity<PageDTO> getList(
				@PathVariable("page") int page,
				@PathVariable("bno") Long bno){
			Criteria cri = new Criteria(page, 10);
			return new ResponseEntity<PageDTO> (service.selectReplyList(cri, bno), HttpStatus.OK); 
		}
		
		@GetMapping(value = "/{rno}", produces = {
				MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE
		})
		public ResponseEntity<FoodBoardReplyVO> view(@PathVariable("rno") Long rno) {
			return new ResponseEntity<FoodBoardReplyVO>(service.view(rno), HttpStatus.OK);
		}
		
		@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value="/{rno}", consumes = "application/json", produces = "text/html; charset=utf-8")
		public ResponseEntity<String> modify(@RequestBody FoodBoardReplyVO reply, @PathVariable("rno") Long rno) {
			reply.setRno(rno);
			return service.modify(reply) == true ? new ResponseEntity<String>("댓글 수정을 완료했습니다.", HttpStatus.OK) 
							: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		@DeleteMapping(value = "/{rno}", produces = "text/html; charset=utf-8")
		public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
			return service.remove(rno) == true ?
					new ResponseEntity<String>("댓글 삭제를 완료했습니다.", HttpStatus.OK) 
						: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
}

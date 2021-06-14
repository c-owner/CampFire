package com.campfire.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.guideBoard.GuideBoardReplyVO;
import com.campfire.service.GuideBoardReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@AllArgsConstructor
@RequestMapping("/guideReplies/")
public class GuideBoardReplyController {
	private GuideBoardReplyService service;
	
	//댓글 등록
	@PostMapping(value="/guideReplyWrite", consumes="application/json", produces="text/html; charset=utf-8")
	public ResponseEntity<String> register(@RequestBody GuideBoardReplyVO g_vo){
		return service.register(g_vo) == 1 ? new ResponseEntity<>("댓글 등록에 성공하였습니다.", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//해당 게시글의 댓글 목록
	@GetMapping(value="/guideReplyList/{bno}/{page}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<PageDTO> getList(@PathVariable("bno") Long bno, @PathVariable("page") int page){
		Criteria cri = new Criteria(page, 10);
		return new ResponseEntity<PageDTO>(service.getList(cri, bno), HttpStatus.OK);
	}
	
	//댓글 단일 조회
	@GetMapping(value="/{rno}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<GuideBoardReplyVO> get(@PathVariable("rno") Long rno){
		return new ResponseEntity<GuideBoardReplyVO>(service.get(rno), HttpStatus.OK);
	}
	
	//댓글 수정
	@PatchMapping(value="/{rno}", consumes="application/json", produces="text/html; charset=utf-8")
	public ResponseEntity<String> modify(@PathVariable("rno") Long rno, @RequestBody GuideBoardReplyVO g_vo){
		g_vo.setRno(rno);
		return service.modify(g_vo) == 1 ? new ResponseEntity<String>("댓글을 수정하였습니다.", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 삭제
	@DeleteMapping(value="/{rno}", produces="text/html; charset=utf-8")
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		return service.remove(rno) == 1 ? new ResponseEntity<String>("댓글을 삭제하였습니다.", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}

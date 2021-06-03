package com.campfire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * 자유게시판 컨트롤
 */

@Controller
@RequestMapping("/freeboard/*")
public class FreeBoardController {
	
	@GetMapping(value="/list")
	public void freeBoard() {}

}

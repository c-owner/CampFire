package com.campfire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/** 
 * 캠핑리뷰 컨트롤
 */
@Controller
@RequestMapping("/free/*")
public class FreeController {
	
	@GetMapping(value="/freeList")
	public void freeList() {}
	
	@GetMapping(value="/freeView")
	public void freeView() {}
	
	@GetMapping(value="/freeWrite")
	public void freeWrite() {}
	
}

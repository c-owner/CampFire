package com.campfire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/** 
 * 캠핑리뷰 컨트롤
 */
@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	@GetMapping(value = "/reviewList")
	public void review() {}
	
	@GetMapping(value = "/reviewWrite")
	public void reviewWrite() {}
	
	
	@GetMapping(value="/reviewView")
	public void reviewView() {}
	
}

package com.campfire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/** 
 * 캠핑리뷰 컨트롤
 */
@Controller
@RequestMapping("/campfire/*")
public class ReviewController {
	
	@GetMapping(value = "/review")
	public void review() {}
	
	@GetMapping(value = "/writeReview")
	public void writeReview() {}
	
	
	@GetMapping(value="/reviewDetail")
	public void reviewDetail() {}
	
}

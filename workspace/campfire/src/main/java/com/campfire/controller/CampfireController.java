package com.campfire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/campfire/*")
public class CampfireController {
	
	@GetMapping(value = "/review")
	public void review() {}
	
	@GetMapping(value = "/writeReview")
	public void writeReview() {}
	
	@GetMapping(value = "/sample")
	public void sample() {}
	
	@GetMapping(value="/changePW")
	public void changePW() {}
}

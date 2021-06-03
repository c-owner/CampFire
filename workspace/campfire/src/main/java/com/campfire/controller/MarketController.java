package com.campfire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * 장작장터 컨트롤러
 */

@Controller
@RequestMapping("/market/*")
public class MarketController {
	
	@GetMapping
	public void marketList() {}
	
	

}

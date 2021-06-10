package com.campfire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campfire.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/*
 * 장작장터 컨트롤러
 */

@Controller
@Log4j
@RequestMapping("/market/*")
@AllArgsConstructor
public class MarketController {
	
	@GetMapping
	public void marketList() {}
	
	@GetMapping("/marketWrite")
	public void register(@ModelAttribute("cri") Criteria cri) {;}

}

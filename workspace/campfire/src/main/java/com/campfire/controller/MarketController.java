package com.campfire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.service.MarketBoardService;

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
	
	private MarketBoardService service;
	
	@GetMapping("/marketList")
	public void marketList(Criteria cri, @RequestParam("check") String check, Model model) {
		model.addAttribute("check", check);
		model.addAttribute("list", service.getList(cri, check));
		//model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	@ResponseBody
	@GetMapping("/marketWrite")
	public void register(@ModelAttribute("cri") Criteria cri) {;}

}

package com.campfire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.service.ReviewBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/** 
 * 캠핑리뷰 컨트롤
 */
@Controller
@AllArgsConstructor
@RequestMapping("/review/*")
@Log4j
public class ReviewController {
	
	private ReviewBoardService service; 
	
	@GetMapping("/reviewList")
	public void list(Criteria cri, Model model) { 
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	@GetMapping(value = "/reviewWrite")
	public void reviewWrite() {}
	
	
	@GetMapping(value="/reviewView")
	public void reviewView() {}
	
}

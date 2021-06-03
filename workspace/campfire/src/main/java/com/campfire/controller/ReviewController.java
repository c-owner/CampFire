package com.campfire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;

/** 
 * 캠핑리뷰 컨트롤
 */
@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
//	private ReviewService service; 
	
	@GetMapping(value = "/reviewList")
	public void reviewList(Criteria cri, Model model) {
//		model.addAttribute("list", service.getList(cri)); 
//		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	@GetMapping(value = "/reviewWrite")
	public void reviewWrite() {}
	
	
	@GetMapping(value="/reviewView")
	public void reviewView() {}
	
}

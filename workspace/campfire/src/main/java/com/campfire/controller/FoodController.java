package com.campfire.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.foodBoard.FoodBoardVO;
import com.campfire.service.FoodBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/food/*")
@AllArgsConstructor
@Log4j
public class FoodController {
	private FoodBoardService service;
	
	@GetMapping(value = "/foodList")
	public void foodList(Criteria cri, Model model) { 
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	@GetMapping(value={"/foodView", "/foodModify"})
	public void foodView(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("sessionId");
		if(userId == null) {
			model.addAttribute("userLike", false);
		}else {
			model.addAttribute("userLike", service.checkLike(bno, userId));
		}
		model.addAttribute("food", service.get(bno));
	}
	
	@GetMapping(value = "/foodWrite")
	public void foodWrite(@ModelAttribute("cri") Criteria cri) {}
	
	@PostMapping("foodWrite")
	public String register(FoodBoardVO fvo, RedirectAttributes rttr) {
		service.register(fvo);
		rttr.addFlashAttribute("result", fvo.getBno());
		
		return "redirect:/food/foodList";
	}
}

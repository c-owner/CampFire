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
import com.campfire.domain.ReviewBoardVO;
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
	
	@GetMapping(value = "/reviewList")
	public void reviewList(Criteria cri, Model model) { 
		log.info("model........" + model);
		log.info("cri .... : " + cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	
	@GetMapping(value = "/reviewWrite")
	public void reviewWrite(@ModelAttribute("cri") Criteria cri) {}
	
	@PostMapping("/reviewWrite")
	public String register(ReviewBoardVO board, RedirectAttributes rttr) {
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/review/reviewList";
	}
	
	@GetMapping({"/reviewView", "/reviewModify"})
	public void reviewView(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri,Model model){
		model.addAttribute("review",service.view(bno));
	}
	
	@PostMapping("/modify")
	public String modify(ReviewBoardVO board, Criteria cri, RedirectAttributes rttr) {
		if(service.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}else {
			rttr.addFlashAttribute("result", "fail");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/review/reviewList";
		
	}
	
	@GetMapping("remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		} else {
			rttr.addFlashAttribute("result", "fail");
		}
		
		rttr.addAttribute("pageNum" , cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/review/reviewList";
		
	}
	
	@GetMapping(value="/reviewView")
	public void reviewView(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, HttpServletRequest req, Model model) {
		log.info("reviewView....." + bno);
		log.info("reviewView....." + cri);
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("sessionId");
		if(userId == null) {
			model.addAttribute("userLike", false);
		}else {
			model.addAttribute("userLike", service.checkLike(bno, userId));
		}
		model.addAttribute("review", service.view(bno));
	}
	
}

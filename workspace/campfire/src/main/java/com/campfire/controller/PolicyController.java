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
import com.campfire.domain.PolicyVO;
import com.campfire.service.PolicyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/*
 * 장작장터 컨트롤러
 */

@Controller
@Log4j
@RequestMapping("/policy/*")
@AllArgsConstructor
public class PolicyController {
	
	private PolicyService service;
	
	@GetMapping("/policy")
	public void marketList(Criteria cri, @RequestParam("tab") String tab, Model model) {
		model.addAttribute("tab", tab);
		model.addAttribute("list", service.getList(cri, tab));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	@GetMapping("/policyWrite")
	public void register(@ModelAttribute("cri") Criteria cri, String tab, Model model) {
		model.addAttribute("tab", tab);
	}
	
	@PostMapping("/policyWrite")
	public String register(PolicyVO p_vo, RedirectAttributes rttr) {
		service.register(p_vo);
		rttr.addFlashAttribute("result", p_vo.getBno());
		rttr.addAttribute("tab", p_vo.getTab());
		return "redirect:/policy/policyList";
	}
	
	@GetMapping({"/policyView", "/policyModify"})
	public void marketView(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("sessionId");
		model.addAttribute("policy", service.view(bno));
	}
	
	@GetMapping("/policyRemove")
	public String remove(@RequestParam("bno") Long bno, @RequestParam("tab") String tab, Criteria cri, RedirectAttributes rttr) {
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("tab", tab);
		
		return "redirect:/policy/policyList";
	}
	
	//게시글 수정
	@PostMapping("/policyModify")
	public String modify(PolicyVO p_vo, Criteria cri, RedirectAttributes rttr) {
		if(service.modify(p_vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("tab", p_vo.getTab());
		
		return "redirect:/policy/policyList";
	}
	
	

}

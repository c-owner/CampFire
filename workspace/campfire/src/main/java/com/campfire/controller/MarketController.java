package com.campfire.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.marketBoard.MarketBoardAttachVO;
import com.campfire.domain.marketBoard.MarketBoardVO;
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
	
	//System.out.println("★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆");
	
	@GetMapping("/marketList")
	public void marketList(Criteria cri, @RequestParam("check") String check, Model model) {
		model.addAttribute("check", check);
		List<MarketBoardVO> list = service.getList(cri, check);
		List<MarketBoardAttachVO> thumbnail = null;
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setUpdateDate(list.get(i).getUpdateDate().substring(0, 16));
			thumbnail = service.thumbnail(list.get(i).getBno());
		}
		
		model.addAttribute("thumbnail", thumbnail);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	@GetMapping("/marketWrite")
	public void register(@ModelAttribute("cri") Criteria cri, String check, Model model) {
		model.addAttribute("check", check);
	}
	
	@PostMapping("/marketWrite")
	public String register(MarketBoardVO m_vo, RedirectAttributes rttr) {
		if(m_vo.getAttachList() != null) {
			m_vo.getAttachList().forEach(log::info);
		}
		service.register(m_vo);
		rttr.addFlashAttribute("result", m_vo.getBno());
		rttr.addAttribute("check", m_vo.getMarketKeyword());
		return "redirect:/market/marketList";
	}
	
	@GetMapping(value="/marketView")
	public void marketView(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, HttpServletRequest req, Model model) {
		log.info("장터상세진입" + bno);
		log.info("장터상세진입" + cri);
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("sessionId");
		model.addAttribute("board", service.get(bno));
		
	}
	

}

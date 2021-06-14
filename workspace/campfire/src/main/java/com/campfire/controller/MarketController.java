package com.campfire.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import com.campfire.domain.freeBoard.FreeBoardAttachVO;
import com.campfire.domain.freeBoard.FreeBoardVO;
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
		
		//marketList에서 actionForm 주석 해제하면 여기서 오류
		List<MarketBoardVO> list = service.getList(cri, check);
		List<MarketBoardAttachVO> thumbnail = null;
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setUpdateDate(list.get(i).getUpdateDate().substring(0, 16));
			thumbnail = service.thumbnail(list.get(i).getBno());
		}
		
		model.addAttribute("thumbnail", thumbnail);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, service.categoryTotal(cri, check)));
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
	
	@GetMapping({"/marketView", "/marketModify"})
	public void marketView(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, HttpServletRequest req, Model model) {
		log.info("장터상세진입" + bno);
		log.info("장터상세진입" + cri);
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("sessionId");
		model.addAttribute("board", service.get(bno));
	}
	
	//게시글 및 첨부파일 삭제
	@GetMapping("/marketRemove")
	public String remove(@RequestParam("bno") Long bno, @RequestParam("check") String check, Criteria cri, RedirectAttributes rttr) {
		List<MarketBoardAttachVO> attachList = service.getAttachList(bno);
		if(service.remove(bno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("check", check);
		
		return "redirect:/market/marketList";
	}
	
	//게시글 수정
	@PostMapping("/marketModify")
	public String modify(MarketBoardVO m_vo, Criteria cri, RedirectAttributes rttr) {
		if(service.modify(m_vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("check", m_vo.getMarketKeyword());
		
		return "redirect:/market/marketList";
	}
	
	//게시글에 등록된 모든 첨부파일 목록
	@ResponseBody
	@GetMapping(value="/getAttachList", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<MarketBoardAttachVO>> getAttachList(Long bno){
		return new ResponseEntity<List<MarketBoardAttachVO>>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	//첨부파일 및 썸네일파일 삭제 메소드
	private void deleteFiles(List<MarketBoardAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {return;}
		
		attachList.forEach(m_vo -> {
			try {
//				Path origin = Paths.get("C:\\upload\\market\\" + m_vo.getUploadPath() + "\\" + m_vo.getUuid() + "_" + m_vo.getFileName());
				Path origin = Paths.get("/usr/local/upload/market/" + m_vo.getUploadPath() + "/" + m_vo.getUuid() + "_" + m_vo.getFileName());
				Files.delete(origin);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		});
	}
	

}

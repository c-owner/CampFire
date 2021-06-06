package com.campfire.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.campfire.domain.Criteria;
import com.campfire.domain.PageDTO;
import com.campfire.domain.freeBoard.FreeBoardAttachVO;
import com.campfire.domain.freeBoard.FreeBoardVO;
import com.campfire.service.FreeBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/** 
 * 자유게시판 컨트롤
 */
@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/free/*")
public class FreeController {
	private FreeBoardService service;
	
	//전체 목록 가져오기
	@GetMapping("/freeList")
	public void getList(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	//작성 페이지로 이동
	@GetMapping("/freeWrite")
	public void register(@ModelAttribute("cri") Criteria cri) {;}
	
	//게시글 등록
	@PostMapping("/freeWrite")
	public String register(FreeBoardVO f_vo, RedirectAttributes rttr) {
		log.info("글 등록하러 와봅시다 이게 되는 건가!");
		log.info(f_vo);
		if(f_vo.getAttachList() != null) {
			f_vo.getAttachList().forEach(log::info);
		}
		service.register(f_vo);
		rttr.addFlashAttribute("result", f_vo.getBno());
		return "redirect:/freeBoard/list";
	}
	
	//상세보기로 이동
	@GetMapping({"/freeView", "/freeModify"})
	public void move(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("board", service.get(bno));
	}
	
	//게시글 수정
	@PostMapping("/freeModify")
	public String modify(FreeBoardVO f_vo, Criteria cri, RedirectAttributes rttr) {
		if(service.modify(f_vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		//return "redirect:/freeBoard/modify";
		return "redirect:/freeBoard/list";
	}
	
	//게시글 및 첨부파일 삭제
	@GetMapping("/freeRemove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {
		List<FreeBoardAttachVO> attachList = service.getAttachList(bno);
		if(service.remove(bno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		//return "redirect:/freeBoard/modify";
		return "redirect:/freeBoard/list";
	}
	
	//게시글에 등록된 모든 첨부파일 목록
	@ResponseBody
	@GetMapping(value="/getAttachList", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<FreeBoardAttachVO>> getAttachList(Long bno){
		return new ResponseEntity<List<FreeBoardAttachVO>>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	//첨부파일 및 썸네일파일 삭제 메소드
	private void deleteFiles(List<FreeBoardAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {return;}
		
		attachList.forEach(f_vo -> {
			try {
				Path origin = Paths.get("C:\\upload\\" + f_vo.getUploadPath() + "\\" + f_vo.getUuid() + "_" + f_vo.getFileName());
				Files.delete(origin);
				
				if(Files.probeContentType(origin).startsWith("image")) {
					Path thumbnail = Paths.get("C:\\upload\\" + f_vo.getUploadPath() + "\\s_" + f_vo.getUuid() + "_" + f_vo.getFileName());
					Files.delete(thumbnail);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		});
	}
}

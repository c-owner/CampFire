package com.campfire.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import com.campfire.domain.guideBoard.GuideBoardAttachVO;
import com.campfire.domain.guideBoard.GuideBoardVO;
import com.campfire.service.GuideBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/guide/*")
public class GuideController {
	private GuideBoardService service;
	//전체 목록 가져오기
		@GetMapping("/guideList")
		public void getList(Criteria cri, Model model) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DAY_OF_MONTH, -1); //7일간 보이도록 하기위해서.
			String nowday = format.format(cal.getTime());
			
			model.addAttribute("nowday",nowday);
			model.addAttribute("list", service.getList(cri));
			model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
		}
		
		//작성 페이지로 이동
		@GetMapping("/guideWrite")
		public void register(@ModelAttribute("cri") Criteria cri) {;}
		
		
		//게시글 등록
		@PostMapping("/guideWrite")
		public String register(GuideBoardVO g_vo, RedirectAttributes rttr) {
			System.out.println(g_vo.getTitle());
			if(g_vo.getAttachList() != null) {
				g_vo.getAttachList().forEach(log::info);
			}
			service.register(g_vo);
			rttr.addFlashAttribute("result", g_vo.getBno());
			return "redirect:/guide/guideList";
		}
		
		//상세보기로 이동
		@GetMapping({"/guideView", "/guideModify"})
		public void move(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
			model.addAttribute("board", service.get(bno));
		}
		
		//게시글 수정
		@PostMapping("/guideModify")
		public String modify(GuideBoardVO g_vo, Criteria cri, RedirectAttributes rttr) {
			if(service.modify(g_vo)) {
				rttr.addFlashAttribute("result", "success");
			}
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			
			return "redirect:/guide/guideList";
		}
		
		//게시글 및 첨부파일 삭제
		@GetMapping("/guideRemove")
		public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {
			List<GuideBoardAttachVO> attachList = service.getAttachList(bno);
			if(service.remove(bno)) {
				deleteFiles(attachList);
				rttr.addFlashAttribute("result", "success");
			}
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			
			return "redirect:/guide/guideList";
		}
		
		//게시글에 등록된 모든 첨부파일 목록
		@ResponseBody
		@GetMapping(value="/getAttachList", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<List<GuideBoardAttachVO>> getAttachList(Long bno){
			return new ResponseEntity<List<GuideBoardAttachVO>>(service.getAttachList(bno), HttpStatus.OK);
		}
		
		//첨부파일 및 썸네일파일 삭제 메소드
		private void deleteFiles(List<GuideBoardAttachVO> attachList) {
			if(attachList == null || attachList.size() == 0) {return;}
			
			attachList.forEach(g_vo -> {
				try {
					Path origin = Paths.get("C:\\upload\\" + g_vo.getUploadPath() + "\\" + g_vo.getUuid() + "_" + g_vo.getFileName());
					Files.delete(origin);
					
					if(Files.probeContentType(origin).startsWith("image")) {
						Path thumbnail = Paths.get("C:\\upload\\" + g_vo.getUploadPath() + "\\s_" + g_vo.getUuid() + "_" + g_vo.getFileName());
						Files.delete(thumbnail);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			});
		}
}
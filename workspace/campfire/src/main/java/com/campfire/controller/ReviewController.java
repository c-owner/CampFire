package com.campfire.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import com.campfire.domain.reviewBoard.ReviewBoardAttachVO;
import com.campfire.domain.reviewBoard.ReviewBoardVO;
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
	
	final String fileFolder = "/usr/local/upload/";
	final String uploadFolder = "/usr/local/upload";
	
	private ReviewBoardService service; 
	
	@GetMapping(value = "/reviewList")
	public void reviewList(Criteria cri, Model model) { 
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	
	@GetMapping(value = "/reviewWrite")
	public void reviewWrite(@ModelAttribute("cri") Criteria cri) {}
 
	@PostMapping("/reviewWrite")
	public String register(ReviewBoardVO board, RedirectAttributes rttr) {
//		if(board.getAttachList() != null ) {
//			board.getAttachList().forEach(log::info);
//		}
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/review/reviewList";
	}
	
	@PostMapping("/reviewModify")
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
	
	@GetMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {
		List<ReviewBoardAttachVO> attachList = service.getAttachList(bno);
		if(service.remove(bno)) {
			deleteFiles(attachList);
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
	
	@GetMapping(value={"/reviewView", "/reviewModify"})
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
	
	@GetMapping(value="/plusLike/{bno}/{userId}", produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public ResponseEntity<String> plusLike(@PathVariable("bno") Long bno, @PathVariable("userId") String userId){
		log.info("plusLike....." + bno);
		log.info("sessionId = "+userId);
		return service.insertLike(bno, userId) ? new ResponseEntity<String>("success", HttpStatus.OK) : 
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/minusLike/{bno}/{userId}", produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public ResponseEntity<String> minusLike(@PathVariable("bno") Long bno, @PathVariable("userId") String userId){
		log.info("minusLike....." + bno);
		log.info("sessionId = "+userId);
		return service.deleteLike(bno, userId) ? new ResponseEntity<String>("success", HttpStatus.OK) : 
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/getLikeCnt/{bno}", produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public ResponseEntity<String> getLikeCnt(@PathVariable("bno") Long bno){
		log.info("getLikeCnt....." + bno);
		log.info("getLikeCntResult....." + service.getLikeCnt(bno));
		return new ResponseEntity<String>(""+service.getLikeCnt(bno), HttpStatus.OK);
	}
	
	//게시글에 등록된 모든 첨부파일 목록
	@ResponseBody
	@GetMapping(value="/getAttachList", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReviewBoardAttachVO>> getAttachList(Long bno){
		return new ResponseEntity<List<ReviewBoardAttachVO>>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	//첨부파일 및 썸네일파일 삭제 메소드
	private void deleteFiles(List<ReviewBoardAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {return;}
		
		attachList.forEach(f_vo -> {
			try {
				Path origin = Paths.get(fileFolder + "/review/" + f_vo.getUploadPath() + "/" + f_vo.getUuid() + "_" + f_vo.getFileName());
				Files.delete(origin);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		});
	}
	
	
}

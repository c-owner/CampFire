package com.campfire.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public void reviewWrite() {}
	
	
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
	
	
}

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
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
	
	private AdminBoardService service; 
	
	@GetMapping(value = "/reviewList")
	public void reviewList(Criteria cri, Model model) { 
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	
	
	
}

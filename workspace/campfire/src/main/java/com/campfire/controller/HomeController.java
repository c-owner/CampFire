package com.campfire.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.campfire.service.KakaoAPI;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private KakaoAPI kakao;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/elements", method = RequestMethod.GET)
	public String elements() {
		return "elements";
	}
	@RequestMapping(value = "/generic", method = RequestMethod.GET)
	public String generic() {
		return "generic";
	}
	
	//카카오 로그인
	@RequestMapping(value="/login")
	public String login(@RequestParam("code") String code, HttpSession session) {
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		if (userInfo.get("email") != null) {
			//세션아이디 카카오이메일로
	        session.setAttribute("sessionId", userInfo.get("email"));
	        session.setAttribute("access_Token", access_Token);
	    }
		return "redirect:/";	//메인경로 (현재url 추구)
	}
	
	//카카오 로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
	    kakao.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    session.removeAttribute("sessionId");
	    return "redirect:/";
	}
	
	
	@GetMapping(value = "/noticeList")
	public void getList() {
		
	}
	@GetMapping(value = "/noticeWrite")
	public void noticeWrite() {
		
	}
	@GetMapping(value = "/noticeModify")
	public void noticeModify() {
		
	}
	@GetMapping(value = "/noticeRemove")
	public void noticeRemove() {
		
	}
	@GetMapping(value = "/getAttachList")
	public void getAttachList() {
		
	}
	

}

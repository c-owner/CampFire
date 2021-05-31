package com.campfire.controller;


import javax.print.attribute.standard.Media;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpRequest;

import java.util.Random;


import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campfire.domain.UserVO;
import com.campfire.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/account/*")
@Log4j
public class UserController {
	private UserService service;
 

	@PostMapping(value="/signUp", consumes="application/json", produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> signUp(UserVO user) {
		
		return null;
	}
	
	@PostMapping(value="/signIn", consumes="application/json", produces=MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public ResponseEntity<String> signIn(@RequestBody UserVO user, HttpServletRequest req){
		log.info("login....." + user);
		String result = null;
		if(service.signIn(user.getUserId(), user.getUserPw())) {
			HttpSession session = req.getSession();
			session.setAttribute("sessionId", user.getUserId());
			result = user.getUserId();		
		}else {
			result = "";
		}
		return new ResponseEntity<String>(result, HttpStatus.OK);

	@GetMapping(value = "/sendMailCode", produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public ResponseEntity<String> sendMailCode(@RequestParam("email") String email) {
		log.info("sendMailCode....." + email);
		String title = "모닥불 인증메일입니다.";
		String code = "";
		String content = "";
		
		Random rnd =new Random();
		StringBuffer buf =new StringBuffer();
		for(int i=0;i<7;i++){
		    if(rnd.nextBoolean()){
		        buf.append((char)((int)(rnd.nextInt(26))+97));
		    }else{
		        buf.append((rnd.nextInt(10))); 
		    }
		}
		code = buf.toString();
		
		content = "모닥불 회원가입을 위한 인증코드입니다.\nCODE : "+code;
		
		boolean sendResult = new MailDTO(email, title, content).sendmail();
		
		if(sendResult) {
			return new ResponseEntity<String>(code, HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("error", HttpStatus.OK);
    }
	}
}

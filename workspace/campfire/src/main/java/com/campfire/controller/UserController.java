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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.campfire.domain.MailDTO;
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
	}
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

	@PostMapping(value="/signUp", consumes="application/json")
	public String signUp(@RequestBody UserVO user){
		service.signUp(user);
		return "redirect:/home";
	}

	@GetMapping(value="/checkId/{userId}", produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public ResponseEntity<String> checkId(@PathVariable("userId") String userId){
		String result = null;
		if(service.checkId(userId)) {
			result = "no";
		}else {
			result = "yes";
		}
		return new ResponseEntity<String>(result, HttpStatus.OK);
	}

	@GetMapping(value="/findId/{userEmail}", produces= "application/text; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> findId(@PathVariable String userEmail){
		String result = "";
		String title = "모닥불 - 회원님의 아이디 찾기 결과입니다.";
		String userId = service.findId(userEmail);

		if(userId != "") {
			for(int i=0; i<userId.length(); i++) {
				if(i >= 3) {
					userId += "*";
				}
				userId += userId.charAt(i);
			}
			String content = "회원님의 아이디는 "+userId+"입니다.";
			MailDTO mailDTO = new MailDTO(userEmail, title, content);
			if(mailDTO.sendmail()) {
				result = "아이디 찾기 메일이 발송되었습니다.";
			}else {
				result = "이메일 주소를 다시 확인해주세요.";
			}
		}else {
			result = "이메일 주소를 다시 확인해주세요.";
		}
		return new ResponseEntity<String>(result, HttpStatus.OK);
	}
	@GetMapping(value="/findPw/{userId}/{userEmail}", produces= "application/text; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> findPw(@PathVariable String userId, @PathVariable String userEmail){
		String result = "";
		String title = "모닥불 - 회원님의 비밀번호 찾기입니다.";
		
		if(service.findPw(userId, userEmail)) {
			for(int i=0; i<userId.length(); i++) {
				if(i >= 3) {
					userId += "*";
				}
				userId += userId.charAt(i);
			}
			String content = "아래의 링크를 통해 새로운 비밀번호를 입력해 주십시오.\n";
			content += "비밀번호 변경 링크";
			MailDTO mailDTO = new MailDTO(userEmail, title, content);
			if(mailDTO.sendmail()) {
				result = "비밀번호 찾기 메일이 발송되었습니다.";
			}else {
				result = "이메일 주소를 다시 확인해주세요.";
			}
		}else {
			result = "아이디 혹은 이메일 주소를 다시 확인해주세요.";
		}
		return new ResponseEntity<String>(result, HttpStatus.OK);
	}

}

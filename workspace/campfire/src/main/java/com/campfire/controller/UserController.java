package com.campfire.controller;


import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.json.simple.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
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
	public ResponseEntity<String> signIn(@RequestBody UserVO user, HttpSession session){
		log.info("login....." + user);
		String result = null;
		if(service.signIn(user.getUserId(), user.getUserPw())) {
			session.setAttribute("sessionId", user.getUserId());
				session.setAttribute("admin", service.chkAdmin(user.getUserId()));
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
		
		if(service.checkEmail(email)) {
			return new ResponseEntity<String>("no", HttpStatus.OK);
		}else {
			
			String title = "[모닥불] 회원가입 인증 메일입니다.";
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

	@PostMapping(value="/signUp")
	public String signUp(UserVO user){
		service.signUp(user);
		return "redirect:/";
	}

	@GetMapping(value="/checkId", produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public ResponseEntity<String> checkId(String userId){
		String result = null;
		if(service.checkId(userId)) {
			result = "no";
		}else {
			result = "yes";
		}
		return new ResponseEntity<String>(result, HttpStatus.OK);
	}

	@GetMapping(value="/findId", produces= "application/text; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> findId(String userEmail){
		
		String result = "";
		if(!service.checkEmail(userEmail)) {
			log.info("이메일 없음");
			result = "일치하는 회원 정보가 없습니다. 다시 시도해 주십시오.";
		}else {
			log.info("이메일 있음");
			
			String title = "[모닥불] 회원님의 아이디 찾기 결과입니다.";
			String userId = service.findId(userEmail);
			String encryptId = "";
			String content = "";
			
			for(int i=0; i<userId.length(); i++) {
				if(i<userId.length()-3) {
					encryptId += userId.charAt(i);					
				}else {
					encryptId += "*";
				}
			}
			
			content = "회원님의 아이디는 '"+ encryptId + "' 입니다.";
			
			boolean sendResult = new MailDTO(userEmail, title, content).sendmail();
			
			if(sendResult) {
				result = "아이디 찾기 메일이 발송되었습니다.";
			}else {
				result = "이메일 전송에 실패했습니다. 잠시후 다시 시도해 주십시오.";
			}
			
		}
		

		return new ResponseEntity<String>(result, HttpStatus.OK);
	}
	@GetMapping(value="/findPw", produces= "application/text; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> findPw(String userId, String userEmail, HttpServletResponse resp){
		String result = "";
		String title = "[모닥불] 회원님의 비밀번호 찾기입니다.";
		String code = "";
		
		if(service.findPw(userId, userEmail)) {
			
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

			Cookie urlCookie = new Cookie("userId", userId);
			urlCookie.setMaxAge(60*60); // 1시간
			resp.addCookie(urlCookie);
			
			String content = "아래의 링크를 통해 새로운 비밀번호를 입력해 주십시오.<br>";
			content += "*비밀번호 변경 링크는 1시간 후에 만료됩니다.<br>";
//			content += "<a href='http://camp-fire.kro.kr/account/changePW'>비밀번호 변경</a>";
			content += "<a href='http://localhost:8084/account/changePW/"+code+"'>비밀번호 변경</a>";
			MailDTO mailDTO = new MailDTO(userEmail, title, content);
			if(mailDTO.sendmail()) {
				result = "비밀번호 찾기 메일이 발송되었습니다.";
			}else {
				result = "이메일 주소를 다시 확인해주세요.";
			}
		}else {
			result = "아이디 혹은 이메일 주소를 다시 확인해 주십시오.";
		}
		return new ResponseEntity<String>(result, HttpStatus.OK);
	}

	
//	체인지 pw
	@GetMapping(value="/changePW/{code}")
	public String changePW() {
		return "/account/changePW";
	}
	
	@PostMapping(value="/changePW", consumes="application/json", produces= "application/text; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> changePw(@RequestBody UserVO user, @CookieValue(value="userId", required=false) Cookie cookie, HttpServletResponse resp) {
		log.info("userId : " + user.getUserId());
		log.info("userPw : " + user.getUserPw());
		String result = "";
		if(!cookie.getValue().isEmpty()) {
			if(service.changePw(user.getUserId(), service.encrypt(user.getUserPw()))) {
				cookie.setMaxAge(0);
				resp.addCookie(cookie);
				result = "yes";
			}			
		}else {
			result = "no";
		}
		return new ResponseEntity<String>(result, HttpStatus.OK);
	}
	
	@GetMapping(value="/callDetail", consumes="application/json", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public void callDetail(HttpServletRequest req, HttpServletResponse resp, @RequestParam String contentId, @RequestParam String contentTypeId) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/locationBasedList";
		String serviceKey = "1G8bENnYaHFKNLIrcyVPCLk2nA11EYtohtW4z6SnefGSElzlv20lKgN9TLkBLhrMojg9RSuQv09K86F1dbKysQ%3D%3D";
		String parameter = "";
		
		PrintWriter out = resp.getWriter();
		
		parameter = parameter + "&" + "contentId=" + contentId; // jsp에서 받아올 id, type
		parameter = parameter + "&" + "contentTypeId=" + contentTypeId;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=tour";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		
		URL url = new URL(addr);
		
		System.out.println(addr);
		
		InputStream in = url.openStream();
		
		ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		
		in.close();
		bos1.close();
		
		
		String mbos = bos1.toString("UTF-8");
		
		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);
		
		JSONObject json = new JSONObject();
		json.put("data", s);
	}
	
}


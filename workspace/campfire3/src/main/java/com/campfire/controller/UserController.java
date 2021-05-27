package com.campfire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campfire.service.UserService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/account/*")
public class UserController {
	
	private UserService service;
 
	
}

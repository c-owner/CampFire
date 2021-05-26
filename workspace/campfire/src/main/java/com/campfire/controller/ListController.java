package com.campfire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/includes/*")
public class ListController {
	
	@GetMapping({"/footer", "/header"})
	public void footer() {}

}

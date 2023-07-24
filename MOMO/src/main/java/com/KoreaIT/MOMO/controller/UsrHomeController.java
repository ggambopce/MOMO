package com.KoreaIT.MOMO.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrHomeController {

	@RequestMapping("/usr/main")
	public String showMain() {
		return "usr/home/home";
	}
	
}


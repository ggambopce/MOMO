package com.KoreaIT.MOMO.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebController {

	@RequestMapping("/usr/home")
	public String showMain() {
		return "usr/home/home";
	}
	
}

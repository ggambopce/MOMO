package com.KoreaIT.MOMO.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsrHomeController {
	int cnt;
	
	public UsrHomeController() {
		this.cnt = 0;
	}
	
	
	@RequestMapping("/usr/home/main")
	@ResponseBody
	public String showMain() {
		return "안녕하세요1";
		
	}
	
	@RequestMapping("/usr/home/main1")
	@ResponseBody
	public int showMain1() {
		
		return this.cnt++;
		
		
	}
}

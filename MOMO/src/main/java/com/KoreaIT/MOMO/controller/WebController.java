package com.KoreaIT.MOMO.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KoreaIT.MOMO.service.MmakerService;

@Controller
public class WebController {
	private MmakerService mmakerService;

	@RequestMapping("/usr/home")
	public String showMain(Model model) {
		return "usr/home/home";
	}
	
	@RequestMapping("/usr/elements")
	public String showElements() {
		return "usr/common/elements";
	}
	
	@RequestMapping("/usr/main")
	public String showLogin() {
		return "usr/member/login";
	}
	
	@RequestMapping("/usr/join")
	public String showSignup() {
		return "usr/member/join";
	}
	
	@RequestMapping("/usr/domake")
	public String showDomake() {
		return "usr/mmaker/mmaker";
	}
	
	@RequestMapping("/usr/lastmoim")
	public String showLastMoim() {
		return "usr/mmaker/lastmoim";
	}
	
	@RequestMapping("/usr/scheduledmoim")
	public String showScheduledMoim() {
		return "usr/mmaker/scheduledmoim";
	}
	
}
package com.KoreaIT.MOMO.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KoreaIT.MOMO.service.MmakerService;
import com.KoreaIT.MOMO.vo.Mmaker;

@Controller
public class WebController {
	private MmakerService mmakerService;

	
	
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
	
	@RequestMapping("/usr/domodify")
	public String showDomodify() {
		return "usr/mmaker/modify";
	}
	
	
	@RequestMapping("/usr/lastmoim")
	public String showLastMoim() {
		return "usr/mmaker/lastmoim";
	}
	
	@RequestMapping("/usr/detail")
	public String showDetail() {
		return "usr/mmaker/detail";
	}
	
}
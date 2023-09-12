package com.KoreaIT.MOMO.vo;

import java.io.IOException;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import com.KoreaIT.MOMO.util.Util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;

@Component
@Scope(value = "request", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Rq {

	@Getter
	private int loginedMemberId;
	private Member loginedMember;
	private HttpServletRequest req;
	private HttpServletResponse resp;
	private HttpSession httpSession;
	
	public Rq(HttpServletRequest req, HttpServletResponse resp) {
		
		this.req = req;
		this.resp = resp;
		this.httpSession = req.getSession();

		int loginedMemberId = 0;
		Member loginedMember = null;

		if (httpSession.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) httpSession.getAttribute("loginedMemberId");
			loginedMember = (Member) httpSession.getAttribute("loginedMember");
		}

		this.loginedMemberId = loginedMemberId;
		this.loginedMember = loginedMember;
		
		this.req.setAttribute("rq", this);
	}

	public void jsPrintHistoryBack(String msg) {
		resp.setContentType("text/html; charset=UTF-8;");

		print(Util.jsHistoryBack(msg));
	}

	private void print(String str) {
		try {
			resp.getWriter().append(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void login(Member member) {
		httpSession.setAttribute("loginedMemberId", member.getId());
	}

	public void logout() {
		httpSession.removeAttribute("loginedMemberId");
	}
	
	public String jsReturnOnView(String msg, boolean isHistoryBack) {

		req.setAttribute("msg", msg);
		req.setAttribute("isHistoryBack", isHistoryBack);

		return "usr/common/js";
	}
	
	public void initRq() {

	}

	public Member getLoginedMember() {
		return loginedMember;
	}

	public void setLoginedMember(Member loginedMember) {
		this.loginedMember = loginedMember;
	}
	
}

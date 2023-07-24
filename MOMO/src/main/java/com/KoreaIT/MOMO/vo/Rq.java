package com.KoreaIT.MOMO.vo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;

public class Rq {
	
	@Getter
	private int loginedMemberId;

	public Rq(HttpServletRequest req) {

		HttpSession httpSession = req.getSession();

		int loginedMemberId = 0;

		if (httpSession.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) httpSession.getAttribute("loginedMemberId");
		}

		this.loginedMemberId = loginedMemberId;
	}

}

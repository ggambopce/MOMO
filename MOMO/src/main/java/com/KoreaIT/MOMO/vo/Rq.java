package com.KoreaIT.MOMO.vo;

import java.io.IOException;

import com.KoreaIT.MOMO.util.Util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;

public class Rq {

	@Getter
	private int loginedMemberId;
	private HttpServletResponse resp;

	public Rq(HttpServletRequest req, HttpServletResponse resp) {

		this.resp = resp;

		HttpSession httpSession = req.getSession();

		int loginedMemberId = 0;

		if (httpSession.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) httpSession.getAttribute("loginedMemberId");
		}

		this.loginedMemberId = loginedMemberId;
	}

	public void jsPrintHistoryBack(String msg) {
		resp.setContentType("text/html; charset=UTF-8;");

		println("<script>");

		if (!Util.empty(msg)) {
			println("alert('" + msg + "');");
		}

		println("history.back();");
		println("</script>");
	}

	private void print(String str) {
		try {
			resp.getWriter().append(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void println(String str) {
		print(str + "\n");
	}

}

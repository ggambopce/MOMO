package com.KoreaIT.MOMO.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.KoreaIT.MOMO.vo.Rq;

@Component
public class NeedLoginInterceptor implements HandlerInterceptor {

	private Rq rq;

	@Autowired
	public NeedLoginInterceptor(Rq rq) {
		this.rq = rq;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		if (rq.getLoginedMemberId() == 0) {
			rq.jsPrintHistoryBack("로그인 후 이용해주세요");
			return false;
		}

		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

}

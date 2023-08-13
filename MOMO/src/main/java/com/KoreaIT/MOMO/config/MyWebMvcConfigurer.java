package com.KoreaIT.MOMO.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.KoreaIT.MOMO.interceptor.BeforeActionInterceptor;
import com.KoreaIT.MOMO.interceptor.NeedLoginInterceptor;

@Configuration
public class MyWebMvcConfigurer implements WebMvcConfigurer {

	private BeforeActionInterceptor beforeActionInterceptor;
	private NeedLoginInterceptor needLoginInterceptor;
	
	@Autowired
	public MyWebMvcConfigurer(BeforeActionInterceptor beforeActionInterceptor, NeedLoginInterceptor needLoginInterceptor) {
		this.beforeActionInterceptor = beforeActionInterceptor;
		this.needLoginInterceptor = needLoginInterceptor;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(beforeActionInterceptor).addPathPatterns("/**").excludePathPatterns("/resource/**");
		registry.addInterceptor(needLoginInterceptor).addPathPatterns("/usr/mmaker/write")
		.addPathPatterns("/usr/mmaker/doWrite").addPathPatterns("/usr/mmaker/modify")
		.addPathPatterns("/usr/mmaker/doModify").addPathPatterns("/usr/mmaker/doDelete")
		.addPathPatterns("/usr/member/doLogout").addPathPatterns("/usr/mmaker/scheduledmoim");
	}
}
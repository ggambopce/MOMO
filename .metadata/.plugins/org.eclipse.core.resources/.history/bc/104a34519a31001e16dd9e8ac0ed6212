package com.KoreaIT.MOMO.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import com.KoreaIT.MOMO.service.MemberService;

@Controller
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;

    // 로그인 페이지
    @GetMapping("/member/login")
    public String openLogin() {
        return "usr/member/login";
    }

   
}

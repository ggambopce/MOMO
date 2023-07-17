package com.KoreaIT.MOMO.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KoreaIT.MOMO.repository.MemberRepository;
import com.KoreaIT.MOMO.vo.Member;

@Service
public class MemberService {

	private MemberRepository memberRepository;

	@Autowired
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	public void doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email) {
		memberRepository.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);
	}

	public int getLastInsertId() {
		return memberRepository.getLastInsertId();
	}

	public Member getMemberById(int id) {
		return memberRepository.getMemberById(id);
	}
	
}

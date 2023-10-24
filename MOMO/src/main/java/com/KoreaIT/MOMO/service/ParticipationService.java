package com.KoreaIT.MOMO.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KoreaIT.MOMO.repository.MemberRepository;
import com.KoreaIT.MOMO.repository.ParticipationRepository;
import com.KoreaIT.MOMO.util.Util;
import com.KoreaIT.MOMO.vo.Member;
import com.KoreaIT.MOMO.vo.Mmaker;
import com.KoreaIT.MOMO.vo.Participation;
import com.KoreaIT.MOMO.vo.ResultData;

@Service
public class ParticipationService {

	private ParticipationRepository participationRepository;

	@Autowired
	public ParticipationService(ParticipationRepository participationRepository) {
		this.participationRepository = participationRepository;
	}
	
	public List<Participation> getParticipations(){

		return participationRepository.getParticipations();
	}
	
	public Participation getForPrintParticipation(int id) {

		Participation participation = participationRepository.getForPrintParticipation(id);

		return participation;
	}
	
}

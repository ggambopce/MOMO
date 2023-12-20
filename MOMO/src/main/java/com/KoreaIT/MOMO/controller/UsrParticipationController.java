package com.KoreaIT.MOMO.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KoreaIT.MOMO.service.ParticipationService;
import com.KoreaIT.MOMO.util.Util;
import com.KoreaIT.MOMO.vo.Mmaker;
import com.KoreaIT.MOMO.vo.Participation;
import com.KoreaIT.MOMO.vo.ResultData;
import com.KoreaIT.MOMO.vo.Rq;

public class UsrParticipationController {
	private ParticipationService participationService;
	private Rq rq;
	
	@Autowired
	public UsrParticipationController(ParticipationService participationService, Rq rq) {
		this.participationService = participationService;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/Mmaker/participation")
	public String showParticipation(Model model, int id) {

			Participation participation = participationService.getForPrintParticipation(id);
			
			model.addAttribute("participation", participation);
			
		
		return "usr/mmaker/participation";
	}
	
	@RequestMapping("/usr/Mmaker/doParticipation")
	@ResponseBody
	public String doParticipation(int memberId, String relTypeCode, int relId, String participationStatus, String participationTF ) {
	
		participationService.doParticipation(memberId, relTypeCode, relId, participationStatus, participationTF);
		
		int id = participationService.getLastInsertId();

		return Util.jsReplace(Util.f("참여신청", id), Util.f("../home"));
		
	}
	/* 참여취소기능 
	@RequestMapping("/usr/Mmaker/participationCancle")
	@ResponseBody
	public String doCancle(int id) {

		Participation participation = participationService.getParticipationById(id);

		ResultData actorCanModifyRd = participationService.actorCanMD(rq.getLoginedMemberId(), participation);

		if (actorCanModifyRd.isFail()) {
			return Util.jsHistoryBack(actorCanModifyRd.getMsg());
		}

		participationService.cancleParticipation(id);

		return Util.jsReplace(Util.f("%d번 게시물을 삭제했습니다", id), "../usr/home");
	}
	*/
	
}


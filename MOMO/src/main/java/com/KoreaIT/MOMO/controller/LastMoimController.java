package com.KoreaIT.MOMO.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KoreaIT.MOMO.service.LastMoimService;
import com.KoreaIT.MOMO.util.Util;
import com.KoreaIT.MOMO.vo.LastMoim;
import com.KoreaIT.MOMO.vo.ResultData;
import com.KoreaIT.MOMO.vo.Rq;

@Controller
public class LastMoimController {

	private LastMoimService lastmoimService;
	private Rq rq;

	@Autowired
	public LastMoimController(LastMoimService lastmoimService, Rq rq) {
		this.lastmoimService = lastmoimService;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/LastMoim/write")
	public String write() {
		return "usr/LastMoim/write";
	}

	@RequestMapping("/usr/LastMoim/doWrite")
	@ResponseBody
	public String doWrite(String moimMain, String moimBody, String moimImg, String moimDatetime, String moimPlace, String moimMemberCnt, String moimPrice) {

		if (Util.empty(moimMain)) {
			return Util.jsHistoryBack("모임제목을 입력해주세요");
		}

		if (Util.empty(moimBody)) {
			return Util.jsHistoryBack("모임내용을 입력해주세요");
		}
		
		if (Util.empty(moimImg)) {
			return Util.jsHistoryBack("모임사진을 입력해주세요");
		}
		
		if (Util.empty(moimDatetime)) {
			return Util.jsHistoryBack("모임일시를 입력해주세요");
		}
		
		if (Util.empty(moimPlace)) {
			return Util.jsHistoryBack("모임장소를 입력해주세요");
		}
		
		if (Util.empty(moimMemberCnt)) {
			return Util.jsHistoryBack("모임인원을 입력해주세요");
		}
		
		if (Util.empty(moimPrice)) {
			return Util.jsHistoryBack("모임비를 입력해주세요");
		}
		lastmoimService.writeLastMoim(rq.getLoginedMemberId(), moimMain, moimBody, moimImg, moimDatetime, moimPlace, moimMemberCnt, moimPrice);

		int id = lastmoimService.getLastInsertId();

		return Util.jsReplace(Util.f("%d번 게시물이 생성되었습니다", id), Util.f("detail?id=%d", id));
	}
	
	@RequestMapping("/usr/LastMoim/detail")
	public String showDetail(Model model, int id) {

		LastMoim lastmoim = lastmoimService.getForPrintLastMoim(id);

		lastmoimService.actorCanChangeData(rq.getLoginedMemberId(), lastmoim);
		
		model.addAttribute("lastmoim", lastmoim);
		
		return "usr/LastMoim/detail";
	}
	
	@RequestMapping("/usr/LastMoim/lastMoim")
	public String showLastMoim(Model model) {

		List<LastMoim> lastmoims = lastmoimService.getLastMoims();

		model.addAttribute("lastmoims", lastmoims);
		
		
		return "usr/lastmoim/lastmoim";
	}
	
	@RequestMapping("/usr/LastMoim/scheduledMoim")
	public String showScheduledMoim(Model model) {

		List<LastMoim> lastmoims = lastmoimService.getLastMoims();

		model.addAttribute("lastmoims", lastmoims);

		return "usr/lastmoim/scheduledmoim";
	}

	@RequestMapping("/usr/LastMoim/modify")
	public String modify(Model model, int id) {

		LastMoim lastmoim = lastmoimService.getForPrintLastMoim(id);

		ResultData actorCanMD = lastmoimService.actorCanMD(rq.getLoginedMemberId(), lastmoim);

		if (actorCanMD.isFail()) {
			return rq.jsReturnOnView(actorCanMD.getMsg(), true);
		}

		model.addAttribute("lastmoim", lastmoim);

		return "usr/LastMoim/modify";
	}
	
	@RequestMapping("/usr/LastMoim/doModify")
	@ResponseBody
	public String doModify(int id, String title, String body) {

		LastMoim lastmoim = lastmoimService.getLastMoimById(id);

		ResultData actorCanModifyRd = lastmoimService.actorCanMD(rq.getLoginedMemberId(), lastmoim);

		if (actorCanModifyRd.isFail()) {
			return Util.jsHistoryBack(actorCanModifyRd.getMsg());
		}

		lastmoimService.modifyLastMoim(id, title, body);

		return Util.jsReplace(Util.f("%d번 게시물을 수정했습니다", id), Util.f("detail?id=%d", id));
	}
	
	@RequestMapping("/usr/LastMoim/doDelete")
	@ResponseBody
	public String doDelete(int id) {

		LastMoim lastmoim = lastmoimService.getLastMoimById(id);

		ResultData actorCanModifyRd = lastmoimService.actorCanMD(rq.getLoginedMemberId(),lastmoim);
		

		if (actorCanModifyRd.isFail()) {
			return Util.jsHistoryBack(actorCanModifyRd.getMsg());
		}
		
		lastmoimService.deleteLastMoim(id);

		return Util.jsReplace(Util.f("%d번 게시물을 삭제했습니다", id), "list");
	}
	
}

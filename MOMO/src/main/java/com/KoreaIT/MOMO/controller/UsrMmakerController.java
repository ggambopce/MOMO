package com.KoreaIT.MOMO.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KoreaIT.MOMO.service.MmakerService;
import com.KoreaIT.MOMO.service.BoardService;
import com.KoreaIT.MOMO.util.Util;
import com.KoreaIT.MOMO.vo.Mmaker;
import com.KoreaIT.MOMO.vo.Board;
import com.KoreaIT.MOMO.vo.ResultData;
import com.KoreaIT.MOMO.vo.Rq;

@Controller
public class UsrMmakerController {

	private MmakerService mmakerService;
	private BoardService boardService;
	private Rq rq;

	@Autowired
	public UsrMmakerController(MmakerService mmakerService, BoardService boardService, Rq rq) {
		this.mmakerService = mmakerService;
		this.boardService = boardService;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/Mmaker/write")
	public String write() {
		return "usr/Mmaker/write";
	}

	@RequestMapping("/usr/Mmaker/doWrite")
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
		mmakerService.writeMmaker(rq.getLoginedMemberId(), moimMain, moimBody, moimImg, moimDatetime, moimPlace, moimMemberCnt, moimPrice);

		int id = mmakerService.getLastInsertId();

		return Util.jsReplace(Util.f("%d번 게시물이 생성되었습니다", id), Util.f("detail?id=%d", id));
	}
	
	@RequestMapping("/usr/Mmaker/detail")
	public String showDetail(Model model, int id) {

		Mmaker Mmaker = mmakerService.getForPrintMmaker(id);

		mmakerService.actorCanChangeData(rq.getLoginedMemberId(), Mmaker);
		
		model.addAttribute("Mmaker", Mmaker);
		
		return "usr/Mmaker/detail";
	}
	
	@RequestMapping("/usr/Mmaker/lastMoim")
	public String showLastMoim(Model model, @RequestParam(defaultValue = "1") int boardId,
			@RequestParam(defaultValue = "1") int page, String moimMain, String moimBody, String moimImg, String moimDatetime, String moimPlace, String moimMemberCnt, String moimPrice) {

		if (page <= 0) {
			return rq.jsReturnOnView("페이지번호가 올바르지 않습니다", true);
		}

		Board board = boardService.getBoardById(boardId);

		if (board == null) {
			return rq.jsReturnOnView("존재하지 않는 게시판입니다", true);
		}

		int MmakersCnt = mmakerService.getMmakersCnt(boardId);
		
		int itemsInAPage = 10;

		int pagesCount = (int) Math.ceil((double) MmakersCnt / itemsInAPage);

		List<Mmaker> Mmakers = mmakerService.getMmakers(boardId, itemsInAPage, page, moimMain, moimBody, moimImg, moimDatetime, moimPlace, moimMemberCnt, moimPrice);

		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("page", page);
		model.addAttribute("MmakersCnt", MmakersCnt);
		model.addAttribute("Mmakers", Mmakers);
		model.addAttribute("board", board);
		model.addAttribute("moimMain", moimMain);
		model.addAttribute("moimBody", moimBody);
		model.addAttribute("moimImg", moimImg);
		model.addAttribute("moimDatetime", moimDatetime);
		model.addAttribute("moimPlace", moimPlace);
		model.addAttribute("moimMemberCnt", moimMemberCnt);
		model.addAttribute("moimPrice", moimPrice);
		

		return "usr/Mmaker/lastMoim";
	}
	
	@RequestMapping("/usr/Mmaker/scheduledMoim")
	public String showScheduledMoim(Model model, @RequestParam(defaultValue = "2") int boardId,
			@RequestParam(defaultValue = "2") int page, String moimMain, String moimBody, String moimImg, String moimDatetime, String moimPlace, String moimMemberCnt, String moimPrice) {

		if (page <= 0) {
			return rq.jsReturnOnView("페이지번호가 올바르지 않습니다", true);
		}

		Board board = boardService.getBoardById(boardId);

		if (board == null) {
			return rq.jsReturnOnView("존재하지 않는 게시판입니다", true);
		}

		int MmakersCnt = mmakerService.getMmakersCnt(boardId);
		
		int itemsInAPage = 10;

		int pagesCount = (int) Math.ceil((double) MmakersCnt / itemsInAPage);

		List<Mmaker> Mmakers = mmakerService.getMmakers(boardId, itemsInAPage, page, moimPrice, moimPrice, moimPrice, moimPrice, moimPrice, moimPrice, moimPrice);

		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("page", page);
		model.addAttribute("MmakersCnt", MmakersCnt);
		model.addAttribute("Mmakers", Mmakers);
		model.addAttribute("board", board);
		model.addAttribute("moimMain", moimMain);
		model.addAttribute("moimBody", moimBody);
		model.addAttribute("moimImg", moimImg);
		model.addAttribute("moimDatetime", moimDatetime);
		model.addAttribute("moimPlace", moimPlace);
		model.addAttribute("moimMemberCnt", moimMemberCnt);
		model.addAttribute("moimPrice", moimPrice);

		return "usr/Mmaker/scheduledMoim";
	}

	
	@RequestMapping("/usr/Mmaker/modify")
	public String modify(Model model, int id) {

		Mmaker Mmaker = mmakerService.getForPrintMmaker(id);

		ResultData actorCanMD = mmakerService.actorCanMD(rq.getLoginedMemberId(), Mmaker);

		if (actorCanMD.isFail()) {
			return rq.jsReturnOnView(actorCanMD.getMsg(), true);
		}

		model.addAttribute("Mmaker", Mmaker);

		return "usr/Mmaker/modify";
	}
	
	@RequestMapping("/usr/Mmaker/doModify")
	@ResponseBody
	public String doModify(int id, String title, String body) {

		Mmaker Mmaker = mmakerService.getMmakerById(id);

		ResultData actorCanModifyRd = mmakerService.actorCanMD(rq.getLoginedMemberId(), Mmaker);

		if (actorCanModifyRd.isFail()) {
			return Util.jsHistoryBack(actorCanModifyRd.getMsg());
		}

		mmakerService.modifyMmaker(id, title, body);

		return Util.jsReplace(Util.f("%d번 게시물을 수정했습니다", id), Util.f("detail?id=%d", id));
	}
	
	@RequestMapping("/usr/Mmaker/doDelete")
	@ResponseBody
	public String doDelete(int id) {

		Mmaker Mmaker = mmakerService.getMmakerById(id);

		ResultData actorCanModifyRd = mmakerService.actorCanMD(rq.getLoginedMemberId(), Mmaker);
		

		if (actorCanModifyRd.isFail()) {
			return Util.jsHistoryBack(actorCanModifyRd.getMsg());
		}
		
		mmakerService.deleteMmaker(id);

		return Util.jsReplace(Util.f("%d번 게시물을 삭제했습니다", id), "list");
	}
}

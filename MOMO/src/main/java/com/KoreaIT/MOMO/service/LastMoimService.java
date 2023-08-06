package com.KoreaIT.MOMO.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KoreaIT.MOMO.repository.LastMoimRepository;
import com.KoreaIT.MOMO.util.Util;
import com.KoreaIT.MOMO.vo.LastMoim;
import com.KoreaIT.MOMO.vo.ResultData;

@Service
public class LastMoimService {

	private LastMoimRepository lastmoimRepository;

	@Autowired
	public LastMoimService(LastMoimRepository lastmoimRepository) {
		this.lastmoimRepository = lastmoimRepository;
	}

	public void writeLastMoim(int memberId, String moimMain, String moimBody, String moimImg, String moimDatetime, String moimPlace, String moimMemberCnt, String moimPrice) {
		lastmoimRepository.writeLastMoim(memberId, moimMain, moimBody, moimImg, moimDatetime, moimPlace, moimMemberCnt, moimPrice);
	}

	public int getLastInsertId() {
		return lastmoimRepository.getLastInsertId();
	}

	public LastMoim getLastMoimById(int id) {
		return lastmoimRepository.getLastMoimById(id);
	}

	public List<LastMoim> getLastMoims(){

		return lastmoimRepository.getLastMoims();
	}

	public void modifyLastMoim(int id, String moimMain, String moimBody) {
		lastmoimRepository.modifyLastMoim(id, moimMain, moimBody);
		
	}

	public void deleteLastMoim(int id) {
		lastmoimRepository.deleteLastMoim(id);
	}
	
	public ResultData actorCanMD(int loginedMemberId, LastMoim lastmoim) {
		if(lastmoim == null) {
			return ResultData.from("F-1", "해당 게시물은 존재하지 않습니다");
		}

		if (loginedMemberId != lastmoim.getMemberId()) {
			return ResultData.from("F-B", "해당 게시물에 대한 권한이 없습니다");
		}
		
		return ResultData.from("S-1", "가능");
	}
	
	
	public LastMoim getForPrintLastMoim(int id) {

		LastMoim lastmoim = lastmoimRepository.getForPrintLastMoim(id);

		return lastmoim;
	}

	public void actorCanChangeData(int loginedMemberId, LastMoim lastmoim) {
		
		ResultData actorCanChangeDataRd = actorCanMD(loginedMemberId, lastmoim);

		lastmoim.setActorCanChangeData(actorCanChangeDataRd.isSuccess());
	}
	
	public int getLastMoimsCnt(int boardId) {
		return lastmoimRepository.getLastMoimsCnt(boardId);
	}
	
	
}

package com.KoreaIT.MOMO.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KoreaIT.MOMO.repository.ReplyRepository;
import com.KoreaIT.MOMO.util.Util;
import com.KoreaIT.MOMO.vo.ResultData;

@Service
public class ReplyService {

	private ReplyRepository replyRepository;

	@Autowired
	public ReplyService(ReplyRepository replyRepository) {
		this.replyRepository = replyRepository;
	}

	public ResultData<Integer> writeReply(int loginedMemberId, String relTypeCode, int relId, String body) {
		replyRepository.writeReply(loginedMemberId, relTypeCode, relId, body);

		int id = replyRepository.getLastInsertId();

		return ResultData.from("S-1", Util.f("%d번 댓글이 등록되었습니다", id), "id", id);
	}
	
}

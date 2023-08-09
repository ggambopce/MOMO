package com.KoreaIT.MOMO.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KoreaIT.MOMO.repository.ReactionPointRepository;
import com.KoreaIT.MOMO.vo.ReactionPoint;

@Service
public class ReactionPointService {

	private ReactionPointRepository reactionPointRepository;

	@Autowired
	public ReactionPointService(ReactionPointRepository reactionPointRepository) {
		this.reactionPointRepository = reactionPointRepository;
	}

	public ReactionPoint getReactionPoint(int loginedMemberId, int relId, String relTypeCode) {
		return reactionPointRepository.getReactionPoint(loginedMemberId, relId, relTypeCode);
	}
	
	public void doInsertReactionPoint(int loginedMemberId, int relId, String relTypeCode, int point) {
		reactionPointRepository.doInsertReactionPoint(loginedMemberId, relId, relTypeCode, point);
	}
	
	public void doDeleteReactionPoint(int loginedMemberId, int relId, String relTypeCode) {
		reactionPointRepository.doDeleteReactionPoint(loginedMemberId, relId, relTypeCode);
	}
}

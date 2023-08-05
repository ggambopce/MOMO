package com.KoreaIT.MOMO.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.KoreaIT.MOMO.vo.Mmaker;

@Mapper
public interface MmakerRepository {

	public void writeMmaker(int memberId, String moimMain, String moimBody, String moimImg, String moimDatetime, String moimPlace, String moimMemberCnt, String moimPrice);

	public int getLastInsertId();

	public Mmaker getMmakerById(int id);

	public List<Mmaker> getMmakers();

	public void modifyMmaker(int id, String title, String body);
	
	public void deleteMmaker(int id);
	
	public Mmaker getForPrintMmaker(int id);
	
	public int getMmakersCnt(int boardId);
}
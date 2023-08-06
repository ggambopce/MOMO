package com.KoreaIT.MOMO.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.KoreaIT.MOMO.vo.LastMoim;

@Mapper
public interface LastMoimRepository {

	public void writeLastMoim(int memberId, String moimMain, String moimBody, String moimImg, String moimDatetime, String moimPlace, String moimMemberCnt, String moimPrice);

	public int getLastInsertId();

	public LastMoim getLastMoimById(int id);

	public List<LastMoim> getLastMoims();

	public void modifyLastMoim(int id, String title, String body);
	
	public void deleteLastMoim(int id);
	
	public LastMoim getForPrintLastMoim(int id);
	
	public int getLastMoimsCnt(int boardId);
}
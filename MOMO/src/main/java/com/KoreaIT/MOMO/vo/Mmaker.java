package com.KoreaIT.MOMO.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Mmaker {

	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
	private String moimMain;
	private String moimBody;
	private String writerName;
	private String moimImg;
	private String moimDatetime;
	private String moimPlace;
	private String moimMemberCnt;
	private String moimPrice;
	private String moimAim;
	private String moimCategory;
	private boolean actorCanChangeData;
	
}

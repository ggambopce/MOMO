package com.KoreaIT.MOMO.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Participation {
	private int id;
	private String regDate;
	private String updateDate;
	private String memberId;
	private String relTypeCode;
	private int relId;
	private String participationStatus;
	private String participationTF;
}

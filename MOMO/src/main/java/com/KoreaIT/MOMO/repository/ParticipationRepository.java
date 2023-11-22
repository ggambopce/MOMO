package com.KoreaIT.MOMO.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.KoreaIT.MOMO.repository.ParticipationRepository;
import com.KoreaIT.MOMO.vo.Mmaker;
import com.KoreaIT.MOMO.vo.Participation;

@Mapper
public interface ParticipationRepository {

	@Select("""
		SELECT P.*, M.name AS writerName
			FROM SB_AM.participation AS A
			INNER JOIN SB_AM.member AS M
			ON P.memberId = M.id OR P.memberId = 0
			ORDER BY id DESC
			
			""")
	public List<Participation> getParticipations();
	

	@Select("""
		SELECT A.*, M.name AS writerName 
			FROM SB_AM.mmaker AS A
			INNER JOIN SB_AM.member AS M
			ON A.memberId = M.id
			WHERE A.id = #{id}	
				
			""")
	public Participation getForPrintParticipation(int id);


	@Select("""
		INSERT INTO 'participation'
		SET regDate = NOW(),
		updateDate = NOW(),
		memberId = #{memberId},	
		relTypeCode = #{relTypeCode},
		relId = #{relId},
		participationStatus = #{participationStatus},
		participationTF = #{participationTF}	
			"""
			)
	public void doParticipation(int memberId, String relTypeCode, int relId, String participationStatus,
			String participationTF);

	
}


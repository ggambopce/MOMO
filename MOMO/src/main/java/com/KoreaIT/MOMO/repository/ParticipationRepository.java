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
			With AM AS (
			SELECT A.*, M.name AS writerName
				FROM SB_AM.mmaker AS A
				INNER JOIN SB_AM.member AS M
				ON A.memberId = M.id OR A.memberId = 0
			)
			SELECT AM.*
	        	FROM AM
            	LEFT JOIN SB_AM.participation AS PP
            	ON PP.relTypeCode = 'participaion'
            	AND PP.relId = AM.id

			    GROUP BY AM.id
			    ORDER BY AM.id DESC
			""")
	public List<Participation> getParticipations();
	

	@Select("""
			SELECT A.*, M.name AS writerName
				FROM SB_AM.mmaker AS A
				INNER JOIN SB_AM.member AS M
				ON A.memberId = M.id OR A.memberId = 0
				
			""")
	public Participation getForPrintParticipation(int id);

}


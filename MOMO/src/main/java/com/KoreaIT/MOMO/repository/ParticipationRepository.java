package com.KoreaIT.MOMO.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.KoreaIT.MOMO.repository.ParticipationRepository;
import com.KoreaIT.MOMO.vo.Member;

@Mapper
public interface ParticipationRepository {

	@Insert("""
			INSERT INTO `member`
				SET regDate = NOW(),
					updateDate = NOW(),
					loginId = #{loginId},
					loginPw = #{loginPw},
					`name` = #{name},
					nickname = #{nickname},
					cellphoneNum = #{cellphoneNum}
					gender = #{gender},
					birthday = #{birthday}
			""")
	public void doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String gender, String birthday);

	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

	@Select("""
			SELECT *
				FROM `member`
				WHERE id = #{id}
			""")
	public Member getMemberById(int id);
	
	@Select("""
			SELECT *
				FROM `member`
				WHERE loginId = #{loginId}
			""")
	
	public Member getMemberByLoginId(String loginId);
	
	@Select("""
			SELECT *
				FROM `member`
				WHERE nickname = #{nickname}
			""")
	public Member getMemberByNickname(String nickname);

	@Select("""
			SELECT *
				FROM `member`
				WHERE `name` = #{name}
				AND cellphoneNum = #{cellphoneNum}
			""")
	public Member getMemberByNameAndCellphoneNum(String name, String cellphoneNum);
	
	@Select("""
			SELECT *
				FROM `member`
				WHERE gender = #{gender}
			""")
	public Member getMemberByGender(String gender);
	
	@Select("""
			SELECT *
				FROM `member`
				WHERE birthday = #{birthday}
			""")
	public Member getMemberByBirthday(String birthday);
}

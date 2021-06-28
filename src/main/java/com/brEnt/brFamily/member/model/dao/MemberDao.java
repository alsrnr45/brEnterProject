package com.brEnt.brFamily.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.member.model.vo.Member;

@Repository
public class MemberDao {
	
	//실행할 SQL문 
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m); 
	}
	
	
	
	
}

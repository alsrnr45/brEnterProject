package com.brEnt.brFamily.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.member.model.vo.Member;

@Repository
public class MemberDao {
	
	//실행할 SQL문 
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m); 
	}

	
	
	public ArrayList<Member> newMemberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.newMemberList");
	}



	public ArrayList<Member> memberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.memberList");
	}



	public Member memberDetail(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.memberDetail", memNo);
	}

	public Member newMemberDetail(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.newMemberDetail", memNo);
	}
	
	
	
	
}

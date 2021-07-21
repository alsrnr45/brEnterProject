package com.brEnt.brFamily.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.elecApproval.model.vo.ElecApproval;
import com.brEnt.brFamily.member.model.vo.Member;

@Repository
public class MemberDao {
	
	// 작성자 : 정예빈 - 로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m); 
	}

	
	// 작성자 : 김혜미 - 신규사원 리스트조회
	public ArrayList<Member> newMemberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.newMemberList");
	}
	
	
	// 작성자 : 김혜미 - 신규사원 상세조회
	public Member newMemberDetail(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.newMemberDetail", memNo);
	}

	
	// 작성자 : 김혜미 - 신규사원 등록
	public int enrollNewMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.enrollNewMember", m); 
	}

	
	// 작성자 : 김혜미 - 신규사원 반려
	public int returnMember(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.update("memberMapper.returnMember", memNo);
	}
	
	
	// 작성자 : 김혜미 - 사원 리스트조회
	public ArrayList<Member> memberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.memberList");
	}


	// 작성자 : 김혜미 - 사원 상세조회
	public Member memberDetail(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.memberDetail", memNo);
	}

	
	// 작성자 : 김혜미 - 사원 수정
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	// 작성자 : 김혜미 - 사원 탈퇴
	public int deleteMember(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.update("memberMapper.deleteMember", memNo);
	}
	
	
	// 작성자 : 최선희 -- 전자결재 기안함 리스트 조회
	public ArrayList<ElecApproval> selectApprovalTotalList(SqlSessionTemplate sqlSession) { 
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalTotalList");
	}


	
	
}

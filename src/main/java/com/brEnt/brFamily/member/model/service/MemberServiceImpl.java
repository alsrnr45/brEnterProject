package com.brEnt.brFamily.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.member.model.dao.MemberDao;
import com.brEnt.brFamily.member.model.vo.Member;

//@Component (전체적으로 두루 쓰이는 어노테이션) 
@Service // Service의 역할을 가진 클래스 빈 등록
public class MemberServiceImpl implements MemberService {
	
	
	@Autowired		
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao mDao; 
	
	
	@Override
	public Member loginMember(Member m) {

		Member loginUser =mDao.loginMember(sqlSession,m);
		return loginUser;
	}

	@Override
	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int idCheck(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}



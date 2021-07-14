package com.brEnt.brFamily.artist.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.artist.model.vo.Artist;
import com.brEnt.brFamily.common.model.vo.PageInfo;

@Repository
public class ArtistDao {
	
	// 리스트 개수 조회
	public int selectArtistListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("artistMapper.selectArtistListCount");
	}
	
	// 아티스트 리스트 조회 (페이징처리)
	public ArrayList<Artist> selectArtistList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getProductLimit();
		int limit = pi.getProductLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("artistMapper.selectArtistList", null, rowBounds);
		
	}
	
	public Artist selectArtistDetail(SqlSessionTemplate sqlSession, int ano) {
		return sqlSession.selectOne("artistMapper.selectArtistDetail", ano);
	}

}

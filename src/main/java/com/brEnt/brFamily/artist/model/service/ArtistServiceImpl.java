package com.brEnt.brFamily.artist.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.artist.model.dao.ArtistDao;
import com.brEnt.brFamily.artist.model.vo.Artist;
import com.brEnt.brFamily.common.model.vo.PageInfo;

@Service
public class ArtistServiceImpl implements ArtistService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ArtistDao aDao;

	// 리스트 개수 조회
	@Override
	public int selectArtistListCount() {
		return aDao.selectArtistListCount(sqlSession);
	}
	
	// 아티스트 리스트 조회 (페이징처리)
	@Override
	public ArrayList<Artist> selectArtistList(PageInfo pi) {
		return aDao.selectArtistList(sqlSession, pi);
	}

	@Override
	public Artist selectArtistDetail(int ano) {
		return aDao.selectArtistDetail(sqlSession, ano);
	}

	
	
}

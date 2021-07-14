package com.brEnt.brFamily.artist.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.artist.model.vo.Artist;
import com.brEnt.brFamily.common.model.vo.PageInfo;

public interface ArtistService {

	// 리스트 개수 조회
	int selectArtistListCount();
	
	// 아티스트 리스트 조회 (페이징처리)
	ArrayList<Artist> selectArtistList(PageInfo pi);
	
	// 아티스트 상세 조회
	Artist selectArtistDetail(int ano);
	
}

package com.brEnt.brFamily.artist.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.brEnt.brFamily.artist.model.service.ArtistService;
import com.brEnt.brFamily.artist.model.vo.Artist;
import com.brEnt.brFamily.common.model.vo.PageInfo;
import com.brEnt.brFamily.common.template.Pagination;

@Controller
public class ArtistController {
	
	@Autowired
	private ArtistService aService;
	
	// 아티스트 리스트 조회
	@RequestMapping("artistList.art")
	public ModelAndView artlistList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		// 리스트 개수 조회
		int listCount = aService.selectArtistListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 6);
		
		// 아티스트 리스트 조회 (페이징처리)  
		ArrayList<Artist> list = aService.selectArtistList(pi);
		  
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("artist/artistList");
		  
		return mv;
			      
	}
	
	// 아티스트 상세조회
	@RequestMapping("artistDetail.art")
	public String artistDetail(int ano, Model model) {
		
		Artist a = aService.selectArtistDetail(ano);
		model.addAttribute("a", a);
		
		return "artist/artistDetail";
	
	}
}

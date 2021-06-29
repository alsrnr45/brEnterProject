package com.brEnt.brFamily.artist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.brEnt.brFamily.artist.model.service.ArtistService;

@Controller
public class ArtistController {

	private ArtistService artistService;
	
	@RequestMapping("artistList.art")
	public String artlistList() {
		return "artist/artistList";
	}
	
	@RequestMapping("artistDetail.art")
	public String artistDetail() {
		return "artist/artistDetail";
	}
}

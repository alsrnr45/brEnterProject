package com.brEnt.brFamily.phoneBook.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.brEnt.brFamily.member.model.vo.Dept;
import com.brEnt.brFamily.member.model.vo.Member;
import com.brEnt.brFamily.member.model.vo.Position;
import com.brEnt.brFamily.phoneBook.model.service.PhoneBookService;
import com.google.gson.Gson;

@Controller
public class PhoneBookController {
	
	@Autowired
	private PhoneBookService pbService;
	
	
	@RequestMapping("list.pb")
	public String receiveMailListView() {
		return "phoneBook/phoneBookListView";
	}
	
	@ResponseBody
	@RequestMapping(value="popup.pb", produces="application/json; charset=utf-8")
	public String popupView() {
		
		ArrayList<Member> mlist = pbService.popupView();
		ArrayList<Dept> dlist = pbService.popupDeptView();
		ArrayList<Position> plist = pbService.popupPositionView();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("mlist", mlist);
		map.put("dlist", dlist);
		map.put("plist", plist);
		
		return new Gson().toJson(map);
	}
}

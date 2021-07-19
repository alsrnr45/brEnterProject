package com.brEnt.brFamily.phoneBook.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.member.model.vo.Dept;
import com.brEnt.brFamily.member.model.vo.Member;
import com.brEnt.brFamily.member.model.vo.Position;

public interface PhoneBookService {

	ArrayList<Member> popupView();
	ArrayList<Dept> popupDeptView();
	ArrayList<Position> popupPositionView();

}

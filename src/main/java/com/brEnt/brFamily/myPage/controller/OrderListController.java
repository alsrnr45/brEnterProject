package com.brEnt.brFamily.myPage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.brEnt.brFamily.member.model.vo.Member;
import com.brEnt.brFamily.myPage.model.service.OrderListService;
import com.brEnt.brFamily.myPage.model.vo.OrderList;

@Controller
public class OrderListController {

	// 작성자 : 박지은 - 주문 내역 조회
	@Autowired 
	private OrderListService olService;
	
	@RequestMapping("orderlist.mp")
	public String orderList(HttpSession session, Model m) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo();
		List<OrderList> orderList = olService.orderList(memNo);
		
		m.addAttribute("orderList",orderList);
	return "myPage/orderList";
	}
}

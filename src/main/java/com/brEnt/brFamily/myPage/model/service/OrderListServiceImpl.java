package com.brEnt.brFamily.myPage.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.myPage.model.dao.OrderListDao;
import com.brEnt.brFamily.myPage.model.vo.OrderList;

@Service
public class OrderListServiceImpl implements OrderListService{

	// 작성자 : 박지은 - 주문내역 조회
	@Autowired
	OrderListDao oDao;
	
	@Override
	public List<OrderList> orderList(int memNo) {
		return oDao.orderList(memNo);
	}

}

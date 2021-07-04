package com.brEnt.brFamily.myPage.model.service;

import java.util.ArrayList;
import java.util.List;

import com.brEnt.brFamily.myPage.model.vo.OrderList;

public interface OrderListService {

	// 작성자 : 박지은 - 주문내역 조회
	List<OrderList> orderList(int memNo);

}

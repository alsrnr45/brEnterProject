package com.brEnt.brFamily.store.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.store.model.vo.Cart;

public interface CartService {
	
	// 작성자 : 박지은 - 장바구니 조회
	ArrayList<Cart> cartList(int memNo) throws Exception;

}

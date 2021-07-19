package com.brEnt.brFamily.store.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.store.model.dao.CartDao;
import com.brEnt.brFamily.store.model.vo.Cart;

@Service
public class CartServiceImpl implements CartService {

	// 작성자 : 박지은 - 장바구니 조회
	@Autowired
	CartDao cDao;
	
	@Override
	public ArrayList<Cart> cartList(int memNo) throws Exception {
		return (ArrayList<Cart>) cDao.cartList(memNo);
	}

	@Override
	public void insertCart(Cart cart) throws Exception {
		cDao.insertCart(cart);
	}

	@Override
	public void deleteCart(Cart cart) throws Exception {
		cDao.cartDelete(cart);
	}

}

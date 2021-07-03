package com.brEnt.brFamily.store.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.store.model.vo.Cart;

@Repository
public class CartDao {
	
	// 작성자 - 박지은 : 장바구니 조회
	@Autowired
	SqlSessionTemplate sqlSession;

	public List<Cart> cartList(int memNo) {
		return sqlSession.selectList("storeMapper.cartList", memNo);
	}

}

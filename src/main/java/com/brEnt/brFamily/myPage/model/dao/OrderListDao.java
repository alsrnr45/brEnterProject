package com.brEnt.brFamily.myPage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.myPage.model.vo.OrderList;

@Repository
public class OrderListDao {

	// 작성자 : 박지은 - 주문내역 조회
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<OrderList> orderList(int memNo) {
		return sqlSession.selectList("mypageMapper.orderList", memNo);
	}

}

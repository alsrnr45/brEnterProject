package com.brEnt.brFamily.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class storeController {

	// 작성자 : 김혜미 -- 스토어 리스트
	@RequestMapping("storeList.st")
	public String storeList() {
		return "store/storeList";
	}
	
	// 작성자 : 김혜미 -- 스토어 디테일
	@RequestMapping("storeDetail.st")
	public String storeDetail() {
		return "store/storeDetail";
	}
	
	// 작성자 : 김혜미 -- 결제
	@RequestMapping("order.st")
	public String order() {
		return "store/order";
	}
	
	// 작성자 : 김혜미 -- 주문완료
	@RequestMapping("orderFinish.st")
	public String orderFinish() {
		return "store/orderFinish";
	}
	
	// 작성자 : 김혜미 -- 상품관리 리스트
	@RequestMapping("productList.admin")
	public String productList() {
		return "store/adminProductList";
	}
	
	// 작성자 : 김혜미 -- 상품관리 상세
	@RequestMapping("productDetail.admin")
	public String productDetail() {
		return "store/adminProductDetail";
	}
	
	// 작성자 : 김혜미 -- 상품관리 등록
	@RequestMapping("productUpdate.admin")
	public String productUpdate() {
		return "store/adminProductUpdate";
	}

	// 작성자 : 김혜미 -- 상품관리 등록
	@RequestMapping("productEnroll.admin")
	public String productEnroll() {
		return "store/adminProductEnroll";
	}
		
}

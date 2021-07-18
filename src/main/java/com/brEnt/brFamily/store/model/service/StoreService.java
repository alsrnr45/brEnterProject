package com.brEnt.brFamily.store.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.common.model.vo.PageInfo;
import com.brEnt.brFamily.store.model.vo.PayDto;
import com.brEnt.brFamily.store.model.vo.Product;

public interface StoreService {

	// 작성자 : 김혜미 -- 상품 리스트 조회 (페이징처리)
	int selectProductListCount();
	ArrayList<Product> selectProductList(PageInfo pi);     
   
	// 작성자 : 김혜미 -- 카테고리별 상품 리스트 조회 (페이징처리)
	int selectCtgProductListCount(String pdtCtg);
	ArrayList<Product> selectCtgProductList(PageInfo pi, String pdtCtg);
	
	// 작성자 : 김혜미 -- 상품 검색 리스트조회
	int selectSearchListCount(String keyword);
	ArrayList<Product> selectSearchList(PageInfo pi, String keyword);
	
	// 작성자 : 김혜미 -- 상품 상세조회
	Product selectProductDetail(int pno);
   
	// 작성자 : 김혜미 -- 바로 구매하기
	Product buyNowProduct(int pno);
	   
	// 작성자 : 김혜미 -- 상품 리스트 조회 (관리자)
	ArrayList<Product> selectProductListAdmin();
	
	// 작성자 : 김혜미 -- 상품 상세조회 (관리자)
	Product selectProductDetailAdmin(int pno);
	 
	// 작성자 : 김혜미 -- 상품 등록 (관리자)
	int insertProduct(Product p);
	 
	// 작성자 : 김혜미 -- 상품 수정 (관리자)
	int updateProduct(Product p);
	
	// 작성자 : 김혜미 -- 상품 삭제 (관리자)
	int deleteProduct(int pno);
	
	// 작성자 : 김혜미 -- 주문 등록
	int orderInsert(PayDto pd);
	
}
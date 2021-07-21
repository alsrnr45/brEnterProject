package com.brEnt.brFamily.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.common.model.vo.PageInfo;
import com.brEnt.brFamily.store.model.dao.StoreDao;
import com.brEnt.brFamily.store.model.vo.PayDto;
import com.brEnt.brFamily.store.model.vo.Product;

@Service
public class StoreServiceImpl implements StoreService {
   
   @Autowired
   private SqlSessionTemplate sqlSession;
   @Autowired
   private StoreDao sDao;
   
   
   // 작성자 : 김혜미 - 스토어 리스트 조회
   @Override 
   public int selectProductListCount() {
      return sDao.selectProductListCount(sqlSession);
   }   
   @Override 
   public ArrayList<Product> selectProductList(PageInfo pi) {
      return sDao.selectProductList(sqlSession, pi);
   }
   
   
   // 작성자 : 김혜미 - 카테고리별 스토어 리스트조회
   @Override
   public int selectCtgProductListCount(String pdtCtg) {
	   return sDao.selectCtgProductListCount(sqlSession, pdtCtg);
   }
   @Override
   public ArrayList<Product> selectCtgProductList(PageInfo pi, String pdtCtg) {
	   return sDao.selectCtgProductList(sqlSession, pi, pdtCtg);
   }
   
   
   // 작성자 : 김혜미 - 검색별 스토어 리스트조회
   @Override
   public int selectSearchListCount(String keyword) {
      return sDao.selectSearchListCount(sqlSession, keyword);
   }      
   @Override
   public ArrayList<Product> selectSearchList(PageInfo pi, String keyword) {
      return sDao.selectSearchList(sqlSession, pi, keyword);
   }
   
   
   // 작성자 : 김혜미 - 상품 상세조회
   @Override 
   public Product selectProductDetail(int pno) {
	   return sDao.selectProductDetail(sqlSession, pno);
   }
   
   
   // 작성자 : 김혜미 - 바로 구매하기
   @Override 
   public Product buyNowProduct(int pno) {
   	return sDao.buyNowProduct(sqlSession, pno);
   }
   
  
   // 작성자 : 김혜미 - 상품 리스트 조회 (관리자)
   @Override 
   public ArrayList<Product> selectProductListAdmin() {
	   return sDao.selectProductListAdmin(sqlSession);
   }

   
   // 작성자 : 김혜미 - 상품 상세조회 (관리자)
   @Override 
   public Product selectProductDetailAdmin(int pno) {
	   return sDao.selectProductDetailAdmin(sqlSession, pno);
   }

   
   // 작성자 : 김혜미 - 상품 등록 (관리자)
   @Override 
   public int insertProduct(Product p) {
	   return sDao.insertProduct(sqlSession, p);
   }


   // 작성자 : 김혜미 - 상품 수정 (관리자)
   @Override 
   public int updateProduct(Product p) {
	   return sDao.updateProduct(sqlSession, p);
   }

   
   // 작성자 : 김혜미 - 상품 삭제 (관리자)
   @Override 
   public int deleteProduct(int pno) {
	   return sDao.deleteProduct(sqlSession, pno);
   }


   // 작성자 : 김혜미 - 주문 등록
   @Override 
   public int orderInsert(PayDto pd) {
	   return sDao.orderInsert(sqlSession, pd);
   }

   
}
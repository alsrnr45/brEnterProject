package com.brEnt.brFamily.store.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.common.model.vo.PageInfo;
import com.brEnt.brFamily.store.model.dao.StoreDao;
import com.brEnt.brFamily.store.model.vo.Product;

@Service
public class StoreServiceImpl implements StoreService {
   
   @Autowired
   private SqlSessionTemplate sqlSession;
   @Autowired
   private StoreDao sDao;
   
   
   @Override // 작성자 : 김혜미 -- 상품 개수 조회
   public int selectProductListCount() {
      return sDao.selectProductListCount(sqlSession);
   }   

   
   @Override // 작성자 : 김혜미 -- 상품 리스트 조회 (페이징처리)
   public ArrayList<Product> selectProductList(PageInfo pi) {
      return sDao.selectProductList(sqlSession, pi);
   }

   
   @Override // 작성자 : 김혜미 -- 상품 상세조회
   public Product selectProductDetail(int pno) {
	   return sDao.selectProductDetail(sqlSession, pno);
   }
   
   
   @Override // 작성자 : 김혜미 -- 바로 구매하기
   public Product buyNowProduct(int pno) {
   	return sDao.buyNowProduct(sqlSession, pno);
   }
   
   
   
   @Override // 작성자 : 김혜미 -- 상품 리스트 조회 (관리자)
   public ArrayList<Product> selectProductListAdmin() {
	   return sDao.selectProductListAdmin(sqlSession);
   }

   
   @Override // 작성자 : 김혜미 -- 상품 상세조회 (관리자)
   public Product selectProductDetailAdmin(int pno) {
	   return sDao.selectProductDetailAdmin(sqlSession, pno);
   }

   
   @Override // 작성자 : 김혜미 -- 상품 등록 (관리자)
   public int insertProduct(Product p) {
      // TODO Auto-generated method stub
      return 0;
   }

   
   @Override // 작성자 : 김혜미 -- 상품 수정 (관리자)
   public int updateProduct(Product p) {
      // TODO Auto-generated method stub
      return 0;
   }

   
   @Override // 작성자 : 김혜미 -- 상품 삭제 (관리자)
   public int deleteProduct(int pdtNo) {
      // TODO Auto-generated method stub
      return 0;
   }




   
}
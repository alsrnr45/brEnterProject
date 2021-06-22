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
	
	// 작성자 : 김혜미 -- 상품 리스트 조회 (페이징처리)
	@Override
	public int selectProductListCount() {
		return sDao.selectProductListCount(sqlSession);
	}	

	// 작성자 : 김혜미 -- 상품 리스트 조회 (페이징처리)
	@Override
	public ArrayList<Product> selectProductList(PageInfo pi) {
		return sDao.selectProductList(sqlSession, pi);
	}

	// 작성자 : 김혜미 -- 상품 상세조회
	@Override
	public Product selectProductDetail(int pdtNo) {
		// TODO Auto-generated method stub
		return null;
	}

	// 작성자 : 김혜미 -- 상품 리스트 조회 (관리자)
	@Override
	public ArrayList<Product> selectProductListAdmin(int pdtNo) {
		// TODO Auto-generated method stub
		return null;
	}

	// 작성자 : 김혜미 -- 상품 상세조회 (관리자)
	@Override
	public Product selectProductDetailAdmin(int pdtNo) {
		// TODO Auto-generated method stub
		return null;
	}

	// 작성자 : 김혜미 -- 상품 등록 (관리자)
	@Override
	public int insertProduct(Product p) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 작성자 : 김혜미 -- 상품 수정 (관리자)
	@Override
	public int updateProduct(Product p) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 작성자 : 김혜미 -- 상품 삭제 (관리자)
	@Override
	public int deleteProduct(int pdtNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}

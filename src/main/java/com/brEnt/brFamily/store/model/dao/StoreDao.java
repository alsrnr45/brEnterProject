package com.brEnt.brFamily.store.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.common.model.vo.PageInfo;
import com.brEnt.brFamily.store.model.vo.PayDto;
import com.brEnt.brFamily.store.model.vo.Product;

@Repository
public class StoreDao {

	// 작성자 : 김혜미 - 스토어 리스트조회
	public int selectProductListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("storeMapper.selectProductListCount");
	}
	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getProductLimit();
		int limit = pi.getProductLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("storeMapper.selectProductList", null, rowBounds);
	}
	
	
	// 작성자 : 김혜미 - 카테고리별 스토어 리스트조회
	public int selectCtgProductListCount(SqlSessionTemplate sqlSession, String pdtCtg) {
		return sqlSession.selectOne("storeMapper.selectCtgProductListCount", pdtCtg);
	}
	public ArrayList<Product> selectCtgProductList(SqlSessionTemplate sqlSession, PageInfo pi, String pdtCtg) {
		int offset = (pi.getCurrentPage() - 1) * pi.getProductLimit();
		int limit = pi.getProductLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("storeMapper.selectCtgProductList", pdtCtg, rowBounds);
	}
	
	
	// 작성자 : 김혜미 - 검색별 스토어 리스트조회
	public int selectSearchListCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("storeMapper.selectSearchListCount", keyword);
	}
	public ArrayList<Product> selectSearchList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword) {
		int offset = (pi.getCurrentPage() - 1) * pi.getProductLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getPageLimit());
		return (ArrayList)sqlSession.selectList("storeMapper.selectSearchList", keyword, rowBounds);
	}
	
	
	// 작성자 : 김혜미 -- 상품 상세조회
	public Product selectProductDetail(SqlSessionTemplate sqlSession, int pdtNo) {
		return sqlSession.selectOne("storeMapper.selectProductDetail", pdtNo);
	}

	
	// 작성자 : 김혜미 -- 바로 구매하기
	public Product buyNowProduct(SqlSessionTemplate sqlSession, int pdtNo) {
		return sqlSession.selectOne("storeMapper.buyNowProduct", pdtNo);
	}
	
	
	// 작성자 : 김혜미 -- 상품 리스트 조회 (관리자)
	public ArrayList<Product> selectProductListAdmin(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("storeMapper.selectProductListAdmin");
	}

	
	// 작성자 : 김혜미 -- 상품 상세조회 (관리자)
	public Product selectProductDetailAdmin(SqlSessionTemplate sqlSession, int pdtNo) {
		return sqlSession.selectOne("storeMapper.selectProductDetailAdmin", pdtNo);
	}
	
	
	// 작성자 : 김혜미 -- 상품관리 등록
	public int orderInsert(SqlSessionTemplate sqlSession, PayDto pd) {
		return sqlSession.insert("storeMapper.orderInsert", pd);
	}
	

	// 작성자 : 김혜미 - 상품관리 수정
	public int updateProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.update("storeMapper.updateProduct", p);
	}

	
	// 작성자 : 김혜미 - 상품 등록 (관리자)
	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("storeMapper.insertProduct", p);
	}

	// 작성자 : 김혜미 - 상품 삭제 (관리자)
	public int deleteProduct(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.delete("storeMapper.deleteProduct", pno);
	}



}
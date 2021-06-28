package com.brEnt.brFamily.store.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.brEnt.brFamily.common.model.vo.PageInfo;
import com.brEnt.brFamily.common.template.Pagination;
import com.brEnt.brFamily.store.model.service.StoreService;
import com.brEnt.brFamily.store.model.vo.Product;

@Controller
public class StoreController {

   @Autowired
   private StoreService sService;
   
   // 작성자 : 김혜미 -- 스토어 리스트 조회
   @RequestMapping("storeList.st")
   public ModelAndView selectProductList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {

      int listCount = sService.selectProductListCount();
      PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 6);
      
      ArrayList<Product> list = sService.selectProductList(pi);
      
      mv.addObject("pi", pi)
        .addObject("list", list)
        .setViewName("store/storeList");
      System.out.println(list);
      
      return mv;
   }
   
   // 작성자 : 김혜미 -- 스토어 상세조회
   @RequestMapping("storeDetail.st")
   public String selectProductDetail(int pno, Model model) {
	   
		Product p = sService.selectProductDetail(pno); 
		model.addAttribute("p", p);
		
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
   
   // 작성자 : 김혜미 -- 상품관리 리스트 조회 (관리자)
   @RequestMapping("productList.admin")
   public ModelAndView productList(ModelAndView mv) {
	   
	  ArrayList<Product> list = sService.selectProductListAdmin();
	  
	  mv.addObject("list", list)
      	.setViewName("store/adminProductList");
	  
	  return mv;
   }
   
   // 작성자 : 김혜미 -- 상품관리 상세조회 (관리자)
   @RequestMapping("productDetail.admin")
   public String selectProductDetailAdmin(int pno, Model model) {
	   
		Product p = sService.selectProductDetailAdmin(pno); 
		model.addAttribute("p", p);
		
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
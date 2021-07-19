package com.brEnt.brFamily.store.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.brEnt.brFamily.common.model.vo.PageInfo;
import com.brEnt.brFamily.common.template.Pagination;
import com.brEnt.brFamily.store.model.service.StoreService;
import com.brEnt.brFamily.store.model.vo.PayDto;
import com.brEnt.brFamily.store.model.vo.Product;

@Controller
public class StoreController {

   @Autowired
   private StoreService sService;
   
   // 작성자 : 김혜미 - 스토어 리스트 조회
   @RequestMapping("storeList.st")
   public ModelAndView selectProductList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
		   								 ModelAndView mv) {

      int listCount = sService.selectProductListCount();
      PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 6);
      
      ArrayList<Product> list = sService.selectProductList(pi);
      
      mv.addObject("pi", pi)
        .addObject("list", list)
        .setViewName("store/storeList");
      //System.out.println(list);
      
      return mv;
   }
   
   // 작성자 : 김혜미 - 스토어 리스트 조회
   @RequestMapping("storeCtgList.st")
   public ModelAndView selectCtgProductList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
		   								 String pdtCtg,ModelAndView mv) {

      int listCount = sService.selectCtgProductListCount(pdtCtg);
      PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 6);
      
      ArrayList<Product> list = sService.selectCtgProductList(pi, pdtCtg);
      
      mv.addObject("pi", pi)
        .addObject("list", list)
        .setViewName("store/storeList");
      //System.out.println(list);
      
      return mv;
   }
   
   // 작성자 : 김혜미 - 스토어 검색 조회
   @RequestMapping("search.st")
   public ModelAndView selectSearchList(int currentPage, String keyword, ModelAndView mv) {

	   int listCount = sService.selectSearchListCount(keyword);
       PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 6, 10);
       ArrayList<Product> list = sService.selectSearchList(pi, keyword);
       
       //System.out.println(keyword);
       //System.out.println(listCount);
       //System.out.println(list);

       mv.addObject("pi", pi)
         .addObject("list", list)
         .addObject("keyword", keyword)
         .setViewName("store/storeList");

       return mv;
   }
   
   // 작성자 : 김혜미 - 스토어 상세조회
   @RequestMapping("storeDetail.st")
   public String selectProductDetail(int pno, Model model) {
	   
		Product p = sService.selectProductDetail(pno); 
		model.addAttribute("p", p);
		
		return "store/storeDetail";
   }

   // 작성자 : 김혜미 - 바로구매하기
   @RequestMapping("buyNow.st")
   public String buyNowProduct(int pno, int pco, Model model) {
	   
	   model.addAttribute("pco", pco);
	   Product p = sService.buyNowProduct(pno);
	   model.addAttribute("p", p);
	   
	   return "store/buyNow";
   }
   
   // 작성자 : 김혜미 - 결제
   @RequestMapping("order.st")
   public String order() {
      return "store/order";
   }
 
   // 작성자 : 김혜미 - 주문완료
   @RequestMapping("orderFinish.st")
   public String orderFinish(PayDto pd) {
	   
	   //System.out.println(pd);
	   int result = sService.orderInsert(pd);
	   return "store/orderFinish";
   }
   
   // 작성자 : 김혜미 - 상품 리스트 조회 (관리자)
   @RequestMapping("productList.admin")
   public ModelAndView productList(ModelAndView mv) {
	   
	  ArrayList<Product> list = sService.selectProductListAdmin();
	  
	  mv.addObject("list", list)
      	.setViewName("store/adminProductList");
	  
	  return mv;
   }
   
   // 작성자 : 김혜미 - 상품 상세조회 (관리자)
   @RequestMapping("productDetail.admin")
   public String selectProductDetailAdmin(int pno, Model model) {
	   
		Product p = sService.selectProductDetailAdmin(pno); 
		model.addAttribute("p", p);
		
		return "store/adminProductDetail";
   }
   
   // 작성자 : 김혜미 - 상품 수정폼
   @RequestMapping("productUpdateForm.admin")
   public String productUpdateForm(int pno, Model model) {
	   
	   Product p = sService.selectProductDetailAdmin(pno); 
	   model.addAttribute("p", p);
	   
      return "store/adminProductUpdate";
   }
   
   // 작성자 : 김혜미 - 상품 수정
   @RequestMapping("updateProduct.admin")
   public String updateProduct(Product p, MultipartFile upfile, HttpSession session, Model model) {
	   
	   System.out.println(p);
	   
	   // 전달된 파일이 있을 경우 => 파일명 수정 작업 후 서버에 업로드 => 파일 원본명, 실제 서버에 업로드된 경로를 bf에 추가로 담기 
      if(!upfile.getOriginalFilename().equals("")) { 
         
         String changeName = saveFile(session, upfile); 
         p.setPdtFile("resources/productUpfiles/" + changeName); // 업로드된파일명 + 파일명
      }
      int result = sService.updateProduct(p);
      
      return "redirect:productList.admin";
   }
   
   // 작성자 : 김혜미 - 상품 등록폼
   @RequestMapping("productEnrollForm.admin")
   public String productEnroll() {
	   
	   return "store/adminProductEnroll";
   }

   // 작성자 : 김혜미 - 상품 등록
   @RequestMapping("productEnroll.admin")
   public String productEnroll(Product p, MultipartFile upfile, HttpSession session, Model model) {
	   
	   System.out.println(p);
	   
	   if(!upfile.getOriginalFilename().equals("")) { 
	         
	         String changeName = saveFile(session, upfile); 
	         p.setPdtFile("resources/productUpfiles/" + changeName); // 업로드된파일명 + 파일명
	      }
	   
	   model.addAttribute("p", sService.insertProduct(p));
	   
	   return "redirect:productList.admin";
   }
   
   // 작성자 : 김혜미 - 상품 삭제
   @RequestMapping("deleteProduct.admin")
   public String deleteProduct(int pno, Model model) {
	   
		int p = sService.deleteProduct(pno); 
		model.addAttribute("p", p);
		
		return "redirect:productList.admin";
   }
   
   // 작성자 : 김혜미 - 첨부파일명 수정 
   public String saveFile(HttpSession session, MultipartFile upfile) {
      
      String savePath = session.getServletContext().getRealPath("/resources/productUpfiles/");
            
      String originName = upfile.getOriginalFilename(); // 원본명 ("aaa.jpg") 
            
      String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
      int ranNum = (int)(Math.random() * 900000 + 10000); 
      String ext = originName.substring(originName.lastIndexOf(".")); 
            
      String changeName = currentTime + ranNum + ext;
            
      try {
         upfile.transferTo(new File(savePath + changeName));
      } catch (IllegalStateException | IOException e) {
         e.printStackTrace();
      }
            
      return changeName;
   }   
      
   // 작성자 - 박지은 : 오프라인스토어
   
   @RequestMapping("offStore.st")
   public String offlineStore() {
      return "store/offlineStore";
   }
   

   
   
}
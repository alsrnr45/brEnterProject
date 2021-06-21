<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>brEntertainment</title>

<!-- 부트스트랩 탬플릿 -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
	/* 폰트 */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
	* {font-family: 'Noto Sans KR', sans-serif;}
	
	/* input 스타일 */
	input:focus, input[type]:focus, .uneditable-input:focus {
	border-color: rgb(155, 89, 182); 
	box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);
	outline: 0 none;
	}
	
	/* 드롭박스 스타일 */
	.dataTable-selector:focus, .dataTable-selector:active{
	    border-color: rgb(155, 89, 182); 
	    box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);
	    outline: 0 none;
	}
	option:checked {background: rgb(155, 89, 182); color: white;}
	
	/* 페이징바 스타일 */
	.dataTable-pagination a {color:black;}
	.dataTable-pagination a:hover, 
	.dataTable-pagination a:focus {background: rgb(245, 238, 248); border-color: #dee2e6; color:black;}
	.dataTable-pagination a:active {box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);}
	.page-item.active .page-link, .page-item.active .dataTable-pagination a, .dataTable-pagination .page-item.active a, .dataTable-pagination li.active .page-link, .dataTable-pagination li.active a {
	    z-index: 3; color: #fff; background-color: rgb(155, 89, 182); border-color: #dee2e6;}
	.dataTable-pagination .active a, .dataTable-pagination .active a:focus, .dataTable-pagination .active a:hover {
	    background-color: rgb(155, 89, 182);
	    box-shadow: none;} 
	    
	 /*장바구니 목록 있을때*/
	 
	 /*전체화면*/
	 .cartouter {
	 	margin: auto;
	 	margin-bottom: 150px;
	 }
	 table {
	 	font-size: small;
	 }
     
     /*목록 상세정보*/
     img {
     	height: 100px;
     } 
     .cartPrice2 {
     	font-weight: bolder;
     	font-size: 15px;
     	width: 780px;
     	padding: 0 90px 0 90px;
     	margin-right:10px;
     }
     .originPrice, .discountPrice, .resultPrice {
     	margin-top:5px;
     }   
     .originPrice {
     	color:gray;
     	text-decoration:line-through;
     }   
     
     /*a태그, 버튼*/
     .orderBtn, .storeBtn {
     	background-color: rgb(155, 89, 182);
     	color: white;
     	border-radius: 3px;
     	border: 1px solid rgb(155, 89, 182);
     	font-weight: bold;
     	font-size: 15px;
     	text-decoration: none;
     	padding: 12px;
     	margin: 2px;
     	position: relative;
     	top: 43px;
     	right: 50px;
     }  
     .btns {
     	width: 780px;
     	padding: 10px;
     	margin: 10px;
     }
     .cartBtn {
     	background-color: rgb(155, 89, 182);
     	color: white;
     	border-radius: 3px;
     	border: 1px solid rgb(155, 89, 182);
     	font-weight: bold;
     	font-size: 15px;
     	padding: 12px;
     	text-decoration: none;
     }
     .orderBtn {
     	padding: 12px 27px 12px 27px;
     }
     #deleteBtn {
     	background-color: rgb(207, 154, 228);
        color: white;
        font-size: 12px;
        border: 1px solid rgb(207, 154, 228);
        border-radius: 3px;
        width: 84px;
        position: absolute;
        bottom: 228px;
        left: 478px;
     }
     a:hover {
     	color:black;
     }
     
     /*장바구니 목록 없을때*/
     
     /*전체화면*/
     
     .cartouter1 {
     	margin: auto;
     	margin-top:250px;
     }
     
     /*안내문구*/
     .circleimg {
     	width: 75px;
     	height: 75px;
     	border-radius: 50px;
     	background-color: lightgray;
     }
     .carttext2 {
     	margin-top: -11px;
     	color: gray;
     	font-weigth: 400px;
     }
             
</style>

</head>
<body class="sb-nav-fixed">
   <!-- 상단바 -->
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<jsp:include page="userHeader.jsp"/>
    </nav>
    
    <div id="layoutSidenav">
        
        <!-- 메뉴바 -->
        <div id="layoutSidenav_nav">
            <jsp:include page="userMenu.jsp"/>
        </div>

        <!--컨텐츠-->
        <div id="layoutSidenav_content">
            
            <div class="cartouter" align="center">
        		<form name="cartList" id="cartList" method="post" action="#">
            		<table class="table">
                		<thead class="table-light">
                    		<tr>
		                        <th><input type="checkbox" name="cartProd" value="detailProd">&nbsp; 상품정보</th>
		                        <th>수량</th>
		                        <th class="prodPrice">상품금액</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <tr>
		                        <td>
		                            <input type="checkbox" name="cartProd" value="selectProd" class="cartProd"> 
		                            <img src="resources/images/peng.png">&nbsp;&nbsp; 자바소년단 포토카드
		                        </td>
		                        <td><br><br>&nbsp; 2</td>
		                        <td>
		                        <div class="originPrice"> <br>4,000 &nbsp;원</div>
		                        <div class="discountPrice"> 5,000 &nbsp;원</div>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td>
		                            <input type="checkbox" name="cartProd" value="selectProd" class="cartProd"> 
		                            <img src="resources/images/peng.png">&nbsp;&nbsp; 자바소년단 포토카드
		                        </td>
		                        <td><br><br>&nbsp; 2</td>
		                        <td>
		                        <div class="originPrice"> <br>50,000 &nbsp;원</div>
		                        <div class="discountPrice"> 40,000 &nbsp;원</div>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td colspan="3" align="right" class="cartPrice1">
		                            <div class="cartPrice2">
		                            	<div class="allProdPrice">총 상품 금액 : 95,000 원</div>
		                            	<div class="discountProdPrice">직원 할인가 : 76,000 원</div>
		                            	<br>
		                            	<div class="resultPrice">결제금액 : 76,000 원</div>
		                           	</div>
		                        </td>
		                    </tr>
		                </tbody>
		            </table>
            		
            		<div class="btn">
                		<button type="submit" class="delete" id="deleteBtn">선택상품 삭제</button>
            		</div>
        		</form>
        		
        		<div class="btns" align="center">
		            <a href="#" class="orderBtn">주문하기</a>
		            <a href="#" class="storeBtn">쇼핑 계속하기</a>
		        </div> 
        	</div>
        	
        	<!-- 장밥구니에 상품이 없을때 보여질 화면 -->
        	<!--  
        	<div class="cartouter1" align="center">
        	
        		<div class="circlecartimg">
        			<div class="circleimg">
            			<div class="fas fa-shopping-cart" style="font-size: 36px; position: relative; top: 20px; right: 2px;"></div>
        			</div>
        		</div>
        	
        		<div class="carttext">
		            <h3 class="carttext1">장바구니에 담긴 상품이 없습니다.</h3>
		            <h5 class="carttext2">원하는 상품을 장바구니에 담아보세요!</h5>
		        </div>
		        <br>
		        
		        <div>
		            <a href="#" class="cartBtn">스토어가기</a>
		        </div>
		        
		      </div>
		      -->
		      
        	</div>
    	</div>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

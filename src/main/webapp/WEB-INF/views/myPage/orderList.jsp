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
	    
	/*주문목록 있을때*/
	
	/*전체화면*/
	.orderOuter{
		margin: auto;
		margin-bottom: 150px;
	}
	table {
		font-size: small;
	}
	
	/*상품상세정보*/
	.discountPrice {
		margin-top: 17px;
	}
	.delivery {
		margin-top:17px;
	}
	img {
		height:100px;
	}
	
	/*버튼,a태그*/
	.StoreBtn {
		background-color: rgb(155, 89, 182);
		color: white;
		border-radius: 3px;
		border: 1px solid rgb(155, 89, 182);
		font-weight: bold;
		font-size: 15px;
		text-decoration: none;
		padding: 12px;
		margin: 2px;
	}
	.orderBtn {
		width:780px;
		padding:10px;
		margin:10px;
	}
	a:hover {
		color:black;
	}
	
	/*주문내역 없을떼*/
	
	/*전체화면*/
    .orderOuter2 {
    	margin-auto;
    	margin-top:250px;
    }
    
    /*텍스트*/
    
    .circleOrderImg {
    	width: 75px;
    	height: 75px;
    	border-radius: 50px;
    	background-color: lightgray;
    }
    .circleImg {
    	width: 75px;
    	height: 75px;
    	border-radius: 50px;
    	background-color: lightgray;
    }
    
    /*버튼*/
    .orderBtn2 {
    	background-color: rgb(155, 89, 182);
    	color: white;
    	border-radius: 3px;
    	border: 1px solid rgb(155, 89, 182);
    	font-weight: bold;
    	font-size: 15px;
    	padding: 12px;
    	text-decoration: none;
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
            
            <!-- 주문목록 있을때 보여질 화면 -->
            <div class="orderOuter" align="center">
            	<form name="orderList" id="orderList" method="post" action="#">
            		<table class="table">
            			<thead class="table-light">
            				<tr>
            					<th>&nbsp; 상품정보</th>
            					<th>수량</th>
            					<th class="orderPrice">결제금액</th>
            					<th>배송상태</th>
            				</tr>
            			</thead>
            			<tbody>
            				<tr>
            					<td>
            						<img src="resources/produnctUpfiles/peng.png" class="orderProd">&nbsp;&nbsp;
            					</td>
            					<td><br><br>&nbsp; 2</td>
            					<td>
            						<div class="discountPrice"><br>4,000 &nbsp;원</div>
            					</td>
            					<td>
            						<div class="delivery"><br> 배송중</div>
            					</td>
            				</tr>
            				<tr>
            					<td>
            						<img src="resources/produnctUpfiles/peng.png" class="orderProd">&nbsp;&nbsp;
            					</td>
            					<td><br><br>&nbsp; 1</td>
            					<td>
            						<div class="discountPrice"><br> 40,000 &nbsp; 원</div>
            					</td>
            					<td>
            						<div class="delivery"><br> 배송완료</div>
            					</td>
            				</tr>
            			</tbody>	
            		</table>
            	</form>
            	
            	<br><br>
            	<div class="orderBtn" align="center">
            		<a href="#" class="storeBtn">스토어가기</a>
            	</div>
            </div>
            
            <!-- 주문목록 없을때 보여질 화면 -->
            <!-- 
            <div class="orderOuter2" align="center">
            	
            	<div class="circleOrderImg">
            		<div class="circleImg">
            			<div class="fas fa-clipboard-list" style="font-size: 36px; position: relative; top: 20px; right: 2px;"></div>
        			</div>
      			</div>
      			<br>
      			
      			<div class="ordertext">
          			<h4 class="orderText2">주문내역이 없습니다.</h4>
      			</div>
      			<br><br>
      			
      			<div>
          			<a href="#" class="orderBtn2">스토어가기</a>
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

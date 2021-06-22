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
	    
	/* 주문목록 있을 때 */
	
	/* 테이블*/
	
	.orderOuter {
		margin:auto;
	}  
	table {
		font-size:0.875em;
	} 
	.productInfo {
		width: 52%;
	}
	.amount {
		width:16%;
	}
	.resultPrice {
		width: 20%;
	}
	.productImg {
		width:10%;
	}
	
	/* 버튼 */
	.storeBtn {
		border: 15px solid rgb(155, 89, 182);
		background-color: rgb(155, 89, 182);
		border-radius:3px;
		text-decoration:none;
		color:white;
		font-size:0.875em;
		font-weight:bold;
		margin-left: 44%;
	}
	
	/* 주문내역 없을 때 */
	
	.orderNoOuter {
		margin:auto;
	}
	
	/* 아이콘 */
	.orderIconOuter {
		border: 1px solid lightgray;
		background-color: lightgray;
		border-radius: 50%;
		width: 26%;
		height: 51%;
		margin-left:37%;
		margin-bottom:2%;
	}
	#order-list {
		font-size:2.2em;
		margin-top:17%;
		margin-left:25%;
	}
	
	/* 버튼 */
	.storeBtn2 {
		border: 12px solid rgb(155, 89, 182);
		background-color: rgb(155, 89, 182);
		border-radius:3px;
		text-decoration:none;
		color:white;
		font-size:0.875em;
		font-weight:bold;
		position:absolute;
		margin-bottom:15%;
		margin-left:4%;
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
            
            <!-- 주문목록 있을 때 보여질 화면 -->  
          	<div class="orderOuter">
	        	<form name="" id="" method="post" action="#">
	        		<table class="table">
	        			<thead class="table-light">
	        				<tr>
	        					<th class="productInfo">상품정보</th>
	        					<th class="amount">수량</th>
	        					<th class="resultPrice">결제금액</th>
								<th>배송상태</th>		
	        				</tr>
	        			</thead>
	        			<tbody>
	        				<tr>
	        					<td>
	        						<p><img src="resources/images/peng.png" class="productImg" align="left">&nbsp;자바소년단 포토카드</p>
	        					</td>
	        					<td>2</td>
	        					<td><div>4,000 원</div></td>
	        					<td>
	        						<div>배송중</div>
	        					</td>
	        				</tr>
	        			</tbody>
	        		</table>
	        	</form>
	        	
	        	<div clss="btn">
	        		<br>
	        		<a href="" class="storeBtn">스토어 가기</a>
	        	</div>
	        </div> 
        	
        	
        	<!-- 주문내역 없을때 보여질 화면 -->
        	<!--  
        	<div class="orderNoOuter">
        		<div class="orderIconOuter">
        			<div class="orderIcon">
        				<div class="fas fa-clipboard-list" id="order-list"></div>
        			</div>
        		</div>
        		
        		<div>
        			<h4>주문내역이 없습니다.</h4>
        		</div>
        		
        		<br>
	        	<div>
	        		<a href="" class="storeBtn2">스토어가기</a>
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

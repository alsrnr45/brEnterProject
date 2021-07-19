<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>brEntertainment</title>

<!-- 부트스트랩 탬플릿 -->
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
/* 폰트 */
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap')
	;

* {
	font-family: 'Noto Sans KR', sans-serif;
}

/* input 스타일 */
input:focus, input[type]:focus, .uneditable-input:focus {
	border-color: rgb(155, 89, 182);
	box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px
		rgba(155, 89, 182, 0.6);
	outline: 0 none;
}

/* 드롭박스 스타일 */
.dataTable-selector:focus, .dataTable-selector:active {
	border-color: rgb(155, 89, 182);
	box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px
		rgba(155, 89, 182, 0.6);
	outline: 0 none;
}

option:checked {
	background: rgb(155, 89, 182);
	color: white;
}

/* 페이징바 스타일 */
.dataTable-pagination a {
	color: black;
}

.dataTable-pagination a:hover, .dataTable-pagination a:focus {
	background: rgb(245, 238, 248);
	border-color: #dee2e6;
	color: black;
}

.dataTable-pagination a:active {
	box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px
		rgba(155, 89, 182, 0.6);
}

.page-item.active .page-link, .page-item.active .dataTable-pagination a,
	.dataTable-pagination .page-item.active a, .dataTable-pagination li.active .page-link,
	.dataTable-pagination li.active a {
	z-index: 3;
	color: #fff;
	background-color: rgb(155, 89, 182);
	border-color: #dee2e6;
}

.dataTable-pagination .active a, .dataTable-pagination .active a:focus,
	.dataTable-pagination .active a:hover {
	background-color: rgb(155, 89, 182);
	box-shadow: none;
}

/* 장바구니 목록 있을때 */

/* 테이블 */
.cartOuter {
	margin: auto;
}

.table-light, .trOne {
	font-size: 0.875em;
}

.productInfo {
	width: 60%;
}

.amount {
	width: 27%;
}

.productPrice {
	width: 15%;
}

.productImg {
	width: 10%;
}

.originalPrice {
	color: gray;
	text-decoration: line-through;
}

.priceInfo {
	float: right;
	font-weight: bold;
	padding: 3%;
	font-size: 0.9375em;
}

#cartList {
	width: 70%;
	margin-left: 15%
}

/* 버튼*/
.deleteBtn {
	border: 1px solid rgb(207, 154, 228);
	background: rgb(207, 154, 228);
	color: white;
	border-radius: 3px;
	width: 13%;
	font-size: 0.75em;
	position: relative;
	bottom: 13px;
}

.btns {
	padding: 0 0 20% 65%;
}

.orderBtn, .storeBtn {
	border: 15px solid rgb(155, 89, 182);
	background-color: rgb(155, 89, 182);
	border-radius: 3px;
	text-decoration: none;
	color: white;
	font-size: 0.875em;
	font-weight: bold;
}

a:hover {
	color: black;
}

/*장바구니 목록 없을때*/
.cartNoOuter {
	margin: auto;
}

/*아이콘*/
.cartIconOuter {
	border: 1px solid lightgray;
	background-color: lightgray;
	border-radius: 50%;
	width: 17%;
	height: 47%;
	margin-left: 40%;
	margin-bottom: 2%;
}

#shopping-cart {
	font-size: 2.2em;
	margin-top: 22%;
	margin-left: 17%;
}

/* 텍스트 */
.cartText {
	margin-left: 9%;
	color: gray;
}

/* 버튼 */
.storeBtn2 {
	border: 13px solid rgb(155, 89, 182);
	background-color: rgb(155, 89, 182);
	border-radius: 3px;
	text-decoration: none;
	color: white;
	font-size: 0.875em;
	font-weight: bold;
	position: absolute;
	margin-bottom: 15%;
	margin-left: 10%;
}
</style>

</head>
<body class="sb-nav-fixed">
	<!-- 상단바 -->
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<jsp:include page="../common/userHeader.jsp" />
	</nav>

	<div id="layoutSidenav">

		<!-- 메뉴바 -->
		<div id="layoutSidenav_nav">
			<jsp:include page="../common/userMenu.jsp" />
		</div>

		<!--컨텐츠-->
		<div id="layoutSidenav_content">
			<script>
				function priceSum() {
					var sum = 0;
					var count = $(".originalPrice").length;

					for (var i = 0; i < count; i++) {
						sum += parseInt($(".originalPrice")[i].text);
					}
					$("#priceSum").html("총 상품 금액 : &nbsp;" + sum + " 원");
					$("#mpriceSum").html(
							"직원 할인가 : &nbsp;&nbsp;" + sum * 0.7 + " 원");
					$("#paySum").html(
							"결제금액 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + sum
									* 0.7 + " 원");

				}

				priceSum();
			</script>

			<c:set var="list" value="${cartList}" />
			<c:choose>
				<c:when test="${empty list}">
					<!-- 장바구니 상품없을때 보여질 화면 -->

					<div class="cartNoOuter">
						<div class="cartIconOuter">
							<div class="cartIcon">
								<div class="fas fa-shopping-cart" id="shopping-cart"></div>
							</div>
						</div>

						<div>
							<h3>장바구니에 담긴 상품이 없습니다.</h3>
							<h5 class="cartText">원하는 상품을 장바구니에 담아보세요!</h5>
						</div>

						<div>
							<a href="storeList.st" class="storeBtn2">스토어가기</a>
						</div>
					</div>
				</c:when>
				<c:otherwise>


					<!-- 장바구니 상품 있을 때 보여질 화면 -->
					<div class="cartOuter">
						<form name="cartList" id="cartList" method="post" action="">
							<table class="table">
								<thead class="table-light">
									<tr>
										<th></th>
										<th class="productInfo">상품정보</th>
										<th class="amount">수량</th>
										<th class="productPrice">상품금액</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${cartList}" var="cartList">
										<tr class="trOne">
											<td><label><input type="checkbox"
													name="cartProduct" value="product"
													data-cartNo="${cartList.cartNo }"></label></td>
											<td>
												<p>
													<img src="${cartList.pdtFile }" align="left"
														class="productImg">&nbsp;${cartList.pdtName }
												</p>
											</td>
											<td>${cartList.pdtCount}</td>
											<td>
												<div class="originalPrice">${cartList.orgPrice }</div>
												<div>${cartList.memPrice }</div>
											</td>
										</tr>
									</c:forEach>
									<tr>
										<td colspan="4">
											<div class="priceInfo">
												<div id="priceSum"></div>
												<div id="mpriceSum"></div>
												<br>
												<div id="paySum"></div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div>
								<button type="submit" id="selectDelete" class="deleteBtn">선택상품 삭제</button>
							</div>
						</form>
					</div>

					<div class="btns">
						<a href="" class="orderBtn" id="orderBtn">주문하기</a>&nbsp;&nbsp;&nbsp; <a
							href="storeList.st" class="storeBtn">쇼핑 계속하기</a>
					</div>
				</c:otherwise>
			</c:choose>


		</div>

	</div>
	</div>
	<script>
		$('#selectDelete').click(function(){
			var checkArr = new Array();
			 $("input[name='cartProduct']:checked").each(function(){
				    checkArr.push($(this).attr("data-cartNo"));
				   });
			 
			 $.ajax({
				    url : "cartDelete.pro",
				    type : "post",
				    data : { chbox : checkArr },
				    success : function(){
				     location.href = "cartList.pro";
				    }
				   });
		})
		
		$('#orderBtn').click(function(){
			var checkArr = new Array();
			 $("input[name='cartProduct']:checked").each(function(){
				    checkArr.push($(this).attr("data-cartNo"));
				   });
			 
			 $.ajax({
				    url : "order.st",
				    type : "post",
				    data : { chbox : checkArr },
				    success : function(){
				     location.href = "order.st";
				    }
				   });
		})
	
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

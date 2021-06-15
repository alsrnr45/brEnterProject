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
	/* input 스타일 */
	button:focus, button[type]:focus, .uneditable-button:focus {
	border-color: rgb(155, 89, 182); 
	box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);
	outline: 0 none;
	}


	/* 스타일 */
	/* .content div {outline: 1px solid blueviolet;} */
	.content {height:1000px; padding: 50px 40px 20px 60px;}
	.content>div {float: left;}
	.content1 {width:920px; height:100%;}
	.content2 {width:420px; height:100%; margin: auto;}
	
	h1{margin-bottom:20px;}

	/* 주문상품 */
	.table-secondary {border-color: #000;}
	.table > tbody, .dataTable-table > tbody {vertical-align:0%;}
	.table > :not(caption) > * > *, .dataTable-table > :not(caption) > * > * {padding-right:0px}

	#orderProduct{margin:20px 20px 60px 0px;}
	#orderProduct img{width: 100px; height: 100px;}
	#orderProduct thead tr{border-top:1px solid;}
	#orderProduct tbody td{height:100px;}
	#orderProduct tfoot td{height:70px; text-align:right; font-size: 20px; padding-right:30px;}

	/* 주문자정보 */
	#senderInfo{margin-bottom: 60px; width: 850px;}


	/* 배송지정보 */
	#receiverInfo{margin-bottom: 60px; width: 850px;}
	.btn-secondary {background-color: #dfdfdf; border-color: #c3c4c4; color: black;}

	
	/* 결제금액 */
	.fixedArea{position:fixed;}
	.fixedArea input {vertical-align: 20px;}
	.fixedArea label {padding: 3px 0px 0px 7px;}
	.fixedArea button {width: 350px; height:50px; margin: 15px 0px 0px 50px; border-radius:0.5em; background-color:rgb(155, 89, 182); color: white; font-size: large;}
	.totalPriceCheck{width:350px; height:400px; margin: 77px 20px 0 50px; border-radius:0.5em; background-color:rgb(245, 238, 248); border: 1px solid rgb(127, 127, 127); padding: 13px 30px 13px 30px;}

</style>

</head>
<body class="sb-nav-fixed">
   <!-- 상단바 -->
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<jsp:include page="../common/userHeader.jsp"/>
    </nav>
    
    <div id="layoutSidenav">
    
		<form action="">
			<div class="content">
				
				<h1 class="mt-4">Order</h1>
				<hr>

				<div class="content1">
					<!--주문상품 -->
					<h2 class="mt-4">주문상품</h2>
					<div id="orderProduct">
						<table class="table" style="text-align:center; margin:auto;">
							<thead>
								<tr class="table-secondary">
									<th width="150">이미지</th>
									<th width="350">상품정보</th>
									<th width="150">판매가</th>
									<th width="150">직원할인가</th>
									<th width="100">수량</th>
								</tr>
							</thead>
							<tbody >
								<tr>
									<td><img src="https://ygselect.com/web/product/big/202012/e2226610ac7c233b51c2ae88fafdac39.jpg"></td>
									<td>BLACKPINK 1st FULL ALBUM</td>
									<td>20,000원</td>
									<td>18,000원</td>
									<td>1</td>
								</tr>
								<tr>
									<td><img src="https://ygselect.com/web/product/big/202102/d2789bf916ad16516ffc355cb2dc17d1.jpg"></td>
									<td>BLACKPINK OFFICIAL LIGHT STICK Ver.2 LIMITED EDITION</td>
									<td>40,000원</td>
									<td>36,000원</td>
									<td>1</td>
								</tr>
							</tbody>
							<tfoot>
								<td colspan="5">합계: 54,000원</td>
							</tfoot>
						</table>
					</div>  

					<!-- 주문자정보 -->
					<h2 class="mt-4">주문자정보</h2><hr>
					<div id="senderInfo">
						<table class="table table-borderless">
							<tr>
								<th width="150">주문하시는분</th>
								<td width="250"><input type="text" class="form-control" id="userName" name="userName" value="김사원" required></td>
								<td width="350"></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" class="form-control" id="postCode" name="postCode" value="48434" required></td>
								<td></td>
							</tr>
							<tr>
								<th></th>
								<td colspan="2"><input type="text" class="form-control" id="roadAddress" name="roadAddress" value="부산광역시 남구 대연동 73-15번지" required></td>
							</tr>
							<tr>
								<th></th>
								<td colspan="2"><input type="text" class="form-control" id="detailAddress" name="detailAddress" value="202동 118호( 주엽동, 햇빛아파트 )" required></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td colspan="2"><input type="text" class="form-control" id="phone" name="phone" value="010-4865-2846" required></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td colspan="2"><input type="text" class="form-control" id="" name="userId" value="sawon@brent.com" required></td>
							</tr>
						</table>
					</div>

					<!-- 배송지정보 -->
					<h2 class="mt-4">배송지정보</h2><hr>
					<div id="receiverInfo">
						<form action="">
							<table class="table table-borderless">
								<tr>
									<th width="150">받으시는분</th>
									<td width="250"><input type="text" class="form-control" id="receiverName" name="receiverName" required></td>
									<td width="350"></td>
								</tr>
								<tr>
									<th>주소</th>
									<td><input type="text" class="form-control" id="receiverPostCode" name="receiverPostCode" required></td>
									<td><button type="button" class="btn btn-secondary">주소검색</button></td>
								</tr>
								<tr>
									<th></th>
									<td colspan="2"><input type="text" class="form-control" id="receiverRoadAddress" name="receiverRoadAddress" required></td>
								</tr>
								<tr>
									<th></th>
									<td colspan="2"><input type="text" class="form-control" id="receiverDetailAddress" name="receiverDetailAddress" required></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td colspan="2"><input type="text" class="form-control" id="receiverPhone" name="receiverPhone" required></td>
								</tr>
								<tr>
									<th>베송메세지</th>
									<td colspan="2"><input type="text" class="form-control" id="deliveryMessage" name="deliveryMessage" required style="height: 100px;"></td>
								</tr>
							</table>
						</form>
					</div>

					<!-- 결제수단 -->
					<h2 class="mt-4">결제수단</h2><hr>
					<div id="paymentType">
						<button class="btn btn-outline-secondary" style="width: 150px;">신용카드</button>
					</div>
				
					<br><br><br><br>
				</div>

				
				<div class="content2">
					<div class="fixedArea">
						<div class="totalPriceCheck">
							<h3 class="mt-4">결제금액</h3>
							<table class="table table-borderless">
								<tr style="font-size:large;">
									<td>총 상품금액</td>
									<td align="right">60000원</td>
								</tr>
								<tr style="font-size:large;">
									<td>총 할인금액</td>
									<td align="right">6000원</td>
								</tr>
							</table>
							
							<hr>
							<h3 class="mt-4">최종 결제금액</h3>
							<p align="right" style="font-size:x-large;">54000원</p>
							
							<hr>
							<input id="terms" type="checkbox" class="form-check-input" required>
							<label for="terms">모든 내용을 확인하였으며 <br>구매조건에 동의합니다.</label>
						</div>
						<button type="submit" class="btn">결제하기</button>
					</div>
				</div>
				
			</div>
		</form>
    
    </div>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

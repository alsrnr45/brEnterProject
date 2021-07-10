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
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<style>
	/* 폰트 */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
	* {font-family: 'Noto Sans KR', sans-serif;}

	/* input 스타일 */
	button:focus, button[type]:focus, .uneditable-button:focus {
	border-color: rgb(155, 89, 182); 
	box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);
	outline: 0 none;
	}

	/* 스타일 */
	/* .content div {outline: 1px solid blueviolet;} */
	.content {height:1000px; padding: 50px 40px 20px 60px;}
	form {margin: auto;}
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
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="logout.me" style="width: 225px;">
		<img src="resources/images/brLogo_user.png" style="height: 56px;"></a>

		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#" hidden><i class="fas fa-bars"></i></button>
	  
	  	<!-- Navbar-->
		<div style="width:100%;" align="right">
			<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4" style="flex-direction: column;">
				<li class="nav-item dropdown" style="justify-content: space-between;"> 
					<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
					<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#!">사원명</a></li>
						<li><a class="dropdown-item" href="#!" style="font-size: 13px;">이메일</a></li>
						<li><hr class="dropdown-divider" /></li>
						
						<!--logout-->
						<div class="dropmenu">
							<button class="logout mymenu" >Logout</button><button class="mypage mymenu">MYPAGE</button>
						</div>
					</ul>
				</li>
			</ul>
		</div>
    </nav>
    
    <div id="layoutSidenav">
    
		<form action="orderFinish.st" id="sss">
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
									<td><img src="${ p.pdtFile }"></td>
									<td>${ p.pdtName }<input type="hidden" id="pdtName" value="${ p.pdtName }"></td>
									<td>${ p.orgPrice }원</td>
									<td>${ p.memPrice }원</td>
									<td>${ pco }<input type="hidden" name="pdtCount" value="${ pco }"></td>
								</tr>
							</tbody>
							<tfoot>
								<td colspan="5">합계: ${ p.memPrice * pco }원<input type="hidden"id="totalPrice" name="totalPrice" value="${ p.memPrice * pco }"></td>
							</tfoot>
						</table>
					</div>  

					<!-- 주문자정보 -->
					<h2 class="mt-4">주문자정보</h2><hr>
					<div id="senderInfo">
						<table class="table table-borderless" id="buyerInfo">
							<tr>
								<th width="150">주문하시는분</th>
								<td width="250"><input type="text" class="form-control" id="userName" value="${ loginUser.memName }" required></td>
								<td width="350"><input type="hidden" name="memNo" value="${ loginUser.memNo }"></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" class="form-control" id="postCode" value="${ loginUser.post }" required></td>
								<td><input type="hidden" name="pdtNo" value="${ p.pdtNo }"></td>
							</tr>
							<tr>
								<th></th>
								<td colspan="2"><input type="text" class="form-control" id="roadAddress" value="${ loginUser.roadAddress }" required></td>
							</tr>
							<tr>
								<th></th>
								<td colspan="2"><input type="text" class="form-control" id="detailAddress" value="${ loginUser.detailAddress }" required></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td colspan="2"><input type="text" class="form-control" id="phone" value="${ loginUser.phone }" required></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td colspan="2"><input type="text" class="form-control" value="${ loginUser.officeEmail }" required></td>
							</tr>
						</table>
					</div>

					<!-- 배송지정보 -->
					<h2 class="mt-4">배송지정보</h2><hr>
					<div id="receiverInfo">
						<table class="table table-borderless">
							<tr>
								<th width="150">받으시는분</th>
								<td width="250"><input type="text" class="form-control" id="receiverName" name="orderReceiver" required></td>
								<td width="350"></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" class="form-control" id="sample6_postcode" name="postCode" required></td>
								<td><input type="button" class="btn btn-secondary" onclick="sample6_execDaumPostcode()" value="주소검색"></td>
							</tr>
							<tr>
								<th></th>
								<td colspan="2"><input type="text" class="form-control" id="sample6_address" name="roadAddress" required></td>
							</tr>
							<tr>
								<th></th>
								<td colspan="2"><input type="text" class="form-control" id="sample6_detailAddress" name="detailAddress" required></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td colspan="2"><input type="text" class="form-control" id="receiverPhone" name="receiverPhone" required></td>
							</tr>
							<tr>
								<th>베송메세지</th>
								<td colspan="2"><input type="text" class="form-control" id="deliveryMessage" name="shipMessage" required style="height: 100px;"></td>
							</tr>
						</table>
					</div>
					<input type="text" id="sample6_extraAddress" placeholder="참고항목" hidden>

					<!-- 결제수단 -->
					<h2 class="mt-4">결제수단</h2><hr>
					<div id="paymentType">
						<button class="btn btn-outline-secondary" style="width: 150px;">
							신용카드<input type="hidden" name="payMethod" value="신용카드">
						</button>
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
									<td align="right">${ p.orgPrice * pco }원</td>
								</tr>
								<tr style="font-size:large;">
									<td>총 할인금액</td>
									<td align="right">${ (p.orgPrice - p.memPrice)* pco }원</td>
								</tr>
							</table>
							
							<hr>
							<h3 class="mt-4">최종 결제금액</h3>
							<p align="right" style="font-size:x-large;">${ p.memPrice * pco }원</p>
							
							<hr>
							<input id="terms" type="checkbox" class="form-check-input" required>
							<label for="terms">모든 내용을 확인하였으며 <br>구매조건에 동의합니다.</label>
						</div>
						<button type="button" class="btn" id="check_module">결제하기</button>
					</div>
				</div>
			</div>
		</form>
    </div>
    
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
       function sample6_execDaumPostcode() {
           new daum.Postcode({
               oncomplete: function(data) {
                   // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
   
                   // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                   // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                   var addr = ''; // 주소 변수
                   var extraAddr = ''; // 참고항목 변수
   
                   //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                   if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                       addr = data.roadAddress;
                   } else { // 사용자가 지번 주소를 선택했을 경우(J)
                       addr = data.jibunAddress;
                   }
   
                   // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                   if(data.userSelectedType === 'R'){
                       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                           extraAddr += data.bname;
                       }
                       // 건물명이 있고, 공동주택일 경우 추가한다.
                       if(data.buildingName !== '' && data.apartment === 'Y'){
                           extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                       }
                       // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                       if(extraAddr !== ''){
                           extraAddr = ' (' + extraAddr + ')';
                       }
                       // 조합된 참고항목을 해당 필드에 넣는다.
                       document.getElementById("sample6_extraAddress").value = extraAddr;
                   
                   } else {
                       document.getElementById("sample6_extraAddress").value = '';
                   }
   
                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
                   document.getElementById('sample6_postcode').value = data.zonecode;
                   document.getElementById("sample6_address").value = addr;
                   // 커서를 상세주소 필드로 이동한다.
                   document.getElementById("sample6_detailAddress").focus();
               }
           }).open();
       }
       
       
    	// 아임포트
        $("#check_module").click(function () {
            var IMP = window.IMP;
            IMP.init('imp35934987');
            IMP.request_pay({
                pg: 'inicis',
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: $("#pdtName").val(),
                amount: $("#totalPrice").val(),
                buyer_email: '',
                buyer_name: $("#userName").val(),
                buyer_tel: '',
                buyer_addr: '',
                buyer_postcode: '',
                m_redirect_url: 'https://www.yourdomain.com/payments/complete'
            }, function (rsp) {
                console.log(rsp);
                if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                
                $("#sss").submit();
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

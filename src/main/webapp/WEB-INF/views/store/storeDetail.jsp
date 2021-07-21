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

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- alertify -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>

<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<style>
    /* button */
	.btn-info {
        background-color: rgb(155, 89, 182); 
        border-color: rgb(155, 89, 182); 
        color: white; 
        width: 230px; height: 50px; margin-left: 30px;
    }
    .btn-info:hover, .btn-info:focus, .btn-info:active {
        background-color: rgb(205, 146, 228); 
        border-color: rgb(155, 89, 182); 
        box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6) !important;
        outline: 0 none;
        color: white; 
    }
    .btn-light {
        background-color: rgb(160, 160, 160); 
        border-color: rgb(160, 160, 160);
        color: white;
        width: 230px; height: 50px;
    }
    .btn-light:hover, .btn-light:focus, .btn-light:active {
        background-color: rgb(215, 215, 215); 
        border-color: rgb(215, 215, 215);
        box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(215, 215, 215, 0.6) !important;
        outline: 0 none;
        color: white; 
    }
    .swal2-confirm {
        background-color: rgb(160, 160, 160) !important; 
        border-color: rgb(160, 160, 160) !important;
        box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(215, 215, 215, 0.6) !important;
        color: white;
        width: 130px;
    }
    
	/* 영역 */
    /* #layoutSidenav_content div {outline: 1px solid blueviolet;} */
    .content{width:1000px; height:450px;}
	.headArea{width:1100px; height:450px; text-align:center; margin:auto; padding-top: 30px;}
	.detailArea{width:1100px; height:500px; text-align:center; margin:auto; padding: 40px 50px 30px 50px;}

    /* 상품정보 */
	.headArea>div {float: left;}
    .thumbnail{width: 450px; height: 100%; padding: 20px 0px 25px 50px;}
    .thumbnail img {box-shadow: 0 7px 15px rgb(0 0 0 / 20%);}
    .information{width: 650px; height: 100%; padding: 20px 50px 25px 50px; }

    table th {height:40px; font-size:20px;}
    table td {height:40px; font-size:17px;}
    table{width:100%; text-align:left;}
    .productInfo table {margin-left: 10px;}

    .calculation{background-color: rgba(224, 224, 224, 0.76); text-align:left; padding: 15px 25px 15px 25px;}
    .calculation input {width: 75px; text-align: center; padding-left: 15px; margin-top: 5px;}
    .calculation button {padding-top: 0 !important;}
    .calculation button:focus {box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(255, 255, 255, 0) !important;}
    .finalPrice{text-align:left; padding: 20px 25px 20px 25px;}
    .finalPrice td {font-size:28px;}

    /* 상품 상세정보 */
    .productDetail{padding: 30px 0 0 0 ; }
    h6{height:50px; padding-top: 13px; background-color: rgba(224, 224, 224, 0.4); border-top: 1px solid gray; border-bottom: 1px solid gray;}

</style>

</head>
<body class="sb-nav-fixed">
   <!-- 상단바 -->
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<jsp:include page="../common/userHeader.jsp"/>
    </nav>
    
    <div id="layoutSidenav">
        
        <!-- 메뉴바 -->
        <div id="layoutSidenav_nav">
            <jsp:include page="../common/userMenu.jsp"/>
        </div>

        <!--컨텐츠-->
        <div id="layoutSidenav_content">
            
            <!-- 상품 -->
			<div class="headArea">
				
				<input type="hidden" class="pno" value="${ p.pdtNo }">
				<div class="thumbnail">
					<img src="${ p.pdtFile }" width="400" height="400">
				</div>

				<div class="information">
                    <div class="productInfo">
                        <table>
                            <tr>
                                <th colspan="2">${ p.pdtName }</th>
                            </tr>
                            <tr>
                                <td width="120;">판매가</td>
                                <td>${ p.orgPrice }원</td>
                            </tr>
                            <tr>
                                <td>직원할인가</td>
                                <td>${ p.memPrice }원</td>
                            </tr>
                        </table>
                        <hr>
                    </div>
                    <div class="calculation">
                        <table>
                            <tr>
                                <td colspan="2">${ p.pdtName }</td>
                            </tr>
                            <tr>
                                <td>
                                    <button type="button" class="btn" onclick="fnCalCount('m', this);"><i class="fas fa-minus-circle"></i></button>
                                    <input type="number" name="quantity" id="count" value="1" readonly/>
                                    <button type ="button" class="btn" onclick="fnCalCount('p',this);"><i class="fas fa-plus-circle"></i></button>
                                </td>
                                <td class="maxQuantity" hidden>5</td>
                                <td class="productPrice" hidden>${ p.memPrice }</td>
                                <td id="totalPrice" align="right">${ p.memPrice }</td>
                            </tr>
                        </table>
                    </div>
                    <div class="finalPrice">
                        <table>
                            <tr>
                                <td>Total</td>
                                <td id="finalPrice" align="right">${ p.memPrice }</td>
                            </tr>
                        </table>
                    </div>
                    <a type="button" class="btn btn-light btn-lg" id="insertCart">장바구니 담기</a>
                    <a type="button" class="btn btn-info btn-lg"  id="pay">바로 구매하기</a>
                </div>
			</div>
			<!-- 상품디테일 -->
			<div class="detailArea">
                <h6>상품 정보</h6>
                
                <div class="productDetail">
					${ p.pdtDetail }
                </div>
			</div>
        </div>
    </div>

	<script>
		 $(function(){
			$("#insertCart").click(function(){
				 location.href="insertCart.pro?pdtNo=" + ${p.pdtNo} + "&pdtCount=" + $("#count").val() ;
			})
		})
	
		$(function(){
	        $("#pay").click(function(){
	           location.href="buyNow.st?pno=" + $(".pno").val() + "&pco=" + $("#count").val() ;
	        })
	     })
	
        function fnCalCount(type, ths){
            var $input = $(ths).parents("td").find("input[name='quantity']");
            var pCount = Number($input.val());
            var productPrice = Number($(ths).parents("tr").find("td.productPrice").html());
            var totalPrice = 0;
            
            if(type=='p'){
                if(pCount < 5 ){
                    $input.val(Number(pCount)+1); 
                    totalPrice = productPrice * (pCount+1);
                    document.getElementById("totalPrice").innerHTML = totalPrice;
                    document.getElementById("finalPrice").innerHTML = totalPrice;
                }else if(pCount = 6){ 
                    Swal.fire({
                        icon: 'error',
                        text: '최대 주문수량은 5개 입니다.'
                    });
                }
            }else{
                if(pCount > 1){
                    $input.val(Number(pCount)-1);    
                    totalPrice = productPrice * (pCount-1); 
                    document.getElementById("totalPrice").innerHTML = totalPrice;
                    document.getElementById("finalPrice").innerHTML = totalPrice;

                }else if(pCount = 1){
                    Swal.fire({
                        icon: 'error',
                        text: '수량은 1개 이상 입력해 주십시오.'
                    });
                    document.getElementById("totalPrice").innerHTML = productPrice;
                    document.getElementById("finalPrice").innerHTML = productPrice;
                }
            }
        }
        
        
        
        $(function() {
            $(".thumbnail>img").click(function() {
				// console.log(typeof ($(this).prev(".pno").val()));
            	location.href ="storeDetail.st?pno=" + $(this).prev(".pno").val();
            })
        });
    </script>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

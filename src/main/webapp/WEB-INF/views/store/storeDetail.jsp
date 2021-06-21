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

    /* input */
	input:focus, input[type]:focus, .uneditable-input:focus, button:focus, button:active{
		border-color: rgba(255, 255, 255, 0) !important; 
		box-shadow: 0 1px 1px rgba(255, 255, 255, 0) inset, 0 0 8px rgba(255, 255, 255, 0) !important;
		outline: 0 none !important;
	}
    table input{border:0px solid rgba(255, 255, 255, 0) !important; height: 40px;}

    /* button 스타일 */
	.btn-warning {background-color: rgb(155, 89, 182); border-color: rgb(155, 89, 182); color: white; margin-left: 30px;}
    .btn-light {background-color: rgb(215, 215, 215); border-color: rgb(215, 215, 215);}
    .information a {width: 250px; height: 50px;}

	/* */
	.headArea{width: 1100px; height: 450px; text-align: center; margin: auto; padding-top: 30px;}
	.headArea>div {float: left;}

    .thumbnail{width: 450px; height: 100%; padding: 20px 0px 25px 50px;}
    .information{width: 650px; height: 100%; padding: 25px 50px 25px 50px;}

    table th {height:40px; font-size:20px;}
    table td {height:40px; font-size:17px;}
    table{width:100%; text-align:left;}

    .totalPrice{text-align:left; padding: 20px 25px 20px 25px;}
    .totalPrice td {font-size:27px;}
    .calculation{background-color: rgba(224, 224, 224, 0.76); text-align:left; padding: 15px 25px 15px 25px;}
    #amount{height:30px; padding-left:20px;}

	/* 상품디테일 */
	.detailArea{width:1100px; height:500px; text-align:center; margin:auto; padding: 25px 50px 25px 50px;}
    .content{width:1000px; height:450px;}



    
    /* #layoutSidenav_content div {outline: 1px solid blueviolet;} */
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
				
				<div class="thumbnail">
					<img src="resources/profileUpfiles/hamster1.jpg" width="400" height="400">
				</div>

				<div class="information">
                    <div class="productInfo">
                        <table>
                            <tr>
                                <th colspan="2">BLACKPINK 1st FULL ALBUM</th>
                            </tr>
                            <tr>
                                <td width="120;">판매가</td>
                                <td>20000원</td>
                            </tr>
                            <tr>
                                <td>직원할인가</td>
                                <td>18000원</td>
                            </tr>
                        </table>
                        <hr>
                    </div>
                    <div class="calculation">
                        <table>
                            <tr>
                                <td colspan="2">BLACKPINK 1st FULL ALBUM</td>
                            </tr>
                            <tr>
                                <td><input type="number" id="amount" name="amount" value="1" min="1" max="10"></td>
                                <td align="right">36000원</td>
                            </tr>
                        </table>
                    </div>
                    <div class="totalPrice">
                        <table>
                            <tr>
                                <td>Total</td>
                                <td align="right">36000원</td>
                            </tr>
                        </table>
                    </div>
                    <a type="button" class="btn btn-light btn-lg" href="#">장바구니 담기</a>
                    <a type="button" class="btn btn-warning btn-lg" href="#">바로 구매하기</a>
                </div>
			</div>
            
			<!-- 상품디테일 -->
			<div class="detailArea">
                <div class="content">

                </div>
			</div>
			
        </div>
    </div>

	<script>
        $(function() {
            $(".thumbnail>img").click(function() {
            	location.href ="storeDetail.st";		<%--?bno=" + $(this).children(".bno").text();--%>
                console.log("상품클릭");
            })
        });

		$('a.feellink').click(function(e) {
			e.preventDefault();   
		});
    </script>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>brEnter Admin</title>

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
	border-color: rgb(255, 227, 14); 
	box-shadow: 0 1px 1px rgba(255, 247, 23, 0.075) inset, 0 0 8px rgba(182, 174, 89, 0.6);
	outline: 0 none;
	}

    textarea:focus, .uneditable-input:focus {
	border-color: rgb(255, 227, 14) !important; 
	box-shadow: 0 1px 1px rgba(255, 247, 23, 0.075) inset, 0 0 8px rgba(182, 174, 89, 0.6) !important;
	outline: 0 none !important;
	}

	/* button 스타일 */
	.btn-warning {background-color: rgb(255, 227, 115); border-color: rgb(255, 227, 115); margin-right: 75px;}
    .btn-light {background-color: rgb(215, 215, 215); border-color: rgb(215, 215, 215);}
	
	/* 스타일 */
	.content {
	    width: 1100px; 
	    height: 660px; 
	    margin: auto;
	    background-color:rgb(240, 240, 240); 
	    box-shadow: 0 7px 15px rgb(0 0 0 / 40%);
	}
	
	/* .content div {outline: 1px solid blueviolet;} */
    .content1 {width: 100%; height: 250px;}
    .content2 {width: 100%; height: 325px;}
    .summernote {width: 950px; height: 290px; margin: 15px 75px 25px 75px; background-color: white;}

	.productImage, .productInfo {float: left;}
    .productImage {width: 285px; height: 100%; padding: 40px 0px 0px 75px;}
    .productImage img {width: 200px; height: 200px;}

    .productInfo {width: 740px; height: 100%; padding-top: 45px;}
	.productInfo table {width:100%;}
	.productInfo>table *{margin-bottom: 10px;}
	.productInfo>table th {text-align:center; width:130px; font-size: 17px;}

    input{height:40px; background-color: white !important;}
	.content button{height:38px; width:100px; text-align:center;}
	.input-group-append {margin-bottom: 0 !important;}

    textarea{background-color: white !important; resize: none;}
</style>
</head>
<body class="sb-nav-fixed">
    <!-- 상단바 -->
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark2">
		<jsp:include page="../common/adminHeader.jsp"/>
    </nav>
    
    <div id="layoutSidenav">
        
        <!-- 메뉴바 -->
        <div id="layoutSidenav_nav">
            <jsp:include page="../common/adminMenu.jsp"/>
        </div>

        <!-- 컨텐츠 -->
        <div id="layoutSidenav_content">
            <div class="content">
                
                <form method="post">
                    <div class="content1">

                        <div class="productImage">                  
                            <img class="profile" src="resources/profileUpfiles/defaultProfile.jpg" alt="">
                        </div>
        
                        <div class="productInfo">
                            <table align="center">
                                <tr>
                                    <th><label for="productNo">상품번호</label></th>
                                    <td><input type="text" id="productNo" class="form-control" name="" value="147" readonly></td>
                                    <th><label for="productCtg">카테고리</label></th>
                                    <td><input type="text" id="productCtg " class="form-control" name="" value="Album" readonly></td>
                                </tr>
                                <tr>
                                    <th><label for="productName">상품명</label></th>
                                    <td colspan="3"><input type="text" id="productName" class="form-control" name="" value="BLACKPINK 1st FULL ALBUM" readonly></td>
                                </tr>
                                <tr>
                                    <th><label for="originPrice">판매가</label></th>
                                    <td><input type="text" id="originPrice" class="form-control" name="" value="20000원" readonly></td>
                                    <th><label for="memberPrice">직원가</label></th>
                                    <td><input type="text" id="memberPrice " class="form-control" name="" value="18000원" readonly></td>
                                </tr>
                                <tr>
                                    <th><label for="stock">재고</label></th>
                                    <td><input type="text" id="stock" class="form-control" name="" value="147" readonly></td>
                                    <th><label for="status">진열여부</label></th>
                                    <td><input type="text" id="status " class="form-control" name="" value="Y" readonly></td>
                                </tr>
                            </table>                        
                        </div>

                    </div>

                    <div class="content2">
                        <div class="summernote">
                            <textarea id="summernote" name="" cols="108" rows="12" class="form-control" readonly></textarea>
                        </div>
                    </div>

                    <div class="buttonArea" style="float:right;">
                        <button type="button" class="btn btn-light" onclick="javascript:history.go(-1);">뒤로가기</button>
                        <button type="button" class="btn btn-warning" style="margin-left: 7px;">수정하기</button>
                    </div>

                </form>

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>



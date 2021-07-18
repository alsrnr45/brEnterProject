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

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

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
	/* input 스타일 */
	input:focus, input[type]:focus, .uneditable-input:focus {
    border-color: #ced4da !important; 
	box-shadow: 0 0 1px rgba(72, 72, 72, 0) inset, 0 0 0px rgba(72, 72, 72, 0) !important;
	outline: 0 none;}
    input{height:40px; background-color: white !important;}

    /* textarea 스타일 */
    /* textarea:focus, .uneditable-input:focus {
	border-color: #ced4da !important; 
	box-shadow: 0 0 1px rgba(72, 72, 72, 0) inset, 0 0 0px rgba(72, 72, 72, 0) !important;
	outline: 0 none !important;} */
    textarea{background-color: white !important; resize: none;}

	/* button 스타일 */
    .btn-light {background-color: rgb(215, 215, 215); border-color: rgb(215, 215, 215); height:40px; width:100px; text-align:center;}
	.btn-warning {background-color: rgb(252, 224, 110); border-color: rgb(255, 224, 110); height:40px; width:100px; text-align:center;}
	.btn-danger {background-color: rgb(253, 128, 128); border-color: rgb(255, 134, 134); height:40px; width:100px; text-align:center; color: black; }
	
	/* 영역 */
	/* .content div {outline: 1px solid blueviolet;} */
	.content {
	    width: 1100px; 
	    height: 660px; 
	    margin: auto;
	    background-color:rgb(240, 240, 240); 
	    box-shadow: 0 7px 15px rgb(0 0 0 / 40%);
	}
    .infoArea {width:100%; height:240px;}
    .detailArea {width:100%; height:350px; padding: 15px 75px 25px 75px;}
    .buttonArea {width:100%; height:70px;  padding: 0px 0 0 700px;}

    .summernote {width:950px; height:320px;}
	#summernote{height:100%; background-color:white !important; overflow:auto;}


    /*  */
	.productImage, .productInfo {float: left;}
    .productImage {width: 285px; height: 100%; padding: 30px 0px 0px 75px;}
    .productImage img {width: 200px; height: 200px;}

    .productInfo {width: 740px; height: 100%; padding-top: 35px;}
	.productInfo table {width:100%;}
	.productInfo>table *{margin-bottom: 10px;}
	.productInfo>table th {text-align:center; width:130px; font-size: 17px;}
	
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
                <inpu method="post">
                
                    <div class="infoArea">

                        <div class="productImage">                  
                            <img src="${ p.pdtFile }">
                        </div>
        
                        <div class="productInfo">
                            <table align="center">
                                <tr>
                                    <th><label for="productNo">상품번호</label></th>
                                    <td><input type="text" class="form-control" value="${ p.pdtNo }" readonly></td>
                                    <th><label for="productCtg">카테고리</label></th>
                                    <td><input type="text" class="form-control" value="${ p.pdtCtg }" readonly></td>
                                </tr>
                                <tr>
                                    <th><label for="productName">상품명</label></th>
                                    <td colspan="3"><input type="text" class="form-control" value="${ p.pdtName }" readonly></td>
                                </tr>
                                <tr>
                                    <th><label for="originPrice">판매가</label></th>
                                    <td><input type="text" class="form-control" value="${ p.orgPrice }원" readonly></td>
                                    <th><label for="memberPrice">직원가</label></th>
                                    <td><input type="text" class="form-control" value="${ p.memPrice }원" readonly></td>
                                </tr>
                                <tr>
                                    <th><label for="stock">재고</label></th>
                                    <td><input type="text" class="form-control" value="${ p.pdtStock }" readonly></td>
                                    <th><label for="status">진열여부</label></th>
                                    <td><input type="text" class="form-control" value="${ p.pdtStatus }" readonly></td>
                                </tr>
                            </table>                        
                        </div>
                        
                    </div>

                    <div class="detailArea">
                        <div class="summernote">
                            <div  id="summernote" class="form-control" style="background-color: white !important;">${ p.pdtDetail }</div>
                        </div>                     
                    </div>

                    <div class="buttonArea">
                        <a type="button" class="btn btn-light" href="productList.admin">뒤로가기</a>
                        <a type="button" class="btn btn-warning" href="productUpdateForm.admin?pno=${ p.pdtNo }" style="margin-left: 7px;">수정하기</a>
                        <a type="button" class="btn btn-danger" id="deleteProduct" style="margin-left: 7px;">삭제하기</a>
                    </div>                    
                </form>
            </div>
        </div>
    </div>
    
    
    <script>
        // 썸머노트
        $(document).ready(function() {

            $('#summernote').summernote({
                height: 310,                    // 에디터 높이
                minHeight: null,                // 최소 높이
                maxHeight: null,                // 최대 높이
                focus: true,                    // 에디터 로딩후 포커스를 맞출지 여부
                lang: "ko-KR",                  // 한글 설정
                resize: none,
                toolbar: []                
            });

            $('#summernote').summernote('disable');
        });

        /*
        $(function(){
	        $("#deleteProduct").click(function(){
	           //location.href="deleteProduct.admin?pno=" + ${ p.pdtNo } ;
	           
	        	Swal.fire({
                    icon: 'error',
                    text: '최대 주문수량은 5개 입니다.'
                });
	        })
	     })
	     */
	     $(function() {
            $(document).on("click", "#deleteProduct", function(){

            	swal.fire({
					icon  : "warning",
					text  : "정말로 삭제하시겠습니까?",
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: '삭제',
					cancelButtonText: '취소'
            	}).then((result) => {
            		  /* Read more about isConfirmed, isDenied below */
            		  if (result.isConfirmed) {
            			  location.href="deleteProduct.admin?pno=" + ${ p.pdtNo };
            			  Swal.fire('', '성공적으로 삭제되었습니다!', 'success')
            		  } 
           		})
           	
            })
        });
        
        
        
	     
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>



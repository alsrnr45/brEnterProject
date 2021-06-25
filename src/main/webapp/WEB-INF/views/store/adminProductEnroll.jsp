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

<style>
	/* input 스타일 */
    input{height:40px;}

	/* button 스타일 */
	.btn-warning {background-color:rgb(255, 227, 115); border-color:rgb(255, 227, 115); margin-right:75px; height:38px; width:100px; text-align:center;}
    .btn-warning:hover, .btn-warning:focus, .btn-warning:active {background:rgb(253, 247, 210); border-color:rgb(253, 247, 210); box-shadow:0 1px 1px rgba(255, 247, 23, 0.075) inset, 0 0 8px rgba(182, 174, 89, 0.6);}
	.btn-light {background-color: rgb(215, 215, 215); border-color: rgb(215, 215, 215); height:38px; width:100px; text-align:center;} 
    	
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
                            <img id="titleImg" src="" alt="">
                            <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);" required>
                        </div>
        
                        <div class="productInfo">
                            <table align="center">
                                <tr>
                                    <th><label for="productNo">상품번호</label></th>
                                    <td><input type="text" id="productNo" class="form-control" name="" value="" required></td>
                                    <th><label for="productCtg">카테고리</label></th>
                                    <td><input type="text" id="productCtg " class="form-control" name="" value="" required></td>
                                </tr>
                                <tr>
                                    <th><label for="productName">상품명</label></th>
                                    <td colspan="3"><input type="text" id="productName" class="form-control" name="" value="" required></td>
                                </tr>
                                <tr>
                                    <th><label for="originPrice">판매가</label></th>
                                    <td><input type="text" id="originPrice" class="form-control" name="" value="" required></td>
                                    <th><label for="memberPrice">직원가</label></th>
                                    <td><input type="text" id="memberPrice " class="form-control" name="" value="" required></td>
                                </tr>
                                <tr>
                                    <th><label for="stock">재고</label></th>
                                    <td><input type="text" id="stock" class="form-control" name="" value="" required></td>
                                    <th><label for="status">진열여부</label></th>
                                    <td><input type="text" id="status " class="form-control" name="" value="" required></td>
                                </tr>
                            </table>                        
                        </div>

                    </div>

                    <div class="content2">
                        <div class="summernote">
                            <textarea id="summernote" name=""></textarea>
                        </div>
                    </div>

                    <div class="buttonArea" style="float:right;">
                        <a type="button" class="btn btn-light" href="productList.admin">뒤로가기</a>
                        <button type="button" class="btn btn-warning" style="margin-left: 7px;">등록하기</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <script>
        // 썸머노트
        $(document).ready(function() {
            $('#summernote').summernote({
                height: 250,                    // 에디터 높이
                minHeight: null,                // 최소 높이
                maxHeight: null,                // 최대 높이
                focus: true,                    // 에디터 로딩후 포커스를 맞출지 여부
                lang: "ko-KR",					// 한글 설정
                placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
                
            });
        });
   
        // 상품사진
        $(function(){
            
            $("#file1").hide();

            $("#titleImg").click(function(){
                $("#file1").click();
            });

        })

        function loadImg(inputFile, num){
            // inputFile : 현재 변화가 생긴 input type="file" 요소객체
            // num : 몇번째 input요소인지 확인 후 해당 그 영역에 미리보기하기 위해

            // 파일을 선택하는 순간 inputFile.files라는 속성배열에 0번인덱스에 파일 담김
            if(inputFile.files.length == 1){ // 선택된 파일이 있을 경우

                // 파일을 읽어들일 FileReader 객체 생성
                var reader = new FileReader();

                // 선택된 파일을 읽어들이기
                // => 읽어들이는 순간 해당 그 파일만의 고유한 url 부여됨
                reader.readAsDataURL(inputFile.files[0]);

                // 파일 읽어들이기가 다 완료된 순간 실행할 함수 정의
                reader.onload = function(e){
                    // 각 영역에 맞춰서 이미지 미리보기
                    switch(num){
                        case 1: $("#titleImg").attr("src", e.target.result); break;
                    }
                }

            }else{ // 선택된 파일이 사라졌을 경우 

                switch(num){
                    case 1: $("#titleImg").attr("src", null); break;
                }

            }

        }
    </script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>



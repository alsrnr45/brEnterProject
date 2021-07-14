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
	/* 폰트 */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
	* {font-family: 'Noto Sans KR', sans-serif;}
	
	/* input 스타일 */
	input:focus, input[type]:focus, .uneditable-input:focus {
	border-color: rgb(255, 227, 14); 
	box-shadow: 0 1px 1px rgba(255, 247, 23, 0.075) inset, 0 0 8px rgba(182, 174, 89, 0.6);
	outline: 0 none;
	}
    input{height:40px; }

	/* button 스타일 */
	.btn-warning {background-color: rgb(255, 227, 115); border-color: rgb(255, 227, 115); margin-right: 75px; height:38px; width:100px; text-align:center;}
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
                
                <form id="updateProduct" method="post" action="updateProduct.admin" enctype="multipart/form-data">
                    <div class="content1">
                        <div class="productImage">                  
                            <img class="titleImg" src="${ p.pdtFile }">
							<input type="file" name="upfile" id="upfile" onchange="loadImg(this);">
							<input type="hidden" name="pdtFile" value="${ p.pdtFile }">
                        </div>
        
                        <div class="productInfo">
                            <table align="center">
                                <tr>
                                    <th><label for="productNo">상품번호</label></th>
                                    <td><input type="text" class="form-control" name="pdtNo" value="${ p.pdtNo }" required></td>
                                    <th><label for="productCtg">카테고리</label></th>
                                    <td><input type="text" class="form-control" name="pdtCtg" value="${ p.pdtCtg }" required></td>
                                </tr>
                                <tr>
                                    <th><label for="productName">상품명</label></th>
                                    <td colspan="3"><input type="text" class="form-control" name="pdtName" value="${ p.pdtName }" required></td>
                                </tr>
                                <tr>
                                    <th><label for="originPrice">판매가</label></th>
                                    <td><input type="text" class="form-control" name="orgPrice" value="${ p.orgPrice }" required></td>
                                    <th><label for="memberPrice">직원가</label></th>
                                    <td><input type="text" class="form-control" name="memPrice" value="${ p.memPrice }" required></td>
                                </tr>
                                <tr>
                                    <th><label for="stock">재고</label></th>
                                    <td><input type="text" class="form-control" name="pdtStock" value="${ p.pdtStock }" required></td>
                                    <th><label for="status">진열여부</label></th>
                                    <td><input type="text" class="form-control" name="pdtStatus" value="${ p.pdtStatus }" required></td>
                                </tr>
                            </table>                        
                        </div>

                    </div>

                    <div class="content2">
                        <div class="summernote">
                            <textarea id="summernote" name="pdtDetail">${ p.pdtDetail }</textarea>
                        </div>
                    </div>

                    <div class="buttonArea" style="float:right;">
                        <a type="button" class="btn btn-light" onclick="javascript:history.go(-1);">뒤로가기</a>
                        <button type="submit" class="btn btn-warning" style="margin-left: 7px;">수정완료</button>
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
            $("#upfile").hide();
            $(".titleImg").click(function(){
                $("#upfile").click();
            });

        })

        function loadImg(inputFile, num){
        	if(inputFile.files.length == 1){
        		var reader = new FileReader();
                reader.readAsDataURL(inputFile.files[0]);
                reader.onload = function(e){
                    $(".titleImg").attr("src", e.target.result);
                }
            }else{ 
                $(".titleImg").attr("src", null);
            }
        }
    </script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>



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
		border-color: rgb(155, 89, 182) !important; 
		box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6) !important;
		outline: 0 none !important;
	}
	
	/* 드롭박스 */
	select:focus, select:active{
	    border-color: rgb(155, 89, 182) !important;
	    box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6) !important;
	    outline: 0 none !important;
	}
	option:checked {background: rgb(155, 89, 182); color: white;}
	select{background:url(https://t1.daumcdn.net/cfile/tistory/99761B495C84AA8716) no-repeat 95% 50% !important;}
	p{font-size:15px; text-align: center; margin-top: 7px; margin-left: 15px;}
	
	/* 페이징바 */
	.pagination a {color:black;}
	.pagination a:hover, 
	.pagination a:focus {background: rgb(245, 238, 248); border-color: #dee2e6; color:black;}
	.pagination a:active {box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);}
	.page-item.active .page-link, .page-item.active .pagination a, .pagination .page-item.active a, .pagination li.active .page-link, .pagination li.active a {
	    z-index: 3; color: #fff; background-color: rgb(155, 89, 182); border-color: #dee2e6;}
	.pagination .active a, .pagination .active a:focus, .pagination .active a:hover {background-color: rgb(155, 89, 182); box-shadow: none;} 
	#pagingArea{margin: auto;}

	/* 카테고리, 검색창 */
	.headArea{width: 1200px; height: 100px; text-align: center; margin: auto; padding: 50px 85px 0px 85px;}
	.headArea>div {float: left;}
	.input-group {width: 250px; margin-left: 630px;}
	#form-group {width: 150px;}
	.btn-light {background-color: rgb(215, 215, 215); border-radius: 0rem 0.25rem 0.25rem 0rem;}
	
  	/* 자유게시판 리스트 */
    h1{margin-bottom: 20px;}
  	table{
  		text-align: center; 
  		margin: auto;
  	}
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
        
        	<!-- 컨텐츠 -->
        	<div id="layoutSidenav_content">
        		<main>
	                <div class="container-fluid px-4">
	                    
	                    <div class="container-fluid px-4">
	                        <h1 class="mt-4">자유게시판</h1>
	
	                        <div class="card mb-4">
	                            <div class="card-header">
	                                <i class="fas fa-chalkboard"></i> 게시판 > 자유게시판 &nbsp;
	                                <a class="btn btn-primary" href="boardFreeEnroll.bf" style="background-color:rgb(155, 89, 182); ; border-color:rgb(155, 89, 182);">
	                                	작성하기</a> 
	                            </div>
	                            <div class="card-body">	                                	                             	

	                                <table id="datatablesSimple" class="boardFreeList">
	                                    <thead>
	                                        <tr>
	                                            <th style="text-align:center;">번호</th>
	                                            <th style="text-align:center;">제목</th>
	                                            <th style="text-align:center;">작성자</th>
	                                            <th style="text-align:center;">조회수</th>
	                                            <th style="text-align:center;">작성일</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td>11</td>
	                                            <td>자유게시글 11입니다.</td>
	                                            <td>최사원</td>
	                                            <td>12</td>
	                                            <td>2021-06-15</td>
	                                        </tr>
	                                        <tr>
	                                            <td>10</td>
	                                            <td>자유게시글 10입니다.</td>
	                                            <td>최사원</td>
	                                            <td>12</td>
	                                            <td>2021-06-15</td>
	                                        </tr>
	                                        <tr>
	                                            <td>9</td>
	                                            <td>자유게시글 9입니다.</td>
	                                            <td>최사원</td>
	                                            <td>12</td>
	                                            <td>2021-06-15</td>
	                                        </tr>
	                                        <tr>
	                                            <td>8</td>
	                                            <td>자유게시글 8입니다.</td>
	                                            <td>최사원</td>
	                                            <td>12</td>
	                                            <td>2021-06-15</td>
	                                        </tr>
	                                        <tr>
	                                            <td>7</td>
	                                            <td>자유게시글 7입니다.</td>
	                                            <td>최사원</td>
	                                            <td>12</td>
	                                            <td>2021-06-15</td>
	                                        </tr>
	                                        <tr>
	                                            <td>6</td>
	                                            <td>자유게시글 6입니다.</td>
	                                            <td>최사원</td>
	                                            <td>12</td>
	                                            <td>2021-06-15</td>
	                                        </tr>
	                                        <tr>
	                                            <td>5</td>
	                                            <td>자유게시글 5입니다.</td>
	                                            <td>최사원</td>
	                                            <td>12</td>
	                                            <td>2021-06-15</td>
	                                        </tr>
	                                        <tr>
	                                            <td>4</td>
	                                            <td>자유게시글 4입니다.</td>
	                                            <td>최사원</td>
	                                            <td>12</td>
	                                            <td>2021-06-15</td>
	                                        </tr>
	                                        <tr>
	                                            <td>3</td>
	                                            <td>자유게시글 3입니다.</td>
	                                            <td>최사원</td>
	                                            <td>12</td>
	                                            <td>2021-06-15</td>
	                                        </tr>
	                                        <tr>
	                                            <td>2</td>
	                                            <td>자유게시글 2입니다.</td>
	                                            <td>최사원</td>
	                                            <td>12</td>
	                                            <td>2021-06-15</td>
	                                        </tr>
	                                        <tr>
	                                            <td>1</td>
	                                            <td>자유게시글 1입니다.</td>
	                                            <td>최사원</td>
	                                            <td>12</td>
	                                            <td>2021-06-15</td>
	                                        </tr>
	                                    </tbody>	                                                                 
	                                </table>	                               
	                            </div>
	                        </div>
	                    </div>
	                </div>
            	</main> 
        	</div>
	</div>
		
	<script>
    $(function() {
        $(".boardFreeList>tbody>tr").click(function() {
            location.href = "boardFreeDetail.bf";
            console.log("자유게시글 클릭");
        })
    }); 
   	</script>
   		
   	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="resources/js/datatables-simple-demo.js"></script>
	   		
</body>
</html>
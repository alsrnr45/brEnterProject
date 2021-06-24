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
	select{background: url(https://t1.daumcdn.net/cfile/tistory/99761B495C84AA8716) no-repeat 95% 50% !important;}
	p{font-size: 15px; text-align: left; margin-top: 7px; margin-left: 15px;}
	
	/* 페이징바 */
	.pagination a {color: black;}
	.pagination a:hover, 
	.pagination a:focus {background: rgb(245, 238, 248); border-color: #dee2e6; color: black;}
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
	
	/* 자유게시판 디테일 */	
	.wrap{width: 1200px;}	
	h1{margin-top: 20px; margin-left: 60px;}  
    .boardFreeDetailArea, .boardFreeReplyArea{margin-left: 100px;}
    a:hover{color: rgb(155, 89, 182);}
	
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
        		<div class="wrap">

                <h1>자유게시판</h1><hr>

                <a class="btn btn-primary" href="boardFreeList.bf" style="background-color:lightgray; border-color:lightgray; margin-left:950px;">
                목록으로</a> 
                <br><br><br>

                <div class="content">
                    <div class="boardFreeDetailArea">

                        <table id="boardFreeContnet">
                            <tr style="text-align:center;">
                                <th width="70">No.</th> 
                                <th width="600">제목</th>
                                <th width="100">작성자</th>
                                <th width="80">조회수</th>
                                <th width="100">작성일</th>
                            </tr>
                            <tr style="text-align:center;">
                                <td width="70">1</td> 
                                <td width="600">자유 게시글 제목입니다.</td>
                                <td width="100">최사원</td>
                                <td width="80">12</td>
                                <td width="100">2021-06-15</td>
                            </tr>
                            <tr>
                                <td colspan="5" height="50"><i class="fas fa-file-image"></i>&nbsp;
                                    첨부파일 : <a href="" download="">파일명.jpg</a>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5" style="background-color:rgb(248, 248, 248);"> 
                                    <p style="height:250px;">자유게시글 내용입니다.</p>
                                </td>
                            </tr>
                        </table>
                    </div> <br>

                    <div class="boardFreeBtn" style="margin-left:880px;">
                        <!-- 수정하기, 삭제하기 버튼은 이 글이 본인 글일 경우만 보여져야 됨 -->
                        <a class="btn btn-primary" href="boardFreeUpdate.bf" style="background-color:rgb(255, 231, 136); border-color:rgb(255, 231, 136);">
                        수정하기</a>
                        <a class="btn btn-danger" href="">삭제하기</a>
                    </div><br><br>
                </div>

                <div class="boardFreeReplyArea">

                    <table id="replyArea" width="960" style="background-color:rgb(248, 248, 248)"> <!-- 2행 4열 -->
                        <thead>
                            <tr>
                                <th colspan="2">
                                    <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none;"></textarea>
                                </th>
                                <th style="vertical-align: middle" width="150"><button class="btn btn-secondary" style="background-color:rgb(155, 89, 182); border-color:rgb(155, 89, 182)">
                                    댓글<br>등록</button></th>
                            </tr>
                            <tr>
                            <td colspan="3" height="50">댓글 (<span id="rcount">3</span>) </td> 
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>최사원 <i class="fas fa-heart"></i> 13</th>
                                <td rowspan="2" width="100">
                                    <a class="btn btn-primary" href="" style="background-color:rgb(255, 231, 136); border-color:rgb(255, 231, 136);">수정</a>
                                    <a class="btn btn-danger" href="">삭제</a>
                                </td>
                                <td rowspan="2" style="color:gray;">2020-04-10 15:35</td>
                            </tr>
                            <tr>
                                <td width="550" style="font-size:13px;">댓글 3입니다.</td>
                            </tr>

                            <tr>
                                <th>최대리 <i class="fas fa-heart"></i> 13</th>
                                <td rowspan="2">
                                   
                                </td>
                                <td rowspan="2" style="color:gray;">2020-04-10 15:35</td>
                            </tr>
                            <tr>
                                <td style="font-size:13px;">댓글 2입니다.</td>
                            </tr>

                            <tr>
                                <th>최부장 <i class="far fa-heart"></i> </th>
                                <td rowspan="2">
                                   
                                </td>
                                <td rowspan="2" style="color:gray;">2020-04-10 15:35</td>
                            </tr>
                            <tr>
                                <td  style="font-size:13px;">댓글 1입니다.</td>
                            </tr>
                        </tbody>
                    </table>
                </div>          
            </div>
		</div>	
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="resources/js/datatables-simple-demo.js"></script>

</body>
</html>
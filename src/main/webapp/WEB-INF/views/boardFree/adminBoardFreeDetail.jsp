<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>brEntertainment Admin</title>

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
	
	/* 드롭박스 스타일 */
	.dataTable-selector:focus, .dataTable-selector:active{
	    border-color: rgb(255, 227, 14); 
	    box-shadow: 0 1px 1px rgba(255, 247, 23, 0.075) inset, 0 0 8px rgba(182, 174, 89, 0.6);
	    outline: 0 none;
	}
	option:checked {background: rgb(255,235,152);}
	
	/* 페이징바 스타일 */
	.dataTable-pagination a {color: black;}
	.dataTable-pagination a:hover, 
	.dataTable-pagination a:focus {background: rgb(250, 246, 222); border-color: #dee2e6; color: black;}
	.dataTable-pagination a:active {box-shadow: 0 1px 1px rgba(255, 247, 23, 0.075) inset, 0 0 8px rgba(182, 174, 89, 0.6);}
	.page-item.active .page-link, .page-item.active .dataTable-pagination a, .dataTable-pagination .page-item.active a, .dataTable-pagination li.active .page-link, .dataTable-pagination li.active a {
	    z-index: 3; color: black; background-color: rgb(255,235,152); border-color: #dee2e6;}
	.dataTable-pagination .active a, .dataTable-pagination .active a:focus, .dataTable-pagination .active a:hover {
	    background-color: rgb(255, 232, 141);
	    box-shadow: none;}
	    
	/* 관리자 자유게시판 디테일 */
	h1{margin-top: 20px; margin-left: 40px;}  
    .adBoardFreeDetailArea, .adBoardFreeReplyArea{margin-left: 40px;}
    a:hover{color: rgb(255, 235, 152);}
	
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

        <!--컨텐츠-->
        <div id="layoutSidenav_content">
        
        	<div class="wrap">
    
                <h1>자유게시판</h1>
    
                <a class="btn btn-primary" href="" style="background-color:lightgray; border-color:lightgray; margin-left:900px;">목록으로</a> 
                <br><br><br>
    
                <div class="content">

                    <div class="adBoardFreeDetailArea">   
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
    
                    <div class="boardFreeBtn" style="margin-left:820px;">
                        <!-- 수정하기, 삭제하기 버튼은 이 글이 본인 글일 경우만 보여져야 됨 -->
                        <a class="btn btn-primary" href="" style="background-color:rgb(255, 231, 136); border-color:rgb(255, 231, 136);">수정하기</a>
                        <a class="btn btn-danger" href="">삭제하기</a>
                    </div><br><br>
                   
                    <div class="adBoardFreeReplyArea">                            
                        <table id="replyArea" width="960" style="background-color:rgb(248, 248, 248)"> 
                            <thead>
                                <tr>
                                    <th colspan="2" width="500">
                                        <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none;"></textarea>
                                    </th>
                                    <th style="vertical-align: middle" width="150"><button class="btn btn-secondary" style="background-color:rgb(155, 89, 182); border-color:rgb(155, 89, 182)">
                                        댓글<br>등록</button></th>
                                </tr>
                                <tr>
                                    <td colspan="2" height="50">댓글 (<span id="rcount">3</span>)</td> 
                                    <td>
                                        <button class="btn btn-danger">댓글 삭제</button>
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th width="35" rowspan="2"><input type="checkbox" id="checkFreeReply"></th>
                                    <th>최사원 <i class="fas fa-heart"></i> 13</th>
                                    <td rowspan="2" style="color:gray;">2020-04-10 15:35</td>
                                </tr>
                                <tr>
                                    <td width="550" style="font-size:13px;">댓글 3입니다.</td>
                                </tr>       

                                <tr>
                                    <th rowspan="2"><input type="checkbox" id="checkFreeReply"></th>
                                    <th>최대리 <i class="fas fa-heart"></i> 13</th>
                                    <td rowspan="2" style="color:gray;">2020-04-10 15:35</td>
                                </tr>
                                <tr>
                                    <td style="font-size:13px;">댓글 2입니다.</td>
                                </tr>
        
                                <tr>
                                    <th rowspan="2"><input type="checkbox" id="checkFreeReply"></th>
                                    <th>최부장 <i class="far fa-heart"></i> </th>
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
    </div>
    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="resources/js/datatables-simple-demo.js"></script>
    
</body>
</html>



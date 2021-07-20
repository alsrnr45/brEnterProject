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
	.outer{margin:auto; width:1000px; height:100%;}
    .outer .list{
        background-color: lightgray;
        color:white;
        border: none;
        float:right;
        width:100px;
        height:40px;
        font-size: 16px;
        margin-bottom: 20px;
    }
    .outer table{width:100%; text-align: center; font-size:15px; font-weight: lighter;}
    .outer table tbody{border-top:1px solid lightgray;}
    .outer .contentArea{
        height:500px; 
        width:100%; 
        border:1px solid lightgray;
        background: rgb(247, 247, 247); 
        padding:10px; 
        margin:30px 0 30px 0; 
        resize: none;
    }
    .outer .replyOuter{width:100%; margin-bottom: 30px;}
    .outer .replyArea{width:90%; float:left; resize: none;}
    .outer .replyBtn{width:10%; height:85px; border:none; background: rgb(255, 235, 152);}
    .outer .replyTable{width:100%;}
    .replyTable th{width:10%; padding:15px; border-bottom:1px solid lightgray; font-weight:bold; font-size: 16px;}
    .replyTable td>*{ display:inline;}
    .replyTable td{ border-bottom:1px solid lightgray; text-align: left;}
    .replyTable .update{ margin-left:550px; background:rgb(255, 231, 136);}
    .replyTable .delete{ margin-right:10px; background:rgb(255, 134, 134);}
    .replyTable p{font-size: 14px; color:gray;}
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
            <div class="outer">
                <br><br>
                <h1><b>NOTICE</b></h1>

                <a href="noticeList.admin" type="button" class="btn btn-primary list">목록으로</a>
                
                <table>
                    <thead>
                        <tr>
                            <td>No.</td>
                            <td>Title</td>
                            <td>Date</td>
                            <td>Hits</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${ n.noticeNo }</td>
                            <td>${ n.title }</td>
                            <td>${ n.enrolldate }</td>
                            <td>${ n.count }</td>
                        </tr>
                    </tbody>
                </table>    
                <textarea class="form-control contentArea">${ no.content }</textarea>  
                
                <div class="replyOuter">
                    <h5><b>댓글쓰기</b></h5>
                    <div>
                        <textarea  class="form-control replyArea" rows="3" id="comment" placeholder="댓글을 입력해주세요." required></textarea>
                        <button type="submit" class="btn btn-primary replyBtn">댓글등록</button>
                    </div>
                </div>  
                
                <div class="writeReply">
                    <div><h5><b>댓글(2)</b></h5></div>
                    <table class="replyTable">
                        <tbody >
                            <tr>
                                <th>김자바</th>
                                <td>
                                    그거참좋은스토리네여
                                   <!--  <button class="btn btn-sm update">수정</button>
                                    <button class="btn btn-sm delete">삭제</button> -->
                                    <p>2021/02/12</p>
                                </td>
                            </tr>
                            <tr>
                                <th>안소은</th>
                                <td>우와우와</td>
                            </tr>
                        </tbody>
                    </table>
                </div> 
                
            </div><br><br><br><br><br>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>



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
	/* 컨텐츠 */
    #btn{
        background-color: lightgray;
        color:white;
        border: none;
        float:right;
        width:100px;
        height:40px;
        font-size: 16px;
    }
    .outer{width:1000px; margin:auto;}
    .topTable{width:100%;}

    /* 아티스트 상세정보 테이블 */
    .detail_table{width:1000px;}
    .table_left{font-size:14px; width:60%; padding-right: 20px;}
    .table_right{ width:40%; padding-left:10px; top:0px; padding-top: 0px; position:sticky;}
    .table_right pre{font-size:12px;}
    .img>img{width:500px;}
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
        
		<input type="hidden" value="${ a.artistNo }">
        
        <!--컨텐츠-->
        <div id="layoutSidenav_content">
            <div class="outer">
                <br><br>
                <h1><b>${ a.name }</b></h1>
                <br><br>
               
                <table class="topTable">
                    <tr>
                        <th><h4><b>ABOUT</b></h4></th>
                        <th><a type="button" href="artistList.art" id="btn" class="btn btn-warning">목록으로</a></th>
                    </tr>
                </table>
                <hr>

                <!-- 아티스트 상세정보 테이블 -->
                <table class="detail_table">
                    <tr>
                        <td class="table_left">
                            <small>
                                ${ a.info }
                            </small>
                        </td>
                        <td class="table_right" rowspan="2">
                            <div>
                            <h5><b>DISCOGRAPHY</b></h5>
                            <pre>
${ a.album }
                            </pre>
                        
                            <h5><b>ACHIEVEMENT & AWARDS</b></h5>
                            <h6><b>음악방송</b></h6>
                            <pre>
${ a.musicBroad }
                            </pre>
            
                            <h6>방송프로그램</h6>
                            <pre>
${ a.broadCasting }
                            </pre>
            
                            <h6>수상내역</h6>
                            <pre>
${ a.award }
                            </pre>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="table_left img">
                            <img src="${ a.img }" alt="">
                        </td>
                    </tr>
                </table>
                <hr>
                <img src="resources/artistUpfiles/copyright.png">
                <br><br>
            </div>
        </div>
    </div>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

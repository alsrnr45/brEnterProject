<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>artistList</title>

<!-- 부트스트랩 탬플릿 -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
	/* 컨텐츠 */
	.outer{margin:auto; width:1000px;}
    .outer .title{margin: 50px 0px 50px 0px;}
    .outer .artistList{margin-left:10px; float:left;}
    .outer img:hover{-webkit-filter: grayscale(0%); filter: none; cursor: pointer;}
    .outer img{width:300px; height:350px; margin:0px 10px 0px 10px; -webkit-filter: grayscale(100%); filter: gray; background: chartreuse;}
    .outer p{
        background: rgb(0, 0, 0); 
        color:rgb(255, 255, 255); 
        text-align: center;
        font-size: 20px;
        font-weight: bold;
        height:30px;
        width:300px;
        margin:0px 10px 50px 10px; 
    }
    /* 페이징바 */
    .pagination a {color:black;}
    .pagination a:hover, .pagination a:focus {background: rgb(245, 238, 248); border-color: #dee2e6; color:black;}
    .pagination a:active {background-color: rgb(155, 89, 182) !important; box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);}
    .page-item.active .page-link, .page-item.active .pagination a, .pagination .page-item.active a, .pagination li.active .page-link, .pagination li.active a {
        z-index: 3; color: #fff; background-color: rgb(155, 89, 182); border-color: #dee2e6;}
    .pagination .active a, .pagination .active a:focus, .pagination .active a:hover {background-color: rgb(155, 89, 182); box-shadow: none;} 
    .pagination {justify-content: center !important;}
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
            <div class="outer">
                <div class="title"><h1><b>ARTISTS</b></h1></div>
                <!-- 아티스트 리스트 -->
                <c:forEach var="a" items="${ list }">
	                <div class="artists">
	                    <div class="artistList">
	                        <input type="hidden" class="ano" value="${ a.artistNo }">
	                        <img src="${ a.img }">
	                        <p>${ a.name }</p>
	                    </div>
	                </div>
                </c:forEach>
            </div>
            
            <!-- 페이징바 -->
            <div class="pagingArea">
                <ul class="pagination">
                    <c:choose>
                        <c:when test="${ pi.currentPage eq 1 }">
                            <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="artistList.art?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
                        </c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                        <li class="page-item"><a class="page-link" href="artistList.art?currentPage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                            <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="artistList.art?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div><br><br><br><br><br>
            
        </div>
    </div>
	
	<script>
        $(function() {
            $(".artistList>img").click(function() {
            	location.href ="artistDetail.art?ano=" + $(this).prev(".ano").val();
            })
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

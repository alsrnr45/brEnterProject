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
	/* 드롭박스 */
	select:focus, select:active{
	    border-color: rgb(155, 89, 182) !important;
	    box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6) !important;
	    outline: 0 none !important;}
	option:checked {background: rgb(155, 89, 182); color: white;}
	select{background:url(https://t1.daumcdn.net/cfile/tistory/99761B495C84AA8716) no-repeat 95% 50% !important;}
	p{font-size:15px; text-align: left; margin-top: 7px; margin-left: 15px;}

	/* 페이징바 */
	.pagination a {color:black;}
	.pagination a:hover, .pagination a:focus {background: rgb(245, 238, 248); border-color: #dee2e6; color:black;}
	.pagination a:active {background-color: rgb(155, 89, 182) !important; box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);}
	.page-item.active .page-link, .page-item.active .pagination a, .pagination .page-item.active a, .pagination li.active .page-link, .pagination li.active a {
	    z-index: 3; color: #fff; background-color: rgb(155, 89, 182); border-color: #dee2e6;}
	.pagination .active a, .pagination .active a:focus, .pagination .active a:hover {background-color: rgb(155, 89, 182); box-shadow: none;} 
	.pagination {justify-content: center !important;}

	/* 영역 */
	/* #layoutSidenav_content div {outline: 1px solid blueviolet;} */
	.content{width:1200px; height:955px; margin: auto;}
	.headArea{width: 1200px; height: 100px; text-align: center; margin: auto; padding: 50px 80px 0px 80px;}
	.listArea{width:100%; height:800px; text-align: center; margin: auto;}
	.pagingArea{width:100%; height:55px; margin: auto;}

	/* 카테고리, 검색창 */
	.headArea>div {float: left;}
	.input-group {width: 250px; margin-left: 640px;}
	#form-group {width: 150px;}
	.btn-light {background-color: rgb(215, 215, 215); border-radius: 0rem 0.25rem 0.25rem 0rem; border: 1px solid #ced4da;}
	.btn-light:focus, .btn-light:active{
	    border-color: rgb(155, 89, 182) !important;
	    box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6) !important;
	    outline: 0 none !important;}
	
	/* 상품리스트 */
    .thumbnail{width: 320px; display: inline-block; margin: 15px 20px 15px 20px;}
    .thumbnail:hover{cursor:pointer; opacity:0.6;}
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

        <!--컨텐츠-->
        <div id="layoutSidenav_content">
            
			<div class="content">
				<div class="headArea">
					<!-- 카테고리 -->
					<div id="form-group">
						<select class="form-control">
							<option value="newest">최신순</option>
							<option value="expensive">높은가격순</option>
							<option value="cheap">낮은가격순</option>
						</select>
					</div>

					<!-- 검색창 -->
					<div class="input-group">
						<input type="text" class="form-control" placeholder="상품 검색">
						<div class="input-group-append">
							<button class="btn btn-light" type="submit"><i class="fas fa-search"></i></button>
						</div>
					</div>
				</div>

				<!-- 상품리스트 -->
				<div class="listArea">
					<c:forEach var="p" items="${ list }">
						<div class="thumbnail" align="center">
							<input type="hidden" class="pno" value="${ p.pdtNo }">
							<img src="${ p.pdtFile }" width="300" height="300">
							<p>
								${ p.pdtName }<br>
								<s><em>${ p.orgPrice }원</em></s> &nbsp;&nbsp; ${ p.memPrice }원
							</p>
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
								<li class="page-item"><a class="page-link" href="storeList.st?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<li class="page-item"><a class="page-link" href="storeList.st?currentPage=${ p }">${ p }</a></li>
						</c:forEach>
						
						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="storeList.st?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
    	</div>
    </div>

	<script>
        $(function() {
            $(".thumbnail>img").click(function() {

				// console.log(typeof ($(this).prev(".pno").val()));
            	location.href ="storeDetail.st?pno=" + $(this).prev(".pno").val();
            })
        });
    </script>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

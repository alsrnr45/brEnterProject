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
	
	/* input 스타일 */
	input:focus, input[type]:focus, .uneditable-input:focus {
	border-color: rgb(155, 89, 182); 
	box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);
	outline: 0 none;
	}
	
	/* 드롭박스 스타일 */
	.dataTable-selector:focus, .dataTable-selector:active{
	    border-color: rgb(155, 89, 182); 
	    box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);
	    outline: 0 none;
	}
	option:checked {background: rgb(155, 89, 182); color: white;}
	
	/* 페이징바 스타일 */
	.dataTable-pagination a {color:black;}
	.dataTable-pagination a:hover, 
	.dataTable-pagination a:focus {background: rgb(245, 238, 248); border-color: #dee2e6; color:black;}
	.dataTable-pagination a:active {box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);}
	.page-item.active .page-link, .page-item.active .dataTable-pagination a, .dataTable-pagination .page-item.active a, .dataTable-pagination li.active .page-link, .dataTable-pagination li.active a {
	    z-index: 3; color: #fff; background-color: rgb(155, 89, 182); border-color: #dee2e6;}
	.dataTable-pagination .active a, .dataTable-pagination .active a:focus, .dataTable-pagination .active a:hover {
	    background-color: rgb(155, 89, 182);
	    box-shadow: none;} 
	
	/* 게시판 */
	
	.menuOuter {
		font-size:0.8125em;
		margin:auto;
		width:57%;
	}
	.boardMenuTitle{
		cursor:pointer;
		width:30%;
	}
	.boardMenuEnrolldateh, .boardMenuEnrolldated {
		width:25%;
	}
	
	/* 검색창 */
	
	.searchTag {
		color:black;
	 	position: absolute;
	 	margin-left:13%;
	 	cursor:pointer;
	 }
	}
	a:hover {
		color:gray;
		cursor:pointer;
	}
	
	/* 페이징바 */
	.pagination{justify-content:center;}
	.page-link{colo:black;}
	
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
            
        <c:set var="list" value="${boardMenuList}" />
        	    
        <div class="menuOuter">
        <h1>주간식단</h1>
        <br>
	    	<div>
	        	<div>
	        		<a class="searchTag"><div class="fa fa-search"></div></a>
	        		<form action="boardMenuList.bm">
	        		<input type="search" name="keyword" id="searchText" placeholder="검색어를 입력하세요" value="${page.keyword }">
	        		</form>
	        	</div>
	        </div>
	        	
	        	<script>
	        	$(function(){
        			$(".searchTag").click(function(){
        				location.href="boardMenuList.bm?keyword=" + $("#searchText").val();
        			})
        		})
	        	</script>
	        <br>
	        	
	        <div>
	        	<form name="menuList" id="menuList" method="post" action="">
	        		<table class="table">
	        			<thead class="table-light" align="center">
	        				<tr>
	        					<th>번호</th>
	        					<th>제목</th>
	        					<th>조회수</th>
	        					<th class="boardMenuEnrolldateh">작성일</th>
	        				</tr>
	        			</thead>
	        			<tbody align="center">
	        				<c:forEach items="${boardMenuList}" var="boardMenuList">
	        				<tr>
	        					<td>${boardMenuList.weekmenuNo}</td>
	        					<td class="boardMenuTitle">${boardMenuList.weekmenuTitle}</td>
	        					<td>${boardMenuList.weekmenuCount}</td>
	        					<td class="boardMenuEnrolldated">${boardMenuList.weekmenuEnrolldate}</td>
	        				</tr>
	        				</c:forEach>
	        			</tbody>
	        		</table>
	        	</form>
	        	<script>
	        		$(function(){
	        			$("#menuList .boardMenuTitle").click(function(){
	        				location.href="boardMenuDetail.bm?weekmenuNo=" + $(this).prev().text();
	        			})
	        		})
	        	</script>
	        		
	        <nav aria-label="Page navigation example">
				<ul class="pagination">
				<c:if test="${page.page != 1 }">
					<li class="page-item">
						<a class="page-link" href="boardMenuList.bm?page=${page.page - 1}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					</c:if>
					<c:forEach begin="1" end="${page.total / 15 +1}" step="1" var="i">
					<li class="page-item"><a class="page-link" href="boardMenuList.bm?page=${i }">${i }</a></li>
					
					</c:forEach>
					<c:if test="${page.page != lastpage }">
					<li class="page-item">
						<a class="page-link" href="boardMenuList.bm?page=${page.page +1}" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
					</c:if>
				</ul>
			</nav>
					
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

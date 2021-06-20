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
	    
	/*전체화면, 검색창*/
	table, #searchText {
		font-size: 13px;
		margin: 10px;
	}
	#searchText {
		width: 200px;
		height: 30px;
		margin-top: 90px;
		margin-left: 200px;
		float: left;
	}
	.searchTag {
		color: black;
		decoration: none;
		position: absolute;
		margin-top: 93px;
		margin-left: 378px;
	}
	
	/*리스트*/
	#menuList {
		width: 900px;
		margin-bottom: 415px;
		margin-right: 18px;
	}
	
	/*페이징바*/
	.pagination {
		justify-content: center;
	}
	.page-link {
		color: black;
	}
	
	/*a태그, 버튼*/
	.enrollBtn {
		position: absolute;
		margin-top: 99px;
		margin-left: 630px;
		border: 3px solid rgb(255, 235, 152);
		background: rgb(255, 235, 152);
		font-weight: bold;
        font-size: 13px;
        text-decoration: none;
        color: black;
        border-radius: 3px;
        width: 50px;
        height: 27px;
	}
	a:hover {
		color: gray;
		cursor: pointer;
	}
	
</style>

</head>
<body class="sb-nav-fixed">
   <!-- 상단바 -->
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<jsp:include page="userHeader.jsp"/>
    </nav>
    
    <div id="layoutSidenav">
        
        <!-- 메뉴바 -->
        <div id="layoutSidenav_nav">
            <jsp:include page="userMenu.jsp"/>
        </div>

        <!--컨텐츠-->
        <div id="layoutSidenav_content">
            
           <div class="search">
    			<div class="searchIcon">
    				<a class="searchTag"><div class="fa fa-search"></div></a>
	    			<input type="search" id="searchText" placeholder="검색어를 입력하세요">
    			</div>
    				<a href="" class="enrollBtn">&nbsp;글쓰기</a>
    			</div> 
            
            <div class="menuOuter" align="center">
        		<form name="menuList" id="menuList" method="post" action="#">
            		<table class="table">
                		<thead class="table-light" align="center">
                    		<tr>
                        		<th>번호</th>
                        		<th>제목</th>
                        		<th>조회수</th>
                        		<th>작성일</th>
                    		</tr>
                		</thead>
                		<tbody align="center">
                    		<tr>
                        		<td>3</td>
                        		<td>2021-06-07 ~ 2021-06-11 주간식단</td>
                        		<td>117</td>
                        		<td>2021-06-07</td>
                    		</tr>
                    		<tr>
                        		<td>2</td>
                        		<td>2021-05-31 ~ 2021-06-04 주간식단</td>
                        		<td>264</td>
                        		<td>2021-05-31</td>
                    		</tr>
                    		<tr>
                    			<td>1</td>
                    			<td>2021-05-24 ~ 2021-05-28 주간식단</td>
                    			<td>310</td>
                    			<td>2021-05-24</td>
                    		</tr>
                		</tbody>
            		</table>
        		</form>
        	</div>
        	
        	<nav aria-label="Page navigation example">
		  		<ul class="pagination">
		    		<li class="page-item">
		      			<a class="page-link" href="#" aria-label="Previous">
		        		<span aria-hidden="true">&laquo;</span>
		      			</a>
		    		</li>
		    		<li class="page-item"><a class="page-link" href="#">1</a></li>
		    		<li class="page-item"><a class="page-link" href="#">2</a></li>
		    		<li class="page-item"><a class="page-link" href="#">3</a></li>
		    		<li class="page-item">
		      			<a class="page-link" href="#" aria-label="Next">
		        		<span aria-hidden="true">&raquo;</span>
		      			</a>
		    		</li>
		  		</ul>
			</nav>
		
    </div>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

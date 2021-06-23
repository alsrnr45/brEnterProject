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
	p{font-size:15px; text-align: left; margin-top: 7px; margin-left: 15px;}
	
	/* 페이징바(수정중) */
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

	/* 상품리스트 */
	.listArea{width:1200px; text-align: center; margin: auto;}
    .thumbnail{width: 320px; display: inline-block; margin: 15px 20px 15px 20px;}
    .thumbnail:hover{cursor:pointer; opacity:0.7;}

	/* #layoutSidenav_content div {outline: 1px solid blueviolet;} */
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
				<c:forEach var="s" items="${ list }">
					<div class="thumbnail" align="center">
						<input type="hidden" value="">
						<img src="${ s.pdtFile}" width="300" height="300">
						<p>
							${ s.pdtName }<br>
							<s><em>${ s.orgPrice }원</em></s> &nbsp;&nbsp; ${ s.memPrice }원
						</p>
					</div>
				</c:forEach>
				
				<%-- 
				<div class="thumbnail" align="center">
					<input type="hidden" value="">
					<img src="resources/profileUpfiles/hamster1.jpg" width="300" height="300">
					<p>
						BLACKPINK 1st FULL ALBUM<br>
						<s><em>20000원</em></s> &nbsp;&nbsp; 18000원
					</p>
				</div>
				<div class="thumbnail" align="center">
					<input type="hidden" value="">
					<img src="resources/profileUpfiles/hamster1.jpg" width="300" height="300">
					<p>
						BLACKPINK 1st FULL ALBUM<br>
						<s><em>20000원</em></s> &nbsp;&nbsp; 18000원
					</p>
				</div>
				<div class="thumbnail" align="center">
					<input type="hidden" value="">
					<img src="resources/profileUpfiles/hamster1.jpg" width="300" height="300">
					<p>
						BLACKPINK 1st FULL ALBUM<br>
						<s><em>20000원</em></s> &nbsp;&nbsp; 18000원
					</p>
				</div>
				<div class="thumbnail" align="center">
					<input type="hidden" value="">
					<img src="resources/profileUpfiles/hamster1.jpg" width="300" height="300">
					<p>
						BLACKPINK 1st FULL ALBUM<br>
						<s><em>20000원</em></s> &nbsp;&nbsp; 18000원
					</p>
				</div>
				<div class="thumbnail" align="center">
					<input type="hidden" value="">
					<img src="resources/profileUpfiles/hamster1.jpg" width="300" height="300">
					<p>
						BLACKPINK 1st FULL ALBUM<br>
						<s><em>20000원</em></s> &nbsp;&nbsp; 18000원
					</p>
				</div>
				--%>
			</div>

			<div id="pagingArea">
			
				<ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="storeList.st?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="storeList.st?currentPage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="storeList.st?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
                
            </div>
        </div>
    </div>

	<script>
        $(function() {
            $(".thumbnail>img").click(function() {
            	location.href ="storeDetail.st";		<%--?bno=" + $(this).children(".bno").text();--%>
                console.log("상품클릭");
            })
        });

		// $('a.feellink').click(function(e) {
		// 	e.preventDefault();   
		// });
    </script>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

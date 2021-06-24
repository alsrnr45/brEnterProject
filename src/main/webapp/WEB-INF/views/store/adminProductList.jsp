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
	/* 스타일 */
	h1{margin-bottom:20px;}

    .card {box-shadow: 0 7px 15px rgb(0 0 0 / 40%);}
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
            <main>
                <div class="container-fluid px-4">
                    
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">상품관리</h1>

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-store me-1"></i>
                               	 상품조회
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple" class="productList">
                                    <thead>
                                        <tr>
                                            <th>상품번호</th>
                                            <th>카테고리</th>
                                            <th>상품명</th>
                                            <th>판매가</th>
                                            <th>직원할인가</th>
                                            <th>진열여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="p" items="${ list }">
                                            <tr>
                                                <td class="pno">${ p.pdtNo }</td>
                                                <td>${ p.pdtCtg }</td>
                                                <td>${ p.pdtName }</td>
                                                <td>${ p.orgPrice }</td>
                                                <td>${ p.memPrice }</td>
                                                <td>${ p.pdtStatus }</td>
                                            </tr>
										</c:forEach>
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

            $(document).on("click", ".productList>tbody>tr", function(){
                location.href ="productDetail.admin?=pno" + $(this).children(".pno").text();
            });
            
        })

    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>



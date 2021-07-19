<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMenu</title>
</head>
<body class="sb-nav-fixed">
        
	<!-- 메뉴바 -->
	<div id="layoutSidenav_nav">
	    <nav class="sb-sidenav accordion sb-sidenav-light2" id="sidenavAccordion">
	        <div class="sb-sidenav-menu">
	            <div class="nav">
	
	                <!-- 인사관리 --><br>
	                 <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#personnelManagement" aria-expanded="false" aria-controls="collapseLayouts">
	                    <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
	                    	사원관리
	                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                </a>
	                <div class="collapse" id="personnelManagement" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                    <nav class="sb-sidenav-menu-nested nav">
	                        <a class="nav-link" href="newMemberList.admin">신규사원관리</a>
	                        <a class="nav-link" href="memberList.admin">기존사원관리</a>
	                    </nav>
	                </div>        								
	
	                <!-- 게시판 -->
	                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#board" aria-expanded="false" aria-controls="collapseLayouts">
	                    <div class="sb-nav-link-icon"><i class="fas fa-chalkboard"></i></div>
	                    	게시판 관리
	                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                </a>
	                <div class="collapse" id="board" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                    <nav class="sb-sidenav-menu-nested nav">
	                        <a class="nav-link" href="#">경조사</a>
	                        <a class="nav-link" href="adminBoardMenuList.bm">주간식단</a>
	                        <a class="nav-link" href="adminBoardFreeList.bf">자유게시판</a>
	                    </nav>
	                </div>
	                
	                <!-- BR엔터소식 -->
	                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#brEnterNotice" aria-expanded="false" aria-controls="collapseLayouts">
	                    <div class="sb-nav-link-icon"><i class="fas fa-bullhorn"></i></div>
	                    BR엔터소식
	                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                </a>
	                <div class="collapse" id="brEnterNotice" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                    <nav class="sb-sidenav-menu-nested nav">
	                        <a class="nav-link" href="#">Notice</a>
	                        <a class="nav-link" href="#">Artists</a>
	                        <a class="nav-link" href="#">News</a>
	                        <a class="nav-link" href="#">Schedule</a>
	                        <a class="nav-link" href="#">Comeback Info</a> <!--컴백이미지슬라이드 관리자 등록-->
	                    </nav>
	                </div>
	
	                <!-- 스토어 -->
	                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#store" aria-expanded="false" aria-controls="collapseLayouts">
	                    <div class="sb-nav-link-icon"><i class="fas fa-store"></i></div>
	                    	스토어 관리
	                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                </a>
	                <div class="collapse" id="store" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                    <nav class="sb-sidenav-menu-nested nav">
	                        <a class="nav-link" href="productList.admin">상품관리</a>
	                    </nav>
	                </div>
	                
	                <!-- 일정관리 -->
	                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#adminSchedule" aria-expanded="false" aria-controls="collapseLayouts">
	                    <div class="sb-nav-link-icon"><i class="fas fa-calendar-alt fa-fw"></i></div>
	                    일정관리
	                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                </a>
	                <div class="collapse" id="adminSchedule" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                    <nav class="sb-sidenav-menu-nested nav">
	                        <a class="nav-link" href="adminCalendar.sch">관리자 전체일정보기</a>
	                        <a class="nav-link" href="adminEnroll.sch">관리자 일정만들기</a>
	                    </nav>
	                </div>
	
	            </div>
	        </div>
	    </nav>
	</div>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

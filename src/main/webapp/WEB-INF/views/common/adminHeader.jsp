<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminHeader</title>
</head>
<body class="sb-nav-fixed">
    
	<!-- 상단바 -->
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark2">
	    <!-- Navbar Brand-->
	    <a class="navbar-brand ps-3" href="index.html" style="width: 225px;">
	          <img src="resources/images/brLogo_admin.png" style="height: 56px;"></a>
	  
	    <!-- Sidebar Toggle-->
	    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
	    
	    <!-- Navbar-->
	    <div style="width:100%;" align="right">
	        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4" style="flex-direction: column;"> <!--flex를 column 설정값으로 바꿈-->
	            <li class="nav-item dropdown" style="justify-content: space-between;"> 
	                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
	                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
	                    <li><a class="dropdown-item" href="#!">사원명</a></li>
	                    <li><a class="dropdown-item" href="#!" style="font-size: 13px;">이메일</a></li>
	                    <li><hr class="dropdown-divider" /></li>
	                   
	                   <!--logout-->
	                   <div class="dropmenu">
		                    <button class="logout mymenu" >Logout</button><button class="mypage2 mymenu">HOME</button>
							<!--<li><a class="dropdown-item" href="#!">Logout</a></li> *dropdown-item 사용시 한칸 전부사용됨-->
	                    </div>
	                  </ul>
	              </li>
	          </ul>
		</div>
	</nav>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

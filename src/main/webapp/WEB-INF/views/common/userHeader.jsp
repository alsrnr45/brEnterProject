<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userTemplate</title>
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

    /* textarea 스타일 */
	.dataTable-input:focus{
	border-color: rgb(155, 89, 182); 
	box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);
	outline: 0 none;
	}
	
    /* btn 스타일 */
    .btn-primary{
        background-color: rgb(155, 89, 182);
        border-color: rgb(159, 103, 182);
    }

    .btn-primary:hover{
        background-color: rgba(155, 89, 182, 0.6);
        border-color: rgba(155, 89, 182, 0.6);
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
	    
	.dropCenter{
		text-align:center;
	}
</style>
</head>
<body class="sb-nav-fixed">
    
    <!-- 상단바 -->
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="logout.me" style="width: 225px;">
              <img src="resources/images/brLogo_user.png" style="height: 56px;"></a>
      
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        
        <!-- Navbar-->
        <div style="width:100%;" align="right">
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4" style="flex-direction: column;"> <!--flex를 column 설정값으로 바꿈-->
                <li class="nav-item dropdown" style="justify-content: space-between;"> 
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">

                        <c:choose>
                        	<c:when test="${ empty loginUser }" >
                        	<!-- 로그인 전 -->
		                        <li><a class="dropdown-item" href="#!">사원명</a></li>
		                        <li><a class="dropdown-item" href="#!" style="font-size: 13px;">이메일</a></li>
		                        <li><hr class="dropdown-divider" /></li> 
		                        <li><a href="logout.me" class="dropdown-item dropCenter">Logout</a></li>
		                        <li><a href="#!" class="dropdown-item dropCenter">MYPAGE</a></li>
	    
	                           
	                        </c:when>
	                        <c:otherwise>
            			  	<!-- 사용자-로그인 후  -->
   		                        <li><a class="dropdown-item" href="#!">${ loginUser.memName }</a></li>
		                        <li><a class="dropdown-item" href="#!" style="font-size:13px;">${ loginUser.id}@brent.com</a></li>
		                        	<li><hr class="dropdown-divider" /></li> 
			                        	
			                        	<!-- 관리자 로그인 경우 -->
			                        	<c:if test="${loginUser.adminStatus eq 'Y'}">
			                    			<li><a href="newMemberList.admin" class="dropdown-item dropCenter" style="color:purple;">ADMIN</a></li>
		                        			<li><hr class="dropdown-divider" /></li> 
			                        	</c:if>
		                    	
	                         	<li><a href="#!" class="dropdown-item dropCenter">MYPAGE</a></li>
           			            <li><a href="logout.me" class="dropdown-item dropCenter">Logout</a></li>
           			            
           			            
	                       		
	                        </c:otherwise>
                        </c:choose>

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

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
            <main>
                <div class="container-fluid px-4">
                    
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">급여내역</h1><br>

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-user me-1"></i>
                                	김자바님의 급여내역
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple" class="salaryList">
                                    <thead>
                                        <tr>
                                            <th>근무년도</th>
                                            <th>근무월</th>
                                            <th>근무시간</th>
                                            <th>기본급</th>
                                            <th>초과수당</th>
                                            <th>지급액</th>
                                            <th>지급일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>2021년</td>
                                            <td>5월</td>
                                            <td>220</td>
                                            <td>2.400,000</td>
                                            <td>110,000</td>
                                            <td>2,510,000</td>
                                            <td>2021.06.14</td>
                                        </tr>
                                        <tr>
                                            <td>2021년</td>
                                            <td>4월</td>
                                            <td>209</td>
                                            <td>2.400,000</td>
                                            <td>0</td>
                                            <td>2,400,000</td>
                                            <td>2021.05.14</td>
                                        </tr>
                                        <tr>
                                            <td>2021년</td>
                                            <td>3월</td>
                                            <td>209</td>
                                            <td>2.400,000</td>
                                            <td>0</td>
                                            <td>2,400,000</td>
                                            <td>2021.04.14</td>
                                        </tr>
                                        <tr>
                                            <td>2021년</td>
                                            <td>2월</td>
                                            <td>215</td>
                                            <td>2.400,000</td>
                                            <td>60,000</td>
                                            <td>2,460,000</td>
                                            <td>2021.03.14</td>
                                        </tr>
                                        <tr>
                                            <td>2021년</td>
                                            <td>1월</td>
                                            <td>209</td>
                                            <td>2.400,000</td>
                                            <td>0</td>
                                            <td>2,400,000</td>
                                            <td>2021.02.14</td>
                                        </tr>
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
    <%--
        $(function() {
            $(".salaryList>tbody>tr").click(function() {
				location.href ="salaryList.pm";
                console.log("급여내역클릭");
            })
        })
	--%>
    </script>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>
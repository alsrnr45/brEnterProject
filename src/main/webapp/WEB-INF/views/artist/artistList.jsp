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
	
	/* 컨텐츠 */
        .outer{margin:auto; height:800px;}
        .outer .firstLine{margin:auto; width:100%; height:400px;}
        .outer .firstLine .workTitle{width:100%; display: inline-block; margin-left:10px;}
        .outer .firstLine .workTitle>*{
            width:300px;
            float:left;
            text-align: left;
            margin-right:20px;
            margin-left:20px;
        }
        .outer .firstLine>div{
            margin:auto;
            border:1px solid lightgray;
            border-radius: 10px;
            float:left;
            width:300px;
            height:300px;
            text-align: center;
            margin-right:20px;
            margin-left:22px;
        }
        /* 근무계획 */
        .outer .firstLine .first{padding-top:40px;}
        .outer .firstLine .first .caleander{
            width:140px;
            height:140px;
            border-radius:10px;
            margin:auto;
            padding:10px;
            background-color: rgb(245, 238, 248);
        }
        .outer .caleander .day{background-color: white;}
        /* 근무체크 */
        .outer .firstLine .second{padding-top:40px;}
        .outer .firstLine .second .btn{
            width:250px;
            height:60px;
            margin-bottom:10px;
            background: rgb(245, 238, 248);
            color:gray;
            border: none;
        }
        /* 근무현황 */
        .outer .firstLine .third{color:royalblue;}
        .outer .firstLine .third .btn{
            width:100%;
            height:60px;
            margin-bottom:13px;
            background: rgb(245, 238, 248);
            color:black;
            border:none;
        }
        /* 근무시간 */
        .outer .secondLine .average{
            border:1px solid lightgray;
            border-radius: 10px;
            margin:auto;
            width:1000px;
            height:100px;
        }
        .outer .secondLine .average > div{margin-left:20px;}
        .outer .secondLine .average>*{
            text-align: center;
            float:left;
            width:300px;
            margin:10px;
            padding:15px;
        }
        .outer .secondLine .average .number{color:royalblue;}
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
            <div class="outer">
                <br><br>
                <h2><b>근태관리</b></h2>
                <br><br>
                <div class="firstLine">
                    <span class="workTitle">
                        <h6><b>근무계획</b></h6>
                        <h6><b>근무체크</b></h6>
                        <h6><b>근무현황</b></h6>
                    </span><br>
                    <div class="first">
                        <div class=workPlan>
                            <div class="caleander">
                                5월
                                <div class="day">
                                    <p><h1>20</h1>목요일</p>
                                </div>
                            </div>
                            <br>
                            <h5>9시출근</h5>
                            <small>09:00 ~ 18:00 (소정 9시간)</small>
                        </div>
                    </div>
                    <div class="second">
                        <h2><b>19 : 00 : 20</b></h2>
                        <br>
                        <button class="btn btn-primary">출근하기</button>
                        <button class="btn btn-primary">퇴근하기</button>
                    </div>
                    <div class="third">
                        <button class="btn btn-primary" disabled>출근체크시간</button>
                        <h2><b>09 : 00</b></h2>
                        <br>
                        <button class="btn btn-primary" style="margin-top:5px;" disabled>퇴근체크시간</button>
                        <h2><b>19 : 00</b></h2>
                    </div>
                </div>
                <div class="secondLine">
                    <h6 style="margin-left:20px;"><b>근무시간</b></h6>
                    <div class="average">
                        <div>
                            <span>근무일수</span> <br>
                            <span class="number">281</span> 일
                        </div>
                        <div>
                            <span>총근무시간</span> <br>
                            <span class="number">2,401</span> 시간
                        </div>
                        <div>
                            <span>평균근무시간</span> <br>
                            <span class="number">9</span> 시간
                        </div>
                    </div>
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

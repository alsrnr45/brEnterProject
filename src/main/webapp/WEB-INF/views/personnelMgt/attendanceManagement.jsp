<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attendanceManagement</title>

<!-- 부트스트랩 탬플릿 -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
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
            background-color: rgb(253, 255, 157);
        }
        .outer .caleander .day{background-color: white;}
        /* 근무체크 */
        .outer .firstLine .second{padding-top:40px;}
        .outer .firstLine .second .btn{width:250px; height:60px; margin-bottom:10px; border: none;}
        .outer .firstLine .second .checkIn{background:rgb(252, 152, 185);}
        .outer .firstLine .second .checkOut{background:rgb(16, 185, 115);}
        /* 근무현황 */
        .outer .firstLine .third_1{margin-top:20px;}
        .outer .firstLine .third_2{margin-top:18px;}
        .outer .firstLine .third .btn{
            width:100%;
            height:60px;
            background: rgb(177, 201, 245);
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
        .outer .secondLine .average>*{text-align: center; float:left; width:300px; margin:10px; padding:15px;}
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
		
		<!-- 현재날짜 -->
		<c:set var="today" value="<%=new java.util.Date()%>" />
		<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyyMMdd HH:mm:ss" /></c:set>
		
		<!-- 오늘 요일 -->
		<c:set var="now" value="<%=new java.util.Date() %>"/>
		<fmt:formatDate value="${now}" pattern="E" var="day" />

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
                                <fmt:formatDate value="${today}" pattern="M" />월
                                <div class="day">
                                    <p><h1><fmt:formatDate value="${today}" pattern="dd" /></h1>${ day }요일</p>
                                </div>
                            </div>
                            <br>
                            <h5>9시출근</h5>
                            <small>09:00 ~ 18:00 (소정 9시간)</small>
                        </div>
                    </div>
                    
                    <div class="second">
	                    <form>
	                        <h2><b id="dpTime">00 : 00 : 00</b></h2>
	                        <br>
	                        <button class="btn btn-primary checkIn">출근하기</button>
	                        <button class="btn btn-primary checkOut">퇴근하기</button>
	                    </form>
                    </div>
                    
                    <div class="third">
                        <button class="btn btn-primary" disabled>출근체크시간</button>
                        <h2 class="third_1"><b>09 : 00</b></h2>
                        <br>
                        <button class="btn btn-primary" style="margin-top:5px;" disabled>퇴근체크시간</button>
                        <h2 class="third_2"><b>19 : 00</b></h2>
                    </div>
                </div>
                
                <div class="secondLine">
                    <h6 style="margin-left:20px;"><b>근무시간(연별)</b></h6>
                    <div class="average">
                        <div>
                            <span>근무일수</span> <br>
                            <span class="number" id="atWorkDay">${ p.atCount }</span> 일
                        </div>
                        <div>
                            <span>총근무시간</span> <br>
                            <span class="number" id="atTotalTime">${ p.atSum }</span> 시간
                        </div>
                        <div>
                            <span>평균근무시간</span> <br>
                            <span class="number" id="atAverage">${ p.atAvg }</span> 시간
                        </div>
                    </div>
                </div>
               
            </div>
        </div>
    </div>
    <input type="hidden" name="memNo" value="${ loginUser.memNo }">
    <!-- 실시간으로 시간을 구해오기 위한 script -->
	<script type="text/javascript">
    	setInterval("dpTime()",1000); 
    	function dpTime(){ 
    		var now = new Date(); 
    		hours = now.getHours(); 
    		minutes = now.getMinutes(); 
    		seconds = now.getSeconds(); 
    		if (hours > 24){
    			hours -= 24; 
    		} else{ 
    		} if (hours < 10){ 
    			hours = "0" + hours; 
    		} if (minutes < 10){ 
    			minutes = "0" + minutes; 
    		} if (seconds < 10){ 
    			seconds = "0" + seconds; 
    		} 
    		document.getElementById("dpTime").innerHTML 
    		= hours + " : " + minutes + " : " + seconds; 
    	}
    </script>
    <script type="text/javascript">
    	/* $(function (){
    		var no = $('input[name=memNo]').val();
			console.log(no);    	
    	}) */
    	function addCheckIn(){
    		
    	}
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

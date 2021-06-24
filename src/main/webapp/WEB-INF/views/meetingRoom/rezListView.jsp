<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- 부트스트랩 탬플릿 -->
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="resources/css/styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	
	<!-- jQuery 라이브러리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- fullcalendar CDNs-->
    <link href='resources/scheduleResources/lib/main.css' rel='stylesheet' />
    <script src='resources/scheduleResources/lib/main.js'></script>
    <script src='resources/scheduleResources/lib/locales/ko.js'></script>

    <!-- rsvp list -->
    <link rel="stylesheet" type="text/css" href='resources/meetingRoomResources/css/main.css' />
	<link rel="stylesheet" type="text/css" href='resources/meetingRoomResources/css/util.css' />

    <style>
    .table100 {
        width: 60%;
        margin-left:10%;
        margin-top:50px;
    }

    .table100.ver3 th{
        font-size:16px;
        font-weight:900;
    }

    .header-right{
        float:right;
    }

    .column100.column1{
        pointer-events : none;
        width:17%;
    }
    </style>
<title>Insert title here</title>
</head>
<body>
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

            <div class="table100 ver3 m-b-110">
                <div class="ver3-header">
                    <a class="btn btn-primary btn-block" type="button"><</a>
                    <a class="btn btn-primary btn-block" type="button">></a>
                    <a class="btn btn-primary btn-block" type="button">오늘</a>
                    <div class="header-right">
                        <a class="btn btn-primary btn-block" type="button">일간</a>
                        <a class="btn btn-primary btn-block" type="button">주간</a>
                    </div>
                </div>
                <br>
                <table data-vertable="ver3">
                    <thead>
                        <tr class="row100 head">
                            <th class="column100 column1" data-column="column1"></th>
                            <th class="column100 column2" data-column="column2">1층 대강당</th>
                            <th class="column100 column3" data-column="column3">2층 회의실</th>
                            <th class="column100 column4" data-column="column4">3층 소회의실</th>
                            <th class="column100 column5" data-column="column5">5층 소회의실A</th>
                            <th class="column100 column6" data-column="column6">5층 소회의실B</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="row100">
                            <td class="column100 column1" data-column="column1">09:00 AM</td>
                            <td class="column100 column2" data-column="column2"><input type="checkbox" /></td>
                            <td class="column100 column3" data-column="column3"><input type="checkbox" /></td>
                            <td class="column100 column4" data-column="column4"><input type="checkbox" /></td>
                            <td class="column100 column5" data-column="column5"><input type="checkbox" /></td>
                            <td class="column100 column6" data-column="column6"><input type="checkbox" /></td>
                        </tr>
                    </tbody>
                    
                </table>
                <br>
                    <a class="btn btn-primary btn-block" id="rsvp-do"type="button" href="reservation.mt">예약하기</a>
                    <a class="btn btn-primary btn-block" id="" type="button" href="list.pb">주소록 보기</a>
            </div>

        </div>
    </div>
	
</body>
</html> 
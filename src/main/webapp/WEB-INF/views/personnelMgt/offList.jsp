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

<!-- fullcalendar -->
<link href='resources/css/fullcalendar_off.css' rel='stylesheet' />
<script src='resources/js/fullcalendar_off.js'></script>
<script src='resources/js/fullcalendar_ko_off.js'></script>

<!-- alertify -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>


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
	
	/* 스타일 */
	/* #layoutSidenav_content div {outline: 1px solid blueviolet;} */

	.content {width: 1150px; height: 600px; margin: auto;}
	.content .content1,.content2 {float: left;}
	.content1 {width: 450px; height: 100%; margin: auto; padding: 50px 0 0 25px; background-color: rgba(240, 239, 239, 0.494); box-shadow: 0 7px 15px rgb(0 0 0 / 40%);}
	.content2 {width: 700px; height: 600px; margin: auto; padding: 0px 0px 0 25px;}
	
	#calendar {width: 400px; height: 500px;}
	#calendar a {text-decoration:none;}
	#calendar table, #calendar table th, #calendar table td {border-color: lightgrey !important; background-color: rgba(245, 245, 245, 0.316);}

	.fc-day-mon a, .fc-day-tue a, .fc-day-wed a, .fc-day-thu a, .fc-day-fri a {color: rgb(26, 26, 26);}
	.fc-day-sat a {color: rgb(94, 104, 252) !important;}
	.fc-day-sun a {color: rgb(255, 103, 103) !important;}
	.fc-daygrid-event {background-color: rgb(155, 89, 182); border-color: rgb(155, 89, 182) !important;}
	.fc .fc-daygrid-day.fc-day-today {background: rgb(238, 222, 245) !important;}
	.fc .fc-today-button {display: none;}
	.fc .fc-list-event-dot{border: 5px solid rgb(155, 89, 182) !important;}

	/* .dataTable-info{display: none;} */
	.card {box-shadow: 0 7px 15px rgb(0 0 0 / 40%);}
	.card-header {height: 45px; padding-top: 10px !important;}
	.fa-trash-alt{color: rgba(255, 103, 103, 0.761);}

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
            
			<div class="content">
				
				<div class="content1">
					<div id="calendar"></div>
				</div>

				<div class="content2">
									
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-user me-1"></i>
								${ loginUser.memName }님의 연차내역
						</div>
						<div class="card-body">
							<table id="datatablesSimple" class="salaryList">
								<thead style="background-color: rgb(238, 238, 238);">
									<tr>
										<th>문서번호</th>
										<th>일자</th>
										<th>신청일</th>
										<th>상태</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="o" items="${ list }">
										<tr>
											<td>${ o.ecDocName }</td>
											<td>${ o.offStart }~${ o.offEnd }</td>
											<td>${ o.ecEnrolldate }</td>
											<td>${ o.ecStatus }</td>
											<td><i class="fas fa-trash-alt"></i></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					
				</div>
        </div>
    </div>

	<script>

	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
		headerToolbar: {
			left: 'prev,next today',
			center: 'title',
			right: 'dayGridMonth,listMonth'
		},

		// 
		initialDate: new Date(),
		navLinks: true, // can click day/week names to navigate views
		selectable: true,
		selectMirror: true,

		// 
		select: function(arg) {
			alertify.confirm('BR-Enter', '해당 일에 연차를 신청하시겠습니까?', function(){location = 'offEnrollForm.ea';}, function(){ location.reload(); });
			
			var startDay = arg.start
			console.log(startDay);

			// var message = confirm('해당 일에 연차를 신청하시겠습니까?');
			// if(message == onok){
			// 	location = 'offForm.ea';
			// 	consolel.log("확인클릭");
			// }

			// if (title) {
			// calendar.addEvent({
			// 	title: title,
			// 	start: arg.start,
			// 	end: arg.end,
			// 	allDay: arg.allDay
			// })
			// }
			// calendar.unselect()
		},
		// eventClick: function(arg) {
		// 	if (confirm('Are you sure you want to delete this event?')) {
		// 	arg.event.remove()
		// 	}
		// },
		editable: true,
		dayMaxEvents: true, // allow "more" link when too many events
		// locale : "ko",
		events: [
			{
			title: '연차',
			start: '2021-06-01'
			},
			{
			title: '연차',
			start: '2021-06-24'
			},
		]
		});

		calendar.render();
	});
	</script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

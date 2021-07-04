<!DOCTYPE html>
<html lang="en">
<head>
  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	
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
    <script>
      // 스케줄 구현 js 모음집
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
          locale:"ko", //언어변경
          headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
          },
          initialDate: new Date(), // 오늘 날짜 뿌려주기
          navLinks: true, // can click day/week names to navigate views
          businessHours: true, // display business hours
          editable: true,
          selectable: true,
          selectMirror: true,
          // 날짜 선택시 실행할 함수(ajax로 해보자)
          select: function insertSch(date) {
        	  window.location = '/brFamily/enroll.sch?selected_date=' + date.startStr
        	
            // 일정만들기 페이지 호출
            /*
            $.ajax({
            	url:"enroll.sch",
            	type:'POST',
            	data:{
            		nowDate:new Date()
            	},
            	success: function(data){
            		
            	},
            	error: function(){
            		console.log("일정만들기 ajax 호출 실패");
            	}
            })
            */
            
            /*
            var title = prompt('Event Title:');
            if (title) {
              calendar.addEvent({
                title: title,
                start: arg.start,
                end: arg.end,
                allDay: arg.allDay
              })
            }
            
            calendar.unselect()
            */
          },
          // 이벤트 클릭시 실행할 함수
          eventClick: function updateSch(arg) {
       
        	var f = document.createElement('form');
        	
        	var data;
        	data = document.createElement('input');
        	data.setAttribute('type', 'hidden');
        	data.setAttribute('name', 'schNo');
        	data.setAttribute('value', arg.event._def.publicId );
        	
        	f.setAttribute('method', 'post');
       	    f.setAttribute('action', 'requestUpdate.sch');
       	    document.body.appendChild(f);
       	    f.submit();

            //var schNo = arg.event._def.publicId;
            //location.href="/brFamily/enroll.sch?schNo=" + arg.event._def.publicId;

            /*
            arg.event._def.publicId 
            arg.event.title schTitle
            arg.event.start startDate
            arg.event.end endDate
            arg.event._def.extendedProps.description schContent
            arg.event.ui.backgroundColor == "#257e4a"
            */
            
           // 개인일정만 수정가능하도록 



            // 수정하기 페이지 호출
            //arg.event.remove() 이벤트 없애는 함수
            
            
          },
          events: [
        	<c:forEach var="s" items="${list}">
            {
              id: '${ s.schNo }',
              title: '${ s.schTitle }',
              start: '${ s.startDate }',
              end: '${ s.endDate }',
              description: '${s.schContent}',
           	  <c:choose>
	              <c:when test="${s.schStatus eq '전체'}">
	              color: '#257e4a'
	              </c:when>
	              <c:when test="${s.schStatus eq '부서'}">
	              color: '#dc3545'
	              </c:when>
	              <c:otherwise>
	              color: '#6f42c1' 
	              </c:otherwise>
			        </c:choose>
            },
            </c:forEach>
            {
              title: 'Meeting',
              start: '2020-09-13T11:00:00',
              constraint: 'availableForMeeting', // defined below
              color: '#257e4a'
            },
            {
              title: 'Conference',
              start: '2021-06-03',
              end: '2021-06-08'
            },
            {
              title: 'Party',
              start: '2021-06-11T10:00:00'
            },
    
            // areas where "Meeting" must be dropped
            {
              groupId: 'availableForMeeting',
              start: '2021-07-01T10:00:00',
              end: '2021-07-6T16:00:00',
              display: 'background'
            },
    
            // red areas where no events can be dropped
            {
              start: '2021-06-22',
              end: '2021-06-24',
              overlap: false,
              display: 'background',
              color: '#ff9f89'
            }
          ],
        });

        calendar.render();
      });


    </script>

    <style>

    body {
      margin: 40px 10px;
      padding: 0;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
    }

    #calendar {
      max-width: 1700px;
      max-height: 720px;

    }

    </style>
</head>
<body>

	<c:choose>
		<c:when test="${ empty loginUser }" >
		<!-- 로그인 전 -->
   		</c:when>
   		<c:otherwise>
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
	       			<!-- 로그인 후 -->
					<div class="full" id='calendar'></div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</body>
	<script>
  // 아쒸 이거 안되네 나중에하자
      $( document ).ready(function() {
        $('fc-listMonth-button fc-button fc-button-primary').click(function(){
          $('fc-list-event-title').append('<li>Test3</li>');
        })
      });
	</script>
</html>
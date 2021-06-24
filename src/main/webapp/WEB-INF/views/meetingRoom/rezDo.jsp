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

    <style>
        #layoutAuthentication_content{
            margin: auto;
        }

        .col-lg-5{
            width:1000px;
        }


        .dataTable-input{
            display: inline-block;
        }

        .input-explain{
            display: inline-block;
            width:100px;
        }

        #deptNo, #rsvpAttendance{
            width: 60%;
        }

        #startDate, #endDate, #startTime, #endTime{
            height:40px; width:130px;
        }

        #schContent{
            resize: none;
            width:68%
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
        <div id="layoutAuthentication_content">
            <main>
                <br><br>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-5">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header"><h3 class="text-center font-weight-light my-4"><i class="fas fa-handshake"></i> 회의실 예약</h3></div>
                                <div class="card-body">
                                    <form>
                                    <!-- 시작시간대보다 마감시간이 앞서서는 안됨-->
                                        <span class="input-explain">시간대</span>&nbsp;<input id="startDate" type="date" style="height:40px; width:140px;"/>
                                        <label for="startDate"></label>
                                        <!-- 시간대 고를 때 default를 현재 시간 값으로 만들고 싶음-->
                                        <select id="startTime" class="dataTable-selector">
                                            <option value="" ></option>
                                            <script>
                                            // 현재시간 default 값으로 만들기
                                            function thisTime(){
                                                var today = new Date;
                                                var hour = today.getHours();
                                                var minute = today.getMinutes();
                                                
                                                if(thisMinute < 30 ){
                                                    hour + ":00"
                                                } else{
                                                    hour + ":30"
                                                }
                                            }    
                                        
                                            // 24시를 30분 단위로 쪼개는 option 만들기
                                            for(var i=0; i<49; i++){
                                                var hour = "";
                                                var min = ":00";
                                                if(Math.ceil(i/2)<13){
                                                    hour = (Math.floor(i/2));
                                                } else{
                                                    hour = (Math.floor(i/2));
                                                    if(hour < 10){
                                                        hour = (Math.floor(i/2));
                                                        hour = "0" + hour;
                                                    }
                                                } if(i % 2 != 0){
                                                        min=":30";
                                                }
                                                document.write('<option value=' + hour + min + '/>'
                                                    + hour
                                                    + min
                                                    + '</option>'
                                                )
                                            }
                                            
                                                                                            
                                            </script>
                                        </select>
                                        <label for=""></label>
                                        - <input id="endDate" type="date" />
                                        <!-- 시간대 고를 때 default를 현재 시간 값으로 만들고 싶음-->
                                        <select id="endTime" class="dataTable-selector">
                                            <option value="" ></option>
                                            <script>
                                            // 현재시간 default 값으로 만들기
                                            function thisTime(){
                                                var today = new Date;
                                                var hour = today.getHours();
                                                var minute = today.getMinutes();
                                                
                                                if(thisMinute < 30 ){
                                                    hour + ":00"
                                                } else{
                                                    hour + ":30"
                                                }
                                            }    
                                            
                                            // 24시를 30분 단위로 쪼개는 option 만들기
                                            for(var i=0; i<49; i++){
                                                var hour = "";
                                                var min = ":00";
                                                if(Math.ceil(i/2)<13){
                                                    hour = (Math.floor(i/2));
                                                } else{
                                                    hour = (Math.floor(i/2));
                                                    if(hour < 10){
                                                        hour = (Math.floor(i/2));
                                                        hour = "0" + hour;
                                                    }
                                                } if(i % 2 != 0){
                                                        min=":30";
                                                }
                                                document.write('<option value=' + hour + min + '/>'
                                                    + hour
                                                    + min
                                                    + '</option>'
                                                )
                                            }                                
                                            </script>
                                        </select>
                                        <br><br>
                                        <span class="input-explain">사용부서</span>
                                        <input class="dataTable-input" id="deptNo" type="text"/><br>
                                        <label for="deptNo"></label><br>
                                        <span class="input-explain">예상 참석숫자</span>
                                        <input class="dataTable-input" id="rsvpAttendance" type="number" min=0 placeholder="ex) 10"/>&nbsp;명 
                                        <label for="rsvpAttendance"></label>
                                        <br><br>
                                        <span class="input-explain">사용목적</span>
                                        <select class="dataTable-selector" id="schCategory" type="text" min=0 placeholder="ex) 회의">
                                            <option value="">회의</option>
                                        </select>
                                        <label for="schCategory"></label>
                                        <br><br>

                                    </form>
                                </div>
                                <div class="card-footer text-center py-3">
                                    <div class=""><a class="btn btn-primary btn-block" id="rsvp-do"type="button" href="">예약하기</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

</body>
</html>
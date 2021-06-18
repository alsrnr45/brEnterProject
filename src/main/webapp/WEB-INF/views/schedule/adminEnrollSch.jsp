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
            width:70px;
        }

        #schTitle, #attendance, #schCategory, #schContent{
            width: 60%;
        }

        #startDate, #endDate, #startTime, #endTime, #schStatus{
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
		<jsp:include page="../common/adminHeader.jsp"/>
    </nav>
    
    <div id="layoutSidenav">
        
        <!-- 메뉴바 -->
        <div id="layoutSidenav_nav">
            <jsp:include page="../common/adminMenu.jsp"/>
        </div>

        <!--컨텐츠-->
        <div id="layoutAuthentication_content">
            <main>
                <br><br>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-5">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header"><h3 class="text-center font-weight-light my-4"><i class="fas fa-calendar-alt"></i> 일정만들기</h3></div>
                                <div class="card-body">
                                    <form>
                                        <span class="input-explain">제목</span>
                                        <input class="dataTable-input" id="schTitle" type="text"/><br>
                                        <label for="schTitle"></label><br>
                                    <!-- 시작시간대보다 마감시간이 앞서서는 안됨-->
                                        <span class="input-explain">시간대</span>&nbsp;<input id="startDate" type="date" style="height:40px; width:140px;"/>
                                        <label for="startDate"></label>
                                        <!-- 시간대 고를 때 default를 현재 시간 값으로 만들고 싶음-->
                                        <select id="startTime">
                                            <option value="" selected>기본값</option>
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
                                        <select id="endTime">
                                            <option value="" selected >기본값</option>
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
                                        <span class="input-explain">참석자</span><input class="dataTable-input" id="attendance" type="number" min=0 placeholder="ex) 10"/>&nbsp;명 
                                        <label for="attendance"></label>
                                        <br><br>
                                        <span class="input-explain">일정유형</span><input class="dataTable-input" id="schCategory" type="text" min=0 placeholder="ex) 회의"/>&nbsp;
                                        <label for="schCategory"></label>
                                        <br><br>
                                        <span class="input-explain">일정구분</span>
                                        <select class="dataTable-input" id="schStatus">
                                            <option value="" selected>전체</option>
                                            <option value="">부서</option>
                                        </select>
                                        <br><br>
                                        내용<br>
                                        <textarea class="dataTable-input" id="schContent" rows="5px"></textarea>
                                        <br><br>
                                        <!-- 이미지/파일 버튼 다시 만들기-->
                                        <span class="input-explain">파일첨부</span>
                                        <a class="btn btn-primary btn-block"><input type="file" style="display: none;" />이미지/파일</a>
                                    </form>
                                </div>
                                <div class="card-footer text-center py-3">
                                    <div class="small"><a href="register.html">Need an account? Sign up!</a></div>
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
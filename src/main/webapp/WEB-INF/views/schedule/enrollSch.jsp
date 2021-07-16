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
    
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

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

        #startYMD, #endYMD, #startTime, #endTime{
            height:40px; width:140px;
        }

        #schContent{
            resize: none;
            width:68%
        }
        
                .note-modal-footer{
            height:50px;
            padding-right:30px;
            border-top:1px solid #e5e5e5;
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
                                <div class="card-header"><h3 class="text-center font-weight-light my-4"><i class="fas fa-calendar-alt"></i> 일정만들기</h3></div>
                                <div class="card-body">
                                    <form id="postSch" action="" method="post">
                                    	<input hidden id="memNo" name="memNo" value="${ loginUser.memNo }" />
                                    	<input hidden id="schStatus" name="schStatus" value="개인" />
                                        <span class="input-explain">제목</span>
                                        <input class="dataTable-input" id="title" type="text" name="schTitle" value="${s.schTitle}" required/><br>
                                        <label for="schTitle"></label><br>
                                    <!-- 시작시간대보다 마감시간이 앞서서는 안됨-->
                                        <c:choose>
                                            <c:when test="${ !empty selected_date}">
                                                <span class="input-explain">시간대</span>&nbsp;<input id="startYMD" name="startYMD" type="date" style="height:40px; width:140px;" value="${selected_date}" required/>
                                            </c:when>
                                            <c:when test="${!empty s.startDate}">
                                            	<span class="input-explain">시간대</span>&nbsp;<input id="startYMD" name="startYMD" type="date" style="height:40px; width:140px;" value="${s.startDate}" required/>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="input-explain">시간대</span>&nbsp;<input id="startYMD" name="startYMD" type="date" style="height:40px; width:140px;" value="" required/>
                                            </c:otherwise>
                                        </c:choose>
                                        <label for="startYMD"></label>
                                        <!-- 시간대 고를 때 default를 현재 시간 값으로 만들고 싶음-->
                                        <select id="startTime" class="dataTable-selector" required>
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
                                                document.write('<option value=' + hour + min + '>'
                                                    + hour
                                                    + min
                                                    + '</option>'
                                                )
                                            }
                                            /* 
                                            날짜설정은 완료 시간설정은 다시!
                                            if(${selected_date}.getMinutes() < 30){
                                                document.write('<option value=' + hour + min + '/>'
                                                    + hour
                                                    + min
                                                    + '</option>'
                                                )
                                            } else{
                                                document.write('<option value=' + hour + min + '/>'
                                                    + hour
                                                    + min
                                                    + '</option>'
                                                )
                                            }
                                            */ 

                                            </script>
                                        </select>
                                        <label for=""></label>
                                        - <input id="endYMD" name="endYMD" type="date" required/>
                                        <!-- 선택한 startDate보다 endDate가 앞서지 않게 체크제약조건 -->
                                        <select id="endTime" class="dataTable-selector" >
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
                                                document.write('<option value=' + hour + min + '>'
                                                    + hour
                                                    + min
                                                    + '</option>'
                                                )
                                            }                                
                                            </script>
                                        </select>
                                        <input hidden id="startDate" name="startDate" value="${s.startDate}" />
                                        <input hidden id="endDate" name="endDate" value="${s.endDate}" />
                                        <br><br>
                                        <span class="input-explain">참석자</span><input class="dataTable-input" id="attendance" name="attendance" value="${s.attendance}" type="number" min=0 placeholder="ex) 10"/>&nbsp;명 
                                        <label for="attendance"></label>
                                        <br><br>
                                        <span class="input-explain">일정유형</span><input class="dataTable-input" id="schCategory" name="schCategory" value="${s.schCategory}" type="text" min=0 placeholder="ex) 회의"/>&nbsp;
                                        <label for="schCategory"></label>
                                        <br><br>내용<br>
<!--                                         <textarea class="dataTable-input" id="schContent" name="schContent" value="${s.schContent}" rows="5px"></textarea> -->
                                        <textarea id="summernote" id="schContent" name="schContent" value="${s.schContent}"></textarea>
                                        <br><br>
                                        <!-- 이미지/파일 버튼 다시 만들기-->
                                        <span class="input-explain">파일첨부</span>
                                        <a class="btn btn-primary btn-block"><input type="file" name="upfile" style="display: none;" />이미지/파일</a>
                                    
                                </div>
                                <div class="card-footer text-center py-3">
                                    <div class="small">
                                    	<a class="btn btn-primary btn-block" id="planSch" onclick="planSchSubmit();">일정만들기</a>
                                 	    <c:if test="${ !empty s.schNo }">
                                    		<a class="btn btn-primary btn-block" id="updateSch" onclick="">수정하기</a>
                                    	</c:if>
                                    </div>
</form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
<script>

$(document).ready(function() {
    $('#summernote').summernote({
    	lang: 'ko-KR',
    	placeholder: '내용을 입력해주세요.',
        tabsize: 2,
        height: 340,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
});
	function planSchSubmit(){
		<c:choose>
			<c:when test="${selected_date} eq  $('#startDate').val()">
			var selected_startDate = ${selected_date} + ' ' + $('#startTime option:selected').val();
			$('#startDate').attr('value', selected_startDate);
			</c:when>
			<c:otherwise>
			var selected_startDate = $('#startYMD').val() + ' ' + $('#startTime option:selected').val();
			$('#startDate').attr('value', selected_startDate);
			</c:otherwise>
		</c:choose>
		
		var selected_endDate = $('#endYMD').val() + ' ' + $('#endTime option:selected').val();
		$('#endDate').attr('value', selected_endDate);
		
		$("#postSch").attr("action","insert.sch").submit();
		//$("#planSch").attr("action","insert.schF").submit();
		
	};
	
</script>
</html>
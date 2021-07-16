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
    
<title>Insert title here</title>

<style>
    .card-footer{
        text-align: end;
    }
    
    .dataTable-table > tbody > tr > td, .dataTable-table > tbody > tr > th, 
    .dataTable-table > tfoot > tr > td, .dataTable-table > tfoot > tr > th, 
    .dataTable-table > thead > tr > td, .dataTable-table > thead > tr > th{
        text-align:center;
    }
</style>
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
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">받은 메일 보기</h1>
                    <br>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="far fa-envelope"></i>
                            받은 메일
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple" class="mailList">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th>보낸사람</th>
                                        <th>제목</th>
                                        <th>일시</th>
                                        <th>첨부파일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="r" items="${list}">
                                    <tr>
                                        <td><input type="checkbox" name="${r.mailNo}" value="${r.mailNo}" id="mailCheck_${r.mailNo}" ></td>
                                        <c:choose>
	                                        <c:when test="${ r.bookmark eq 'N' }">
	                                        <td><input type="button" hidden><i class="far fa-star"></i></td>
	                                        </c:when>
	                                        <c:otherwise>
	                                        <!--  
	                                        <th><button onclick="important()"><i class="fas fa-star"></i></button></th>
	                                        -->
	                                        </c:otherwise>
	                                    </c:choose>
	                                    <c:choose>	                                   
	                                        <c:when test="${ r.receiveStatus eq 'N'}">
	                                        <th><i class="far fa-envelope"></i></th>
	                                        </c:when>
	                                        <c:otherwise>
	                                        <th><i class="far fa-envelope-open"></i></th>
	                                        </c:otherwise>
                                        </c:choose>
                                        <td>${ r.mailWriter }</td>
                                        <td>${ r.mailTitle }</td>
                                        <td>${ r.mailSendDate }</td>
                                        <c:choose>
                                        	<c:when test="${ r.mfIsHave != 0 }">
                                        	<td>Y</td>
                                        	</c:when>
                                        	<c:otherwise>
                                        	<td>N</td>
                                        	</c:otherwise>
                                        </c:choose>
                                    </tr>
                                	</c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th><input type="checkbox"></th>
                                        <th><button onclick="important()"><i class="far fa-star"></i></button></th>
                                        <th></th>
                                        <th>Age</th>
                                        <th>Sta rt date</th>
                                        <th>Salary</th>
                                    </tr>
                                </tfoot>
                            </table>
                            <div class="card-footer">
                                <a id="do_reply" class="btn btn-primary btn-block" href="">답장</a>
                                <a class="btn btn-primary btn-block">전달</a>
                                <a class="btn btn-primary btn-block"><i class="far fa-star"></i></a>
                                <a class="btn btn-primary btn-block"  href="enroll.mail">메일쓰기</a>
                                <a id="deleteBtn" class="btn btn-primary btn-block" >삭제하기</a>
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
	// 답장
		$("#do_reply").click(function(){
			
			
			var length = $('input:checked').length; // 체크된 숫자갯수

			console.log("숫자갯수" + length);
	
			if(length>1){
				alert("메일 한 개만 선택해주세요.");
			} else{
				
			}
			
			$('input:checked').each(function(){
				var mail_no = $(this).val(); // 내가 원하는 값을 value로 담아놓고 체크할 때 value값 담기(생각의전환 필요!) 
				
				mail_arr.push(mail_no);
				// 배열에 담기
			});
	
	// 삭제 
	
		$("#deleteBtn").click(function(){
			var length = $('input:checked').length; // 체크된 숫자갯수
	
			console.log("숫자갯수" + length);
	
			var mail_arr = []; // 배열선언
			
			$('input:checked').each(function(){
				var mail_no = $(this).val(); // 내가 원하는 값을 value로 담아놓고 체크할 때 value값 담기(생각의전환 필요!) 
				
				mail_arr.push(mail_no);
				// 배열에 담기
			});
	
			console.log("배열" + mail_arr);
			// 체크된 게시물 번호 배열에 담았음
			$.ajax({
				type: "POST",
				url: "delete.mail",
				data: {
					mail_arr: mail_arr
				},
				traditional:true,
				success: function(data){
					alert("성공");
					window.location.reload();
				},
				error: function(data){
					alert(data);
					window.location.reload();
				}
			});
		});
	})
</script>
</html>
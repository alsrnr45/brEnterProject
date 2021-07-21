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
                    <h1 class="mt-4">임시보관함</h1>
                    <br>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="far fa-envelope"></i>
                            임시보관함
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple" class="mailList">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>받는사람</th>
                                        <th>제목</th>
                                        <th>일시</th>
                                        <th>첨부파일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    	<c:forEach var="s" items="${ slist }" >
                                    	<tr>
                                        <td>
                                        <input type="hidden" name="mailTitle" value="${ s.mailTitle }">
	                                   	<input type="hidden" name="mailNo" value="${s.mailNo}">
	                                   	<input type="hidden" name="mailWriter" value="${ loginUser.officeEmail }" >
	                                   	<input type="hidden" name="mfIsHave" value="${ s.mfIsHave }" >
	                                   	<input type="hidden" name="mailReceiver" value="${s.mailReceiver}">
                                    	<input type="checkbox" name="${s.mailNo}" value="${s.mailNo}" id="mailCheck_${s.mailNo}" >
                                        </td>
                                       	<c:choose>
	                                       	<c:when test="${ empty s.mailReceiver }">
	                                       		<td>( 받는 사람 없음 )</td>
	                                       	</c:when>
	                                       	<c:otherwise>
	                                       		<td>${s.mailReceiver}</td>
	                                       	</c:otherwise>
                                       	</c:choose>
                                       	<c:choose>
	                                       	<c:when test="${ empty s.mailTitle }">
	                                       		<td>( 제목 없음 )</td>
	                                       	</c:when>
	                                       	<c:otherwise>
	                                       		<td>${s.mailTitle}</td>
	                                       	</c:otherwise>
                                       	</c:choose>
                                        <td>${s.mailSendDate}</td>
                                        <c:choose>	
                                        	<c:when test="${ s.mfIsHave > 0 }">	
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
                                <a id="reWrite" class="btn btn-primary btn-block">다시쓰기</a>
                                <a id="deleteBtn" class="btn btn-primary btn-block">삭제하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </main> 
        </div>
    </div>
</body>
<script>
    function showAndHide(){
        if($('#dis').css('display') == 'none'){
        $('#dis').show();
    }else{
        $('#dis').hide();
    }
    }
    
	$(document).ready(function() {
		
		$(function(){
			$(document).on('click', '.title', function(){
				$('input').attr('disabled', true);
				$(this).prevAll().find('input').attr('disabled', false);
				$('#slist').submit();
			})
		})

		// 즐겨찾기 만들기
		$('.important').click(function(){
			let mailNo = $(this).parent().prevAll().find('input[name=mailNo]').val();
			let mailReceiver = $(this).parent().prevAll().find('input[name=mailReceiver]').val();
			let bookmark = $(this).parent().prevAll().find('input[name=bookmark]').val();
			
			$.ajax({
				type: "POST",
				url: "important.mail",
				data: {
					mailNo : mailNo,
					mailReceiver : mailReceiver,
					bookmark : bookmark
				},
				success: function(data){
					window.location.reload();
				},
				error: function(data){
					window.location.reload();
				}
			});
		})
		
			// 다시 쓰기
			$("#reWrite").click(function(){
				var length = $('input:checked').length; // 체크된 숫자갯수
				console.log("숫자갯수" + length);
				if(length == 0){
					alert('답장할 메일을 선택해주세요.');
				} if(length > 1){
					alert("메일 한 개만 선택해주세요.");
				} if(length == 1){
					$('#rlist').attr('action','reply.mail');
					$('input').attr("disabled", true);
					$('input:checked').parent().parent().find('input').attr("disabled", false);
					$('#rlist').submit();
				}
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
					url: "delete.tempMail",
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
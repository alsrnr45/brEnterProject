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
    
    .important{
    	color:black;
    	text-decoration: none;
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
                        <form id="rlist" action="detail.mail" method="post" enctype="multipart/form-data">
                            <table id="datatablesSimple" class="mailList">
                            
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th>보낸사람</th>
                                        <th>제목</th>
                                        <th id="dateDESC">일시</th>
                                        <th>첨부파일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="r" items="${list}">
                                    	<tr>
	                                        <td>
	                                        <input type="hidden" name="mailTitle" value="${ r.mailTitle }">
	                                    	<input type="hidden" name="mailNo" value="${r.mailNo}">
	                                    	<input type="hidden" name="mailReceiver" value="${ loginUser.officeEmail }" >
	                                    	<input type="hidden" name="mfIsHave" value="${ r.mfIsHave }" >
	                                    	<input type="hidden" name="bookmark" value="${r.bookmark}">
	                                        <input type="checkbox" name="${r.mailNo}" value="${r.mailNo}" id="mailCheck_${r.mailNo}" >
	                                        </td>
	                                        <c:choose>
		                                        <c:when test="${ r.bookmark eq 'N' }">
		                                        	<td class="no_important"><a class="important"><i class="far fa-star"></i></a></td>
		                                        </c:when>
		                                        <c:otherwise>
		                                        	<td><a class="important"><i class="fas fa-star"></i></a></td>
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
	                                        <td class="title">           
	                                        ${ r.mailTitle }
	                                        </td>
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
                            </table>
                            
                            <div class="card-footer">
                                <a id="reply" class="btn btn-primary btn-block" >답장</a>
                                <a id="forward" class="btn btn-primary btn-block">전달</a>
                                <a id="do_important" class="btn btn-primary btn-block"><i class="far fa-star"></i></a>
                                <a class="btn btn-primary btn-block" href="enroll.mail">메일쓰기</a>
                                <a id="deleteBtn" class="btn btn-primary btn-block" >삭제하기</a>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </main> 
        </div>
    </div>
</body>
<script>
	$(document).ready(function() {
		
	// 리스트 보여주기
	/*
    $(function(){
	   	$(".title").click(function(){
	   		$('input').attr("disabled", true);
	   		$(this).prevAll().find('input').attr("disabled", false);
	   		$('#rlist').submit();
	   	})
   	})
	*/
	
	$(function(){
		$(document).on('click', '.title', function(){
			$('input').attr('disabled', true);
			$(this).prevAll().find('input').attr('disabled', false);
			$('#rlist').submit();
		})
	})
	
	// 리스트 날짜순으로 기본값
	$(function(){
		$('#dateDESC').attr('class','desc');
	})
	
	// 즐겨찾기 만들기
	
	$(function(){
		$(document).on('click', '.important', function(){
			
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
		})
	})
	})
	
	/*
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
	*/
	
		// 답장
		$("#reply").click(function(){
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
	
		//전달
		
		
		// 즐겨찾기만 조회하기
		$('#do_important').on('click', function(){
			$('.no_important').closest('tr').css('display', 'none');
			$('#do_important').attr('id','#undo_imporatant');
		});
		
		$('#undo_important').on('click', function(){
			$('.no_important').closest('tr').css('display', 'contents');
			$('#undo_important').attr('id','#do_imporatant');
			console.log('이거되나?');
		})
		
		// 삭제 
		$("#deleteBtn").on('click', function(){
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
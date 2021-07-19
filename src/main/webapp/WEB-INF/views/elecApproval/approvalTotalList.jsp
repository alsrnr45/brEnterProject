<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- JSTL format 태그로 날짜 형식 변경하기 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>brEntertainment</title>

<!-- 부트스트랩 탬플릿 -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<!-- 부트스트랩4 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
 
	/* 폰트 */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
	* {font-family: 'Noto Sans KR', sans-serif;}
	
	/* input */
	input:focus, input[type]:focus, .uneditable-input:focus, button:focus, button:active{
		border-color: rgb(155, 89, 182) !important; 
		box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6) !important;
		outline: 0 none !important;
	}
	
	/* 드롭박스 */
	select:focus, select:active{
	    border-color: rgb(155, 89, 182) !important;
	    box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6) !important;
	    outline: 0 none !important;
	}
	option:checked {background: rgb(155, 89, 182); color: white;}
	select{background: url(https://t1.daumcdn.net/cfile/tistory/99761B495C84AA8716) no-repeat 95% 50% !important;}
	p{font-size: 15px; text-align: center; margin-top: 7px; margin-left: 15px;}
	
	/* 페이징바 */
	.pagination a {color: black;}
	.pagination a:hover, 
	.pagination a:focus {background: rgb(245, 238, 248); border-color: #dee2e6; color: black;}
	.pagination a:active {box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);}
	.page-item.active .page-link, .page-item.active .pagination a, .pagination .page-item.active a, .pagination li.active .page-link, .pagination li.active a {
	    z-index: 3; color: #fff; background-color: rgb(155, 89, 182); border-color: #dee2e6;}
	.pagination .active a, .pagination .active a:focus, .pagination .active a:hover {background-color: rgb(155, 89, 182); box-shadow: none;} 
	#pagingArea{margin: auto;}

	/* 카테고리, 검색창 */
	.headArea{width: 1200px; height: 100px; text-align: center; margin: auto; padding: 50px 85px 0px 85px;}
	.headArea>div {float: left;}
	.input-group {width: 250px; margin-left: 630px;}
	#form-group {width: 150px;}
	.btn-light {background-color: rgb(215, 215, 215); border-radius: 0rem 0.25rem 0.25rem 0rem;}
	
	/* 전자결재 기안 문서함 리스트 */
    h1{margin-bottom: 20px;}  
    .approvalTotalList{text-align: center;}
	.approvalTotalList>tbody>tr:hover{cursor: pointer;}
	
	.modal-body {margin: 30px 0 30px 60px;}
	.modal-body .modalContent1, .modal-body .modalContent2 {float: left;}
	h6 {margin: 6px 20px 0 0; font-size: large;}
	.modalContent2 {width: 250px;}

	/* .modal-dialog{display: inline-block; vertical-align: middle;} */
	.modal-footer {margin: auto;}
	.modal-footer button {width: 120px;}
	.btn-primary {background-color: rgb(155, 89, 182); border-color: rgb(155, 89, 182);}
	.btn-danger {background-color: rgb(241, 82, 82); border-color: rgb(255, 134, 134);}

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

        	<!-- 컨텐츠 -->
        	<div id="layoutSidenav_content">
        		<main>
	                <div class="container-fluid px-4">
	                    
	                    <div class="container-fluid px-4">
	                        <h1 class="mt-4">전자결재</h1>
	
	                        <div class="card mb-4">
	                            <div class="card-header">
	                                <i class="far fa-clipboard"></i>&nbsp;기안 문서함 &nbsp;
	                                <a class="btn btn-primary" type="button" class="btn btn-primary" data-toggle="modal" data-target="#documentSelect" style="float: right;">작성하기</a>
	                            </div>
	                            <div class="card-body">
	                               
	                                <table id="datatablesSimple" class="approvalTotalList">
	                                    <thead>
	                                        <tr>
	                                            <th style="text-align:center;">문서번호</th>
	                                            <th style="text-align:center;">문서종류</th>
	                                            <th style="text-align:center;">제목</th>
	                                            <th style="text-align:center;">기안자</th>
	                                            <th style="text-align:center;">기안일</th>
	                                            <th style="text-align:center;">완료일</th>
	                                            <th style="text-align:center;">결재상태</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                       <!-- 로그인한 유저가 올린 문서만 보이도록 조건 처리 -->                                       
	                                       <c:forEach var="ea" items="${ list }">
	                                       	   <c:if test="${ loginUser.memName eq ea.ecWriter }">							
		                                       	   <tr>                             	   
		                                       	   	   <td>${ ea.ecDocName }<input type="hidden" class="eano" value="${ ea.ecDocNo }"></td>                                      	   	   
		                                       	       	                                       	      	                                     	       
		                                       	       <!-- 문서 코드에 따른 조건 처리 -->
		                                       	       <td>
		                                       	       		<input id="ecCode" type="hidden" value="${ ea.ecCode }">
		                                       	       		<c:choose>
		                                       	       			<c:when test="${ ea.ecCode eq 'PL' }">
		                                       	       				기획안
		                                       	       			</c:when>
		                                       	       			<c:when test="${ ea.ecCode eq 'BC' }">
		                                       	       				업무연락
		                                       	       			</c:when>
		                                       	       			<c:when test="${ ea.ecCode eq 'OF' }">
		                                       	       				연차
		                                       	       			</c:when>
		                                       	       			<c:when test="${ ea.ecCode eq 'EX' }">
		                                       	       				지출결의서
		                                       	       			</c:when>
		                                       	       			<c:otherwise>
		                                       	       				회람 
		                                       	       			</c:otherwise>
		                                       	       		</c:choose>
		                                       	       </td>
		                                       	        
		                                       	       <td>${ ea.ecTitle }</td>
		                                       	       <td>${ ea.ecWriter }</td>
		                                       	       
		                                       	       <!-- JSTL 날짜형식 포맷팅 -->
		                                       	       <td>
		                                       	           <fmt:parseDate value="${ ea.ecEnrolldate }" var="dateFmt" pattern="yyyyMMdd"/>
		                                       	           <fmt:formatDate value="${ dateFmt }" pattern="yyyy-MM-dd"/>
		                                       	       </td>
		                                       	       
		                                       	       <td>${ ea.ecCompdate }</td>
		                                       	       
		                                       	       <!-- 결재대기인 경우에만 글자색 빨간색으로 변경할 것 -->
		                                       	       <td>
		                                       	       	   <c:choose>	             
			                                       	       	   <c:when test="${ empty ea.ecCanceldate && empty ea.ecCompdate }">
								                           	   		<font color="red">결재대기</font>
								                           	   </c:when>
								                           	   <c:when test="${ !empty ea.ecCanceldate && !empty ea.ecCompdate }">
								                           	   		반려  		
								                           	   </c:when>
								                           	   <c:when test="${ empty ea.ecCanceldate && !empty ea.ecCompdate }">
								                           	   		결재완료
								                           	   </c:when>
							                           	   </c:choose>
		                                       	       </td>
		                                       	   </tr>
	                                       	   </c:if>	
	                                       </c:forEach>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                </div>
            	</main> 
        	</div>

			<!-- The Modal -->
			<div class="modal" id="documentSelect">
				<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
			
					<!-- Modal Header -->
					<div class="modal-header">
					<h4 class="modal-title">문서 종류</h4>
					</div>
			
					<!-- Modal body -->
					<div class="modal-body">
						<div class="modalContent1">
							<h6>문서 선택</h6> 
						</div>

						<div class="modalContent2">
							<select class="form-control" id="formSelect">
								<option>선택</option>
								<option value="documentEnrollForm.ea?code=PL&mno=${ loginUser.memNo }">기획안</option>
								<option value="documentEnrollForm.ea?code=BC&mno=${ loginUser.memNo }">업무연락</option>
								<option value="offEnrollForm.ea?mno=${ loginUser.memNo }">연차</option>									
								<option value="expenseForm.ea?mno=${ loginUser.memNo }">지출결의서</option>									
								<option value="documentEnrollForm.ea?code=ME&mno=${ loginUser.memNo }">회람</option>
							</select>
						</div>
					</div>
					
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소하기</button>
						<button type="button" class="btn btn-primary selectButton" onchange="goUrl()">선택하기</button>
					</div>
				</div>
				</div>
			</div>
        	
    </div>
    
    <script>
    
    	$(function() {
            // 리스트가 비어있을 경우 선택되지 않도록 조건 처리  
    		$(document).on("click", ".approvalTotalList>tbody>tr", function(){
            //$(".approvalTotalList>tbody>tr").click(function() {
            	
            	// 폼마다 디테일 뷰 다름 
            	var ecCode = $(this).find("#ecCode").val();
				//console.log(ecCode);
            	
            	// 조건1. 연차
            	if(ecCode == "OF") {
            		location.href ="detailOff.ea?eano=" + $(this).find(".eano").val();
	             	
            	// 조건2. 지출결의서 
            	}else if (ecCode == "EX") {	
	             	location.href ="expenseDetail.ea?eano=" + $(this).find(".eano").val();
	            
	            // 조건3. 기획안/업무연락/회람 
            	}else { 
	             	location.href ="documentDetail.ea?eano=" + $(this).find(".eano").val();
            	}   	
            })
        });


		$(function() {
            $(".modal-footer>.selectButton").click(function() {

				var selectOption = document.getElementById("formSelect");
				selectOption = selectOption.options[selectOption.selectedIndex].value;
				
				window.location.href  = selectOption;

            })
        });
		
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="resources/js/datatables-simple-demo.js"></script>
	   		
</body>
</html>
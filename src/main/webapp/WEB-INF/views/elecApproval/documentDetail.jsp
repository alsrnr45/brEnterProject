<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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

	/* 드롭박스 */
	select:focus, select:active{
	    border-color: rgb(155, 89, 182) !important;
	    box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6) !important;
	    outline: 0 none !important;
	}
	option:checked {background: rgb(155, 89, 182); color: white;}
	select{background: url(https://t1.daumcdn.net/cfile/tistory/99761B495C84AA8716) no-repeat 95% 50% !important;}
	.form-control{width: 200px; height: 30px; margin: auto;}

	/* 버튼 */
	.btn-primary {margin: 0 0 10px 950px; background-color:rgb(155, 89, 182); border-color: rgb(155, 89, 182);}
	.btn-light {margin-right: 10px; background-color: rgb(215, 215, 215); border-color: rgb(215, 215, 215);}
	.btn-danger {background-color: rgb(255, 134, 134); border-color: rgb(255, 134, 134); color: black;}

	/* 스타일 */
	/* #layoutSidenav_content div {outline: 1px solid blueviolet;} */

	.content {width: 1150px; height: 860px; margin: auto; margin-top: 30px;}

	.content_2 {width:920px; margin:auto;}
	.content_2>div {float: left; text-align:center;}
	.content_2 img {height: 60px;}

	.content_4 {padding: 15px 0 0 500px;}
	.content_4>a{margin-left: 40px;}

	table {text-align: center; font-size: 13px; margin: auto;}
	table>tr,th,td{border: 1px lightgray solid;} 

	/* .tableType01 {margin-bottom: 10px;} */
	.tableType01 th {height: 40px; background-color: rgba(241, 241, 241, 0.75);}
	.tableType01 img {height: 50px;}
	
	.tableType02 th {height: 160px; background-color: rgba(241, 241, 241, 0.75);}
	.tableType02 img {height: 60px;}

	.tableType03 td {text-align: left;}
	.tableType03 th {background-color: rgba(241, 241, 241, 0.75);}

	.tableType03 input, textarea{width: 100%; border: none; padding-left: 10px;}
	.tableType03 input:focus, .tableType03 textarea:focus{box-shadow: none !important;}
	
	a:hover{color: rgb(155, 89, 182);}
	a{text-decoration: none;}


	#drafter {
		width:120px; 
		height:100%; 
		font-size: 13px;
		background-color:rgba(241, 241, 241, 0.75);
		outline: 0.1px solid lightgray;
		padding-top: 100px;
	}

	#approver {
		width:120px;
		height:100%;
		font-size: 13px;
		background-color:rgba(241, 241, 241, 0.75);
		outline: 0.1px solid lightgray;
		padding-top: 100px;
	}
	
	#approvalInfo {
		width:136px; 
		height:100%;
		font-size: 13px;
		outline: 0.1px solid lightgray;
	}
	#approvalInfo div {outline: 1px solid lightgray;}
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

				<a class="btn btn-primary" href="approvalTotalList.ea">목록으로</a>

				<div class="content_1">
						
					<table class="tableType01">
						<tr>
							<th width="120">문서종류</th>
							
							<!-- 문서 코드에 따른 조건 처리 --> 
							<td width="340">
								<input id="ecCode" type="hidden" value="${ ea.ecCode }">
								<c:choose>
									<c:when test="${ ea.ecCode eq 'PL' }">
										기획안
									</c:when>
									<c:when test="${ ea.ecCode eq 'BC' }">
										업무연락
									</c:when>
									<c:otherwise>
										회람
									</c:otherwise>
								</c:choose>
							</td>
							
							<th width="120">문서번호</th>
							<td width="340">${ ea.ecDocName }</td>
						</tr>
						<tr style="border-bottom: 0;">
							<th>기안 일시</th>
							<td>${ ea.ecEnrolldate }</td>
							<th>완료 일시</th>
							<td>${ ea.ecCompdate }</td>
						</tr>
					</table>
					<br>
				</div>				
				
				<div class="content_2" style="height:220px;">
					<div id="drafter">기안자</div>
					<div id="approvalInfo">
						<div style="height:35px;">개발팀</div>
						<div style="height:35px;">사원</div>
						<div style="height:80px;"><img src="resources/elecApprovalUpfiles/check1.png"></div>
						<div style="height:35px;">2021-07-10</div>
						<div style="height:35px;">김사원</div>
					</div>
					
					<div id="approver">결재자</div>
			        <!-- 무조건 4번 반복문 돌게 (i=0~3)-->
			        <c:forEach var="i" begin="0" end="3">
			            <c:choose>
			                <c:when test="${ i lt ApprovalPathList.size() }">
			                    <!--i라는 값이 현재 리스트의 사이즈보다 작을 경우 (예를들어 현재 리스트의 사이즈가 2라는 가정하면 i가 0,1일경우)-->
			                    <div id="approvalInfo">
			                        <div style="height:35px;">${ ApprovalPathList[i].deptName }</div>
			                        <div style="height:35px;">${ ApprovalPathList[i].posiName }</div>
			                        <c:choose>
			                            <c:when test="${ ApprovalPathList[i].apEnrolldate != null }">
			                            <div style="height:80px;"><img src="resources/elecApprovalUpfiles/check2.png"></div>
			                            
			                            	<c:if test="${ (i+1) lt ApprovalPathList.size() }">
				                            	<c:set var="ttt" value="${ ApprovalPathList[i+1].memNo }"/>
			                            	</c:if>
			                            	
			                            </c:when>
			                            <c:otherwise>
			                            <div style="height:80px;"></div>
			                            </c:otherwise>
			                        </c:choose>
			                        <div style="height:35px;">${ ApprovalPathList[i].apEnrolldate }</div>
			                        <div style="height:35px;">${ ApprovalPathList[i].memName }</div>
			                    </div>
			                </c:when>
			                <c:otherwise>
			                    <!--그게 아닐경우-->
			                    <div id="approvalInfo">
			                        <div style="height:35px;"></div>
			                        <div style="height:35px;"></div>
			                        <div style="height:80px;"></div>
			                        <div style="height:35px;"></div>
			                        <div style="height:35px;"></div>
			                    </div>
			                </c:otherwise>
			            </c:choose>
			        </c:forEach>
				</div>
				
				<br>
				<div class="content_3">
					<table class="tableType03">
						<tr height="40">
							<th>제목</th>
							<td colspan="3"><input type="text" name="ecTitle" id="ecTitle" value="${ ea.ecTitle }" readonly></td>
						</tr>
						<tr height="40">
							<th width="120">첨부파일</th>
							<td colspan="3" width="800">
								<c:choose>
                                     <c:when test="${ empty ea.ecFileOrigin }">
                                     	&nbsp;&nbsp; 첨부파일이 없습니다.
                                     </c:when>
                                     <c:otherwise>
                                        &nbsp; <a href="${ ea.ecFileUpdate }" download="${ ea.ecFileOrigin }">${ ea.ecFileOrigin }</a>
                                     </c:otherwise>
                                </c:choose>                                     
							</td>
						</tr>
						<tr height="30">
							<th colspan="4">상세내용</th>
						</tr>
						<tr>
							<td colspan="4">
								<input type="text" name="ecCnt" id="ecCnt" value="${ ea.ecCnt }" style="height: 250px;" readonly>
							</td>
						</tr>
					</table>
				</div>

				
				<div class="content_4">
					<!-- 회원마다 보여지는 디테일 뷰 다름 
					
					=> 조건 1 : 승인 버튼이 눌리기 전에만 삭제 가능 => 삭제 버튼 o (ec_status가 모두 N인 결재대기 상태) 
					   		   (ec_status가 c 또는 y가 하나라도 있으면 삭제 버튼 x) -->
					<!-- 
					<c:if test="${ ap[0].ecStatus eq 'N' && ap[0].memNo eq loginUser.memNo }">   		   															
						<button class="btn btn-danger" onclick="postFormSubmit();">삭제하기</button>
					</c:if>
					 -->
					
					<!-- 1. 결재순번이 자기 차례이면서 2. 전 순번 상태가 Y이고 3. 반려 상태가 아닐 때 보이는 버튼 -->	
					<!-- 결재자의 ec_turn을 불러와서 ec_turn -1 상태가 Y 이고 결재자의 ec_status가 N이면 버튼이 보이도록 -->
					<!--  
					<c:if test="${ ap[0].ecStatus eq 'N' && ap[0].memNo eq loginUser.memNo }">         
						<button class="btn btn-light" style="background-color:lightgray; border-color:lightgray;">승인하기</button>
						<button class="btn btn-danger">반려하기</button> 	
					</c:if>
					-->
					    
				    <!-- 버튼 표현해야하되는 쪽에서 -->
				    <c:choose>
						<c:when test="${ ttt eq loginUser.memNo }">
							<button class="btn btn-light" style="background-color:lightgray; border-color:lightgray;">승인하기</button>
							<button class="btn btn-danger">반려하기</button> 	
						</c:when>    
				    	<c:otherwise>
				    		<button class="btn btn-light" style="background-color:lightgray; border-color:lightgray;" disabled>승인하기</button>
				    		<button class="btn btn-danger" disabled>반려하기</button>
				    	</c:otherwise>
				    </c:choose>
					
					
					<form id="postForm" action="" method="post">
						 <input type="hidden" name="eano" value="${ ea.ecDocNo }">
		                 <input type="hidden" name="filePath" value="${ ea.ecFileUpdate }"> 
					</form>
					
					
					<script>
						function postFormSubmit() { 
							
							var result = confirm("기안한 문서를 삭제하시겠습니까?"); 
							
							if(result){
								$("#postForm").attr("action", "deleteDocument.ea").submit();
								return true;
							} else{
								alert("삭제가 취소되었습니다.")
								return false; 
							}
						}
					</script>
																
				</div><br><br>

			</div>

        </div>
    </div>
		
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
    
</body>
</html>

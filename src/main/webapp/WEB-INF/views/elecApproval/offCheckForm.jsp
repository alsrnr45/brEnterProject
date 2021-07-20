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
	select{background:url(https://t1.daumcdn.net/cfile/tistory/99761B495C84AA8716) no-repeat 95% 50% !important;}
	.form-control{width: 200px; height:30px; margin: auto;}

	/* 버튼 */
	.btn-primary {margin: 0 0 10px 950px; background-color:rgb(155, 89, 182); border-color:rgb(155, 89, 182);}
	.btn-light {margin-right: 10px; background-color: rgb(215, 215, 215); border-color: rgb(215, 215, 215);}
	.btn-danger {background-color: rgb(255, 134, 134); border-color: rgb(255, 134, 134); color: black;}

	/* outer */
	/* #layoutSidenav_content div {outline: 1px solid blueviolet;} */
	.content {width: 1150px; height: 860px; margin: auto; margin-top: 30px;}
	table {text-align: center; font-size:13px; margin: auto;}
	table>tr,th,td{border:1px lightgray solid;} 
	
	/* 문서종류 */
	.tableType01 th {height: 40px; background-color:rgba(241, 241, 241, 0.75);}
	.tableType01 img {height:50px;}

	/* 결재선 */
	.content_2 {width:920px; margin:auto;}
	.content_2>div {float: left; text-align:center;}
	.content_2 img {height: 60px;}
	.tableType02 th {height: 160px; background-color:rgba(241, 241, 241, 0.75);}
	.tableType02 img {height:60px;}
	#drafter {
		width: 120px; 
		height: 100%; 
		font-size: 13px;
		background-color: rgba(241, 241, 241, 0.75);
		outline: 0.1px solid lightgray;
		padding-top: 100px;
	}

	#approver {
		width: 120px;
		height: 100%;
		font-size: 13px;
		background-color: rgba(241, 241, 241, 0.75);
		outline: 0.1px solid lightgray;
		padding-top: 100px;
	}
   
	#approvalInfo {
		width: 136px; 
		height: 100%;
		font-size: 13px;
		outline: 0.1px solid lightgray;
	}
	#approvalInfo div {outline: 1px solid lightgray;}

	/* 연차폼 */
	.tableType03 td {text-align: left;}
	.tableType03 th {background-color:rgba(241, 241, 241, 0.75);}
	.tableType03 input, textarea{width:100%; border:none; padding-left:10px;}
	.tableType03 input:focus, .tableType03 textarea:focus{box-shadow: none !important;}

	/* 삭제버튼 */
	.content_4 {padding: 15px 0 0 500px;}
	.content_4>a{margin-left: 40px;}
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

				<button class="btn btn-primary" onclick="javascript:history.go(-1);">목록으로</button>

				<div class="content_1">
					<table class="tableType01">
						<tr>
							<th width="120">문서종류</th> 
							<td width="340">연차</td>          
							<th width="120">문서번호<input type="hidden" id="eano" class="eano" value="${ ea.ecDocNo }"></th>
							<td width="340">${ ea.ecDocName }</td>
						</tr>
						<tr style="border-bottom:0;">
							<th>기안 일시</th>
							<td>
								<fmt:parseDate value="${ea.ecEnrolldate}" var="enrolldate" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate value="${ enrolldate }" pattern="yyyy-MM-dd"/>
							</td>
							<th>완료 일시</th>
							<td>
								<fmt:parseDate value="${ ea.ecCompdate }" var="compdate" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate value="${ compdate }" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
					</table><br>
				</div>

				<!-- 결재선 -->
				<div class="content_2" style="height:220px;">
					<div id="drafter">기안자</div>
					<div id="approvalInfo">
						<div style="height:35px; padding-top:7px;">${ ea.deptName }</div>
						<div style="height:35px; padding-top:7px;">${ ea.posiName }</div>
						<div style="height:80px; padding-top:10px;"><img src="resources/elecApprovalUpfiles/check1.png"></div>
						<div style="height:35px; padding-top:7px;">
							<fmt:parseDate value="${ea.ecEnrolldate}" var="enrolldate" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${enrolldate}" pattern="yyyy-MM-dd"/>
						</div>
						<div style="height:35px; padding-top:7px;">${ ea.ecWriter }</div>
					</div>
					
					<div id="approver">결재자</div>
                 	<!-- 무조건 4번 반복문 돌게 (i=0~3)-->
                 	<c:forEach var="i" begin="0" end="3">
                     	<c:choose>
                         	<c:when test="${ i lt ApprovalPathList.size() }">
          					
                            <!--i라는 값이 현재 리스트의 사이즈보다 작을 경우 (예를들어 현재 리스트의 사이즈가 2라는 가정하면 i가 0,1일경우)-->
                            <div id="approvalInfo">
								<div style="height:35px; padding-top:7px;">${ ApprovalPathList[i].deptName }</div>
								<div style="height:35px; padding-top:7px;">${ ApprovalPathList[i].posiName }</div>
								<c:choose>
									<c:when test="${ ApprovalPathList[i].apEnrolldate != null }">

										<div style="height:80px; padding-top:10px;"><img src="resources/elecApprovalUpfiles/check2.png"></div>

										<!-- 기안/반려하기 버튼 구현 -->
										<c:if test="${ (i+1) lt ApprovalPathList.size() }">
											<c:set var="turnNo" value="${ ApprovalPathList[i+1].memNo }"/>
											<c:set var="approvalNo" value="${ ApprovalPathList[i+1].approvalPathNo }"/>
										</c:if>

										<!-- 삭제하기 버튼 구현 -->
										<c:set var="flag" value="delete"/>
									</c:when>
									<c:otherwise>
										<div style="height:80px;"></div>
										<c:if test="${i eq 0}">
											<c:set var="turnNo" value="${ApprovalPathList[i].memNo}"/>
											<c:set var="approvalNo" value="${ ApprovalPathList[i].approvalPathNo }"/>
										</c:if>
									</c:otherwise>
								</c:choose>

								<div style="height:35px; padding-top:7px;">
									<fmt:parseDate value="${ ApprovalPathList[i].apEnrolldate }" var="apEnrolldate" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate value="${ apEnrolldate }" pattern="yyyy-MM-dd"/>
								</div>
								<div style="height:35px; padding-top:7px;">${ ApprovalPathList[i].memName }</div>

								<c:if test="${ ApprovalPathList[i].memNo eq loginUser.memNo }">
									<c:set var="approvalName" value="approvalName"/>
								</c:if>
								
								<c:if test="${ i eq 3 }">
									<c:set var="finalApproval" value="${ ApprovalPathList[i].memNo }"/>
								</c:if>
								
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
					<form action="" id="ecDetailForm" method="post">
						<table class="tableType03">
							<tr height="40">
								<th>제목</th>
								<td colspan="3"><input type="text" name="ecTitle" id="ecTitle" value="${ ea.ecTitle }" readonly></td>
							</tr>
							<tr height="40">
								<th width="120">연차신청일</th>
								<td colspan="3" width="800">
									<input type="date" name="offStart" value="${ ea.offStart }" required style="width:130px; margin-right:25px" readonly>  
									 ~
	                           		<input type="date" name="offEnd" value="${ ea.offEnd }" required style="width:130px; margin-left:25px;" readonly>
								</td>
							</tr>
							<tr height="30">
								<th colspan="4">상세내용</th>
							</tr>
							<tr>
								<td colspan="4">
									<input type="text" name="ecTitle" id="ecTitle" value="${ ea.ecCnt }" readonly style="height:250px;">
								</td>
							</tr>
						</table>
					</form>
				</div>

				<div class="content_4">
				<!-- 삭제 버튼 보이는 조건문 --> 
				<!-- 조건 : 승인 버튼이 눌리기 전에만 삭제 가능 => ec_status가 모두 N인 결재대기 상태
							(ec_status 중 c 또는 y가 하나라도 있으면 삭제 버튼 x) --> 
				
					<c:choose>  
						<c:when test="${ approvalName != null }">     
							<c:choose>                
								<c:when test="${ turnNo eq loginUser.memNo }">
									<button class="btn btn-light" onclick="approveFormSubmit();" style="background-color:lightgray; border-color:lightgray;">승인하기</button>
									<button class="btn btn-danger" type="submit">반려하기</button>
								</c:when>  
								<c:otherwise>
										<button class="btn btn-light" style="background-color:lightgray; border-color:lightgray;" disabled>승인하기</button>
										<button class="btn btn-danger" disabled>반려하기</button>
								</c:otherwise>
							</c:choose>
						</c:when>
		
						<c:when test="${ ea.memNo eq loginUser.memNo }">
							<c:choose>
								<c:when test="${ flag eq 'delete' }">
									<button class="btn btn-danger" onclick="postFormSubmit();" disabled>삭제하기</button>      
								</c:when>
								<c:otherwise>
										<button class="btn btn-danger" onclick="postFormSubmit();">삭제하기</button> 
									</c:otherwise>
							</c:choose>
						</c:when>                          
					</c:choose>   
							
														
					<form id="postForm" action="" method="post">
						<input type="hidden" name="eano" value="${ ea.ecDocNo }">
						<input type="hidden" name="memNo" value="${ loginUser.memNo }">
					</form>							
					
					<form id="approveForm" action="" method="post">
						<input type="hidden" name="eano" value="${ ea.ecDocNo }">
						<input type="hidden" name="memNo" value="${ loginUser.memNo }">
                 		<input type="hidden" name="approvalPathNo" value="${ approvalNo }">
						<input type="hidden" name="finalApproval" value="${ finalApproval }">
					</form>
				</div><br><br>
			</div>
        </div>
    </div>

	<script>
		function postFormSubmit() { 
			
			var result = confirm("기안한 문서를 삭제하시겠습니까?"); 
			
			if(result){
				$("#postForm").attr("action", "deleteOff.ea").submit();
				return true;
			} else{
				alert("삭제가 취소되었습니다.")
				return false; 
			}
		}

		function approveFormSubmit() { 
			
			var result = confirm("기안한 문서를 승인하시겠습니까?"); 
			
			if(result){
				$("#approveForm").attr("action", "approveDocument.ea").submit();
				return true;
			} else{
				alert("승인이 취소되었습니다.")
				return false; 
			}
		}
	</script>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

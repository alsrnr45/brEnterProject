<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				
				<div class="content_2">
					<table class="tableType02">
						<tr height="35">
							<th rowspan="5" width="120">기안자</th>
							<td width="136">${ ea.deptName }</td>
							<th rowspan="5" width="120">결재자</th>
							<td width="136">개발팀</td>
							<td width="136">개발팀</td>
							<td width="136">개발팀</td>
							<td width="136"></td>
						</tr>
						<tr height="35">
							<td>${ ea.posiName }</td>
							<td>과장</td>
							<td>차장</td>
							<td>부장</td>
							<td></td>
						</tr>
						<!-- 승인 시 승인날짜와 같이 이미지 뜨도록 (sysdate) -->
						<tr height="80" style="color: gray;">
							<td><img src="resources/elecApprovalUpfiles/check1.png"></td>
							<td><img src="resources/elecApprovalUpfiles/check2.png"></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr height="35">
							<td>${ ea.ecEnrolldate }</td>
							<td>2021-06-22</td>
							<td>2021-06-22</td>
							<td>2021-06-22</td>
							<td></td>
						</tr>
						<tr height="35">
							<td style="color: royalblue;">${ ea.ecWriter }</td>
							<td>이과장</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
					<br>
				</div>

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
                                     	첨부파일이 없습니다.
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
					=> 조건 1: 해당 전자결재를 작성한 기안자일 경우 / 조건 2: 해당 문서의 결재자일 경우 / 조건 3: 아무것도 해당되지 않는 사원일 경우) -->
					 
					<!-- 본인이 기안한 문서일 경우에만 보여져야 하는 버튼 -->
					<a class="btn btn-danger" onclick="postFormSubmit();">삭제하기</a>
						
					<!-- 결재자일 경우에만 보여져야 하는 버튼 -->
					<!-- 
					<button class="btn btn-light" style="background-color:lightgray; border-color:lightgray;">승인하기</button>
					<button class="btn btn-danger">반려하기</button> -->		
					
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

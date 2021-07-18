<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>expenseDetail</title>

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
	
	/* 드롭박스 스타일 */
	.dataTable-selector:focus, .dataTable-selector:active{
	    border-color: rgb(155, 89, 182); 
	    box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);
	    outline: 0 none;
	}
	option:checked {background: rgb(155, 89, 182); color: white;}
	select{background:url(https://t1.daumcdn.net/cfile/tistory/99761B495C84AA8716) no-repeat 95% 50% !important;}
    .form-control{width: 200px; height:30px; margin: auto;}

    /* 버튼 */
    .btn-primary {
        margin: 0 0 10px 880px; 
        background:rgb(155, 89, 182); 
        border:none;
        width:100px;
        font-size: 13px;
        width:80px;
    }
    .btn-light {margin-right: 10px;background-color: rgb(215, 215, 215); border-color: rgb(215, 215, 215); color:white;}
    .btn-danger {background-color: rgb(255, 134, 134); border-color: rgb(255, 134, 134); color: white;}

    /* 스타일 */
    /* #layoutSidenav_content div {outline: 1px solid blueviolet;} */

    .content {width:1000px; height: 100%; margin: auto; margin-top: 30px;}
    
    .content_2 {width:920px; margin:auto;}
	.content_2>div {float: left; text-align:center;}
	.content_2 img {height: 60px;}
	.content_3 {margin-top:25px;};
    .content_4 {padding: 15px 0 0 400px; margin-left:50px;}

    table {text-align: center; font-size:13px; margin: auto;}
    table>tr,th,td{border:1px lightgray solid;} 

    /* .tableType01 {margin-bottom: 10px;} */
    .tableType01 th {height: 40px; background-color:rgba(241, 241, 241, 0.75);}
    .tableType01 img {height:50px;}
    
    .tableType02 th {height: 160px; background-color:rgba(241, 241, 241, 0.75);}
    .tableType02 img {height:60px;}

    .tableType03 td {text-align: left;}
    .tableType03 th {background-color:rgba(241, 241, 241, 0.75);}

    .tableType03 input, textarea{width:100%; border:none; padding-left:10px;}
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
				<a class="btn btn-primary" href="approvalTotalList.ea?mno=${ loginUser.memNo }">목록으로</a>
				<div class="content_1">
					<table class="tableType01">
						<tr>
							<th width="120">문서종류</th> 
							<td width="340">지출결의서</td>
							<th width="120">문서번호</th>
							<td width="340">
								${ ea.ecDocName }
								<input type="hidden" name="docNo" value="${ ea.ecDocNo }">
							</td>
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
						<div style="height:35px;">${ ea.ecEnrolldate }</div>
						<div style="height:35px;">${ ea.ecWriter }</div>
					</div>
					<div id="approver">결재자</div>
					<c:choose>
						<c:when test="${ ApprovalPathList.size() eq 4 }">
							<c:forEach var="ap" items="${ ApprovalPathList }">
							<div id="approvalInfo">
								<div style="height:35px;">${ ap.deptName }</div>
								<div style="height:35px;">${ ap.posiName }</div>
								<c:choose>
									<c:when test="${ ap.apEnrolldate != null }">
										<div style="height:80px;"><img src="resources/elecApprovalUpfiles/check2.png"></div>
									</c:when>
									<c:otherwise>
										<div style="height:80px;"></div>
									</c:otherwise>
								</c:choose>
								<div style="height:35px;">${ ap.apEnrolldate }</div>
								<div style="height:35px;">${ ap.memName }</div>
							</div>
							</c:forEach>
						</c:when>
						<c:when test="${ ApprovalPathList.size() eq 3 }">
							<c:forEach var="ap" items="${ ApprovalPathList }">
								<div id="approvalInfo">
									<div style="height:35px;">${ ap.deptName }</div>
									<div style="height:35px;">${ ap.posiName }</div>
									<c:choose>
										<c:when test="${ ap.apEnrolldate != null }">
											<div style="height:80px;"><img src="resources/elecApprovalUpfiles/check2.png"></div>
										</c:when>
										<c:otherwise>
											<div style="height:80px;"></div>
										</c:otherwise>
									</c:choose>
									<div style="height:35px;">${ ap.apEnrolldate }</div>
									<div style="height:35px;">${ ap.memName }</div>
								</div>
							</c:forEach>
							<div id="approvalInfo">
								<div style="height:35px;"></div>
								<div style="height:35px;"></div>
								<div style="height:80px;"></div>
								<div style="height:35px;"></div>
								<div style="height:35px;"></div>
							</div>
						</c:when>
						<c:when test="${ ApprovalPathList.size() eq 2 }">
							<c:forEach var="ap" items="${ ApprovalPathList }">
								<div id="approvalInfo">
									<div style="height:35px;">${ ap.deptName }</div>
									<div style="height:35px;">${ ap.posiName }</div>
									<c:choose>
										<c:when test="${ ap.apEnrolldate != null }">
											<div style="height:80px;"><img src="resources/elecApprovalUpfiles/check2.png"></div>
										</c:when>
										<c:otherwise>
											<div style="height:80px;"></div>
										</c:otherwise>
									</c:choose>
									<div style="height:35px;">${ ap.apEnrolldate }</div>
									<div style="height:35px;">${ ap.memName }</div>
								</div>
							</c:forEach>
							<div id="approvalInfo">
								<div style="height:35px;"></div>
								<div style="height:35px;"></div>
								<div style="height:80px;"></div>
								<div style="height:35px;"></div>
								<div style="height:35px;"></div>
							</div>
							<div id="approvalInfo">
								<div style="height:35px;"></div>
								<div style="height:35px;"></div>
								<div style="height:80px;"></div>
								<div style="height:35px;"></div>
								<div style="height:35px;"></div>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="ap" items="${ ApprovalPathList }">
								<div id="approvalInfo">
									<div style="height:35px;">${ ap.deptName }</div>
									<div style="height:35px;">${ ap.posiName }</div>
									<c:choose>
										<c:when test="${ ap.apEnrolldate != null }">
											<div style="height:80px;"><img src="resources/elecApprovalUpfiles/check2.png"></div>
										</c:when>
										<c:otherwise>
											<div style="height:80px;"></div>
										</c:otherwise>
									</c:choose>
									<div style="height:35px;">${ ap.apEnrolldate }</div>
									<div style="height:35px;">${ ap.memName }</div>
								</div>
							</c:forEach>
							<div id="approvalInfo">
								<div style="height:35px;"></div>
								<div style="height:35px;"></div>
								<div style="height:80px;"></div>
								<div style="height:35px;"></div>
								<div style="height:35px;"></div>
							</div>
							<div id="approvalInfo">
								<div style="height:35px;"></div>
								<div style="height:35px;"></div>
								<div style="height:80px;"></div>
								<div style="height:35px;"></div>
								<div style="height:35px;"></div>
							</div>
							<div id="approvalInfo">
								<div style="height:35px;"></div>
								<div style="height:35px;"></div>
								<div style="height:80px;"></div>
								<div style="height:35px;"></div>
								<div style="height:35px;"></div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="content_3">
					<form action="" id="ecDetailForm" method="post" enctype="multipart/form-data">
						<table class="tableType03">
							<tr height="40">
								<th>제목</th>
								<td colspan="3"><input type="text" name="ecTitle" id="ecTitle" value="${ ea.ecTitle }" readonly></td>
							</tr>
                            <tr height="40">
                                <th>구분</th>
                                <td colspan="3"><input type="text" name="ecTitle" id="ecTitle" value="${ ea.exStatus }" readonly></td>
                            </tr>
							<tr height="40">
								<th width="120">지출 일자</th>
								<td colspan="3" width="800"><input type="text" name="" id="" value="${ ea.month }" readonly style="width:130px;"></td>
							</tr>
                            <tr height="40">
                                <th>계좌 정보</th>
                                <td colspan="3"><input type="text" name="ecTitle" id="ecTitle" value="${ ea.account }" readonly></td>
                            </tr>
							<tr height="40">
								<th colspan="4">지출 내용</th>
							</tr>
							<tr>
								<td colspan="4">
									<input type="text" name="ecTitle" id="ecTitle" value="${ ea.ecCnt }" readonly style="height:300px;">
								</td>
							</tr>
						</table>
					</form>
				</div>
				
				<div class="content_4">
					<!-- 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
					<a class="btn btn-danger" href="">삭제하기</a>
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

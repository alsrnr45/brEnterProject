<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	/* 드롭박스 */
	select:focus, select:active{
	    border-color: rgb(155, 89, 182) !important;
	    box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6) !important;
	    outline: 0 none !important;
	}
	option:checked {background: rgb(155, 89, 182); color: white;}
	select{background:url(https://t1.daumcdn.net/cfile/tistory/99761B495C84AA8716) no-repeat 95% 50% !important; font-size: 13px !important;}

	/* 버튼 */
	.btn-primary {margin: 0 0 0px 950px; background-color:rgb(155, 89, 182); border-color:rgb(155, 89, 182);}
	.btn-outline-secondary {margin: 0 0 3px 15px; color:royalblue; font-size: 12px;}
	.btn-outline-secondary:hover, .btn-outline-secondary:active {margin: 0 0 3px 15px; color:royalblue; font-size: 12px; background-color: white; box-shadow: none !important;}


	/* 스타일 */
	/* #layoutSidenav_content div {outline: 1px solid blueviolet;} */

	.content {width:1150px; height: 810px; margin: auto; margin-top: 30px; margin-bottom: 30px;}
	h6 {margin: 0 0 10px 115px; font-size: 18px;}

	table {text-align: center; font-size:13px; margin: auto;}
	table>tr,th,td{border:1px lightgray solid;} 

	.tableType01 th {height: 40px; background-color:rgba(241, 241, 241, 0.75);}
	
	.tableType02 th {height: 160px; background-color:rgba(241, 241, 241, 0.75);}
	.tableType02 img {height:50px;}

	.tableType03 td {text-align: left;}
	.tableType03 th {background-color:rgba(241, 241, 241, 0.75);}

	.tableType03 input, textarea{width:100%; border:none; padding-left:10px;}
	.tableType03 input:focus, .tableType03 textarea:focus{box-shadow: none !important;}
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


		<!-- 현재날짜 -->
		<c:set var="today" value="<%=new java.util.Date()%>" />
		<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyyMMdd" /></c:set> 
		
		<!-- 랜덤번호 -->
		<c:set var="randomNo" value="<%= (int)(Math.random() * (99999 - 10000 + 1)) + 10000 %>" />
        
        <!--컨텐츠-->
        <div id="layoutSidenav_content">
            
			<div class="content">
				<form action="">

					<button class="btn btn-primary" href="">기안하기</button>

					<div class="content_1">
						<h6>기본 설정</h6>
						<table class="tableType01">
							<tr>
								<th width="120px" height="35px;">문서종류</th> 
								<td width="340px">
									<select class="form-control" name="approvalFormCode url" onchange="moveurl(this.value);">
										<option value="documentEnrollForm.ea">기획안</option>
										<option value="documentEnrollForm.ea">업무연락</option>
										<option value="offEnrollForm.ea" selected>연차</option>
										<option value="expenseForm.ea">지출결의서</option>
										<option value="documentEnrollForm.ea">회람</option>
									</select>
									<input type="hidden" id="approvalFormCode" value="">
								</td>
								<th width="120px">문서번호</th> 
								<td width="340px">OF-<c:out value="${date}"/>-<c:out value="${randomNo}"/></td>
							</tr>
						</table>
						<br><br>
					</div>

					<div class="content_2">
						<h6>결재선<button class="btn btn-outline-secondary btn-sm" onclick="">결재선 설정</button></h6>
						
						<table class="tableType02">
							<tr height="35">
								<th rowspan="5" width="120">기안자</th>
								<td width="136">개발팀</td>
								<th rowspan="5" width="120">결재자</th>
								<td width="136">개발팀</td>
								<td width="136">개발팀</td>
								<td width="136">개발팀</td>
								<td width="136"></td>
							</tr>
							<tr height="35">
								<td>사원</td>
								<td>과장</td>
								<td>차장</td>
								<td>부장</td>
								<td></td>
							</tr>
							<!-- 승인 시 승인날짜와 같이 이미지 뜨도록 (sysdate) -->
							<tr height="80" style="color:gray;">
								<td></td>
								<td><img src="resources/images/approval_Ok.png"></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr height="35">
								<td>2021-06-11</td>
								<td>2021-06-11</td>
								<td>2021-06-11</td>
								<td>2021-06-11</td>
								<td></td>
							</tr>
							<tr height="35">
								<td style="color: royalblue;">김사원</td>
								<td>박과장</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
						<br>
					</div>

					<div class="content_3">
						<form action="" id="ecDetailForm" method="post" enctype="multipart/form-data">
							<table class="tableType03">
								<tr height="40">
									<th>제목</th>
									<td colspan="3"><input type="text" name="ecTitle" id="ecTitle" value="연차 신청합니다." placeholder="제목을 입력해주세요." required></td>
								</tr>
								<tr height="40">
									<th width="120">기안자</th>
									<td width="340"><input type="text" name="" id="" value="김사원" readonly></td>
									<th width="120">기안 부서</th>
									<td width="340"><input type="text" name="" id="" value="개발팀" readonly></td>
								</tr>
								<tr height="40">
									<th>연차신청일</th>
									<td><input type="date" name="" id="" value="2021-06-24" required style="width:130px;"></td>
									<th>기안 일시</th>
									<td><input type="text" name="" id="" value="2021-06-11 10:18:07" readonly></td>
								</tr>
								<tr height="30">
									<th colspan="4">상세내용</th>
								</tr>
								<tr>
									<td colspan="4">
										<input type="text" name="ecTitle" id="ecTitle" value="연차 신청합니다." placeholder="내용을 입력해주세요." required style="height:250px;">
									</td>
								</tr>
							</table>   
							
						</form>
					</div>

				</form>
			</div>

        </div>
    </div>

	<script>
		var len = $('#ecTitle').val().length;
		$('#ecTitle').focus();
		$('#ecTitle')[0].setSelectionRange(len, len);

		function moveurl(url) { 
    		location.href = url;
		};
	</script>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<!-- 부트스트랩4 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
	
	/* 폰트 */
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
    * {font-family: 'Noto Sans KR', sans-serif;}
        
	/* 드롭박스 */
	select:focus, select:active{
	    border-color: rgb(155, 89, 182) !important;
	    box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6) !important;
	    outline: 0 none !important;
	}
	option:checked {background: rgb(155, 89, 182); color: white;}
	select{background: url(https://t1.daumcdn.net/cfile/tistory/99761B495C84AA8716) no-repeat 95% 50% !important; font-size: 13px !important;}

	/* 버튼 */
	.btn-primary {margin: 0 0 0px 950px; background-color: rgb(155, 89, 182); border-color: rgb(155, 89, 182);}
	.btn-outline-secondary {margin: 0 0 3px 15px; color: royalblue; border-color: lightgray; font-size: 12px;}
	.btn-outline-secondary:hover, .btn-outline-secondary:active {margin: 0 0 3px 15px; color: royalblue; border-color: lightgray; font-size: 12px; background-color: white; box-shadow: none !important;}
		
	/* 스타일 */
	/* #layoutSidenav_content div {outline: 1px solid blueviolet;} */

	.content {width: 1150px; height: 810px; margin: auto; margin-top: 30px; margin-bottom: 30px;}
	h6 {margin: 0 0 10px 115px; font-size: 18px;}

	table {text-align: center; font-size: 13px; margin: auto;}
	table>tr,th,td{border: 1px lightgray solid;} 

	.tableType01 th {height: 40px; background-color: rgba(241, 241, 241, 0.75);}
	
	.tableType02 th {height: 160px; background-color: rgba(241, 241, 241, 0.75);}
	.tableType02 img {height: 50px;}

	.tableType03 td {text-align: left;}
	.tableType03 th {background-color: rgba(241, 241, 241, 0.75);}

	.tableType03 input, textarea{width: 100%; border: none; padding-left: 10px;}
	.tableType03 input:focus, .tableType03 textarea:focus{box-shadow: none !important;}
	
	/* 결재선 모달 */
	.signModalOuter{ margin: auto; text-align: center; width: 1000px; height: 500px;}
	.signModalOuter .btn{background: lightslategrey; color: white; border: none; margin-top: 10px;}
	    
	.modal1 ul{list-style: none; padding-left: 0px; height: 30px; padding-top: 3px;}
	.modal1 ul:hover{cursor: pointer; background: rgb(170, 218, 248); padding-top: 3px;}
	.modal1>ul.on1 {cursor: pointer; background: rgb(170, 218, 248);}
    .modal2>ul>li.on2 {cursor: pointer; background: rgb(170, 218, 248);}
	.modal2 ul {padding: 4px 0 0 0;}
	.modal2 li {list-style: none; margin-bottom: 13px; padding-bottom: 3px;}
	.modal2 li: hover{cursor: pointer; background: rgb(170, 218, 248); margin-bottom: 13px; padding-bottom: 3px;}
	    
	.modal1 {padding-top: 37px;}
	.modal1, .modal2, .modal3, .modal4{float: left; height: 430px; margin: 30px 5px 0px 5px; }
	.modal1, .modal2{border: 1px solid lightgray; padding: 20px; overflow: auto;}
	.modal1, .modal2, .modal4{width: 30%;}
	.modal3{width: 5%; padding-top: 160px;}
	.modal3 .btn-primary {margin-left: 0px;}
	.modal4 .btn-secondary{width: 100%; height: 44px; background: rgb(255, 134, 134)}
	.modal4 .apply{background: rgb(255, 235, 152); color: black;}
	.modal4_1{
		height: 10%; 
	    border: 1px solid lightgray; 
	    margin-bottom: 17px;
	    padding-top: 10px;
	    color: royalblue;
	    text-align: center;
	}
	.modal4_2{width: 100%; height: 30px;}
	.modal4_2 .btn{width: 30px; height: 30px; float: right; margin-top: 0px; margin-left: 5px;}
	.modal4_3{ height: 47%; border: 1px solid lightgray; text-align: center; padding: 25px 20px 20px 0;}

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
				<form action="documentEnroll.ea" method="post" enctype="multipart/form-data">

					<button class="btn btn-primary" href="">기안하기</button>

					<div class="content_1">
						<h6>기본 설정</h6>
						
						<table class="tableType01">
							<tr>
								<th width="120px" height="35px;">문서종류</th> 
								<td width="340px">
									<select class="form-control" name="approvalFormCode url" id="approvalFormCode" onchange="moveurl(this.value);">
										<option value="documentEnrollForm.ea">기획안</option>
										<option value="documentEnrollForm.ea">업무연락</option>
										<option value="offEnrollForm.ea">연차</option>
										<option value="expenseForm.ea">지출결의서</option>
										<option value="documentEnrollForm.ea">회람</option>
									</select>
										<input type="hidden" id="approvalFormCode" value="${ code }">
								</td>
								<th width="120px">문서번호</th><input type="hidden" name="ecDocName" value="${ code }-<c:out value="${date}"/>-<c:out value="${randomNo}"/>"></th> 
								<td width="340px">
									${ code }-<c:out value="${date}"/>-<c:out value="${randomNo}"/>
								</td>
							</tr>
						</table>
						<br><br>
					</div>

					<div class="content_2">
						<h6>결재선<button type="button" class="btn btn-outline-secondary btn-sm signOffBtn" data-toggle="modal" data-target="#signOffBtn">결재선 설정</button></h6>
						
						<table class="tableType02">
							<tr height="35">
								<th rowspan="5" width="120">기안자</th>
								<td width="136">${ loginUser.deptName }</td>
								<th rowspan="5" width="120">결재자</th>
								<td width="136">개발팀</td>
								<td width="136">개발팀</td>
								<td width="136"></td>
								<td width="136"></td>
							</tr>
							<tr height="35">
								<td>${ loginUser.posiName}</td>
								<td>대리</td>
								<td>과장</td>
								<td></td>
								<td></td>
							</tr>
							<!-- 승인 시 승인날짜와 같이 이미지 뜨도록 (sysdate) -->
							<tr height="80" style="color:gray;">
								<td><img src="resources/elecApprovalUpfiles/check1.png"></td>
								<td><img src="resources/elecApprovalUpfiles/check2.png"></td>
								<td><img src="resources/elecApprovalUpfiles/check2.png"></td>
								<td></td>
								<td></td>
							</tr>
							<tr height="35">
								<td><fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr height="35">
								<td style="color: royalblue;">${ loginUser.memName }</td>
								<td>김혜미</td>
								<td>안소은</td>
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
									<td colspan="3"><input type="text" name="ecTitle" id="ecTitle" value="전자결재 문서 제목입니다." placeholder="제목을 입력해주세요." required></td>
								</tr>
								<tr height="40">
									<th width="120">기안자</th>
									<td width="340"><input type="text" name="" id="" value="김사원" readonly></td>
									<th width="120">기안 부서</th>
									<td width="340"><input type="text" name="" id="" value="개발팀" readonly></td>
								</tr>
								<tr height="40">									
									<th>기안 일시</th>
									<td><input type="text" name="" id="" value="2021-06-11 10:18:07" readonly></td>
	                               	<th>첨부파일</th>
									<td><input type="file" name="ecUpfile" id="ecUpfile" style="cursor:pointer;"></td>
								</tr>
								<tr height="30">
									<th colspan="4">상세내용</th>
								</tr>
								<tr>
									<td colspan="4">
										<input type="text" name="ecTitle" id="ecTitle" value="전자결재 문서 내용입니다." placeholder="내용을 입력해주세요." required style="height:250px;">
								</td>
							</tr>
						</table>   														
					</div>
				</form>
			</div>
        </div>
        
    </div>
	
	<!-- The Modal -->
 	<form action="">
		<div class="modal fade" id="signOffBtn">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
	              
					<!-- Modal Header -->
					<div class="modal-header">
						<h5 class="modal-title">결재선 설정</h5>
					</div>
					
					<!-- Modal body -->
					<div class="modal-body" style="width:100%; height:100%;">
                            <div class="signModalOuter">
                                <div class="modal1">
                                	<c:forEach var="dept" items="${ list }">
                               			<ul id="dept">
                               				<a>${ dept.deptName }(${ dept.count })</a>
                               				<input type="hidden" name="deptNo" class="deptNo" value="${ dept.deptNo }">
                               			</ul>
                                    </c:forEach>
                                </div>
                                <div class="modal2">
                                    <ul>
                                    </ul>
                                </div>
                                <div class="modal3">
                                    <button class="btn btn-primary"> > </button>
                                    <button class="btn btn-primary"> < </button>
                                </div>
							<div class="modal4" align="left">
								<div style="margin-bottom:5px;"><b>기안자</b></div>
								<div class="modal4_1">
		 							<p>${ loginUser.memName }</p>
								</div>
								<div class="modal4_2">
		 							<b style="float:left;">결재자</b>
		 							<div>
		 							<button type="button" class="btn btn-sm"><i class="fas fa-angle-down"></i></button>
		 							<button type="button" class="btn btn-sm"><i class="fas fa-angle-up"></i></button>
		 							</div>
								</div>
								<div class="modal4_3">
		 							<ul>안소은(사원)</ul>
		 							<ul>정예빈(팀장)</ul>
		 							<ul>김혜미(부장)</ul>
		 							<ul>김민국(대표)</ul>
								</div>
								<div>
		 							<button type="submit" class="btn btn-secondary apply" data-dismiss="modal">적용</button>
		 							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
								</div>
							</div>
						</div>    
					</div>
				</div>
			</div>
		</div>
	</form>	
	
	
	<script type="text/javascript">
	
		$(function(){
			$(".modal1>ul").click(function(){
				
			var deptNo = $(this).children(".deptNo").val();
			var json = JSON.parse(deptNo);
				
			$.ajax({
	              url:"memberList.ea",
	              data:{deptNo:deptNo},
	              success:function(list){
	              	//console.log(list);
	            	
	              	var value="";
					$.each(list, function(i, obj){
						value += "<li>" + obj.memName + "(" + obj.posiName + ")" + "</li>"
					})
	              	
					console.log(value);
	              	$(".modal2 ul").html(value);
	              	
	                  },error:function(){
	                      console.log("실패");
	                  }
				});
			})
		});
	
		$(function(){
			$(".modal1>ul").click(function(){
		
				$('.modal1>ul').removeClass()
				$(this).addClass('on1')
	
			})
		});
		
		$(function(){
			$(".modal2>ul>li").click(function(){
		
				$('.modal2>ul>li').removeClass()
				$(this).addClass('on2')
				
			})
		});
		
		
		 
		function moveurl(url) { 
			location.href = url;
		};
		
		
		var len = $('#ecCnt').val().length;
		$('#ecCnt').focus();
		$('#ecCnt')[0].setSelectionRange(len, len);
				          
	</script>
	
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
    
</body>
</html>

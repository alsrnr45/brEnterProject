<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    .btn-outline-secondary {margin: 0 0 3px 15px; color:royalblue; border-color: lightgray; font-size: 12px;}
    .btn-outline-secondary:hover, .btn-outline-secondary:active {margin: 0 0 3px 15px; color:royalblue; border-color: lightgray; font-size: 12px; background-color: white; box-shadow: none !important;}
   
	/* 문서종류 */
    /* #layoutSidenav_content div {outline: 1px solid blueviolet;} */
	.content {width:1150px; height: 810px; margin: auto; margin-top: 30px; margin-bottom: 30px;}
	h6 {margin: 0 0 10px 115px; font-size: 18px;}
	table {text-align: center; font-size:13px; margin: auto;}
	table>tr,th,td{border:1px lightgray solid;} 
	.tableType01 th {height: 40px; background-color:rgba(241, 241, 241, 0.75);}
	
	/* 결재선 */
	.tableType02 th {height: 160px; background-color:rgba(241, 241, 241, 0.75);}
	.tableType02 input {background-color: white !important; border-color: white; font-size: 13px; text-align: center;}
	.tableType02 input:focus, input:active {
		border-color: rgba(255, 255, 255, 0) !important;
		box-shadow: 0 1px 1px rgba(255, 255, 255, 0.075) inset, 0 0 8px rgba(255, 255, 255, 0) !important;
		outline: 0 none !important;}
	.tableType02 img {height:50px;}

	/* 연차폼 */
	.tableType03 td {text-align: left;}
	.tableType03 th {background-color:rgba(241, 241, 241, 0.75);}
	.tableType03 input, textarea{width:100%; border:none; padding-left:10px;}
	.tableType03 input:focus, .tableType03 textarea:focus{box-shadow: none !important;}
    
    /* 결재선 모달 */
	.signModalOuter{ margin:auto; text-align: center; width:1000px; height:500px;}
	.signModalOuter .btn{background:lightslategrey; color:white; border:none; margin-top:10px;}
	
	.modal1 ul{list-style:none; padding-left:0px; height:30px; padding-top:3px;}
	.modal1 ul:hover{cursor:pointer; background: rgb(170, 218, 248); padding-top:3px;}
	.modal1>ul.on1 {cursor:pointer; background: rgb(170, 218, 248);}
	.modal2>ul>li.on2 {cursor:pointer; background: rgb(170, 218, 248);}
	.modal2 ul {padding: 4px 0 0 0;}
	.modal2 li {list-style:none; margin-bottom:13px; padding-bottom: 3px;}
	.modal2 li:hover{cursor:pointer; background: rgb(170, 218, 248); margin-bottom:13px; padding-bottom: 3px;}
	
	.modal1 {padding-top:37px;}
	.modal1, .modal2, .modal3, .modal4{float:left; height:430px; margin: 30px 5px 0px 5px; }
	.modal1, .modal2{border:1px solid lightgray; padding: 20px; overflow:auto;}
	.modal1, .modal2, .modal4{width:30%;}
	.modal3{width:5%; padding-top:160px;}
	.modal3 .btn-primary {margin-left: 0px;}
	.modal4 .btn-secondary{width:100%; height:44px; background:rgb(255, 134, 134)}
	.modal4 .apply{background:rgb(255, 235, 152); color:black;}
	.modal4_1{
		height:10%; 
		border:1px solid lightgray; 
		margin-bottom: 17px;
		padding-top:10px;
		color:royalblue;
		text-align: center;
	}
	.modal4_2{width:100%; height:30px;}
	.modal4_2 .btn{width:30px; height:30px; float:right; margin-top:0px; margin-left: 5px;}
	.modal4_3{ height:47%; border:1px solid lightgray; text-align: center; padding: 25px 20px 20px 0;}
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
	            <form action="insertOff.ea" method="post">
	
					<button class="btn btn-primary" href="">기안하기</button>
	
						<div class="content_1">
						<h6>기본 설정</h6>
						
						<table class="tableType01">
	                    	<tr>
		                        <th width="120px" height="35px;">문서종류</th> 
		                        <td width="340px">
									<select class="form-control" name="approvalFormCode url" id="ecCode" onchange="moveurl(this.value);">
										<option value="documentEnrollForm.ea?code=PL&mno=${ loginUser.memNo }">기획안</option>
										<option value="documentEnrollForm.ea?code=BC&mno=${ loginUser.memNo }">업무연락</option>
										<option value="offEnrollForm.ea?mno=${ loginUser.memNo }" selected>연차</option>
										<option value="expenseForm.ea?mno=${ loginUser.memNo }">지출결의서</option>
										<option value="documentEnrollForm.ea?code=ME&mno=${ loginUser.memNo }">회람</option>												
									</select>	
									<input type="hidden" name="ecCode" value="OF">
		                        </td>
			                    <th width="120px">문서번호<input type="hidden" name="ecDocName" value="OF-<c:out value="${date}"/>-<c:out value="${randomNo}"/>"></th> 
			                    <td width="340px">OF-<c:out value="${date}"/>-<c:out value="${randomNo}"/></td>
							</tr>
						</table>
	                  <br>
	               </div>
	
	               <div class="content_2">
	                  <h6>결재선<button type="button" class="btn btn-outline-secondary btn-sm signOffBtn" data-toggle="modal" data-target="#signOffBtn">결재선 설정</button></h6>
	                  
						<table class="tableType02">
							<tr height="35">
		                        <th rowspan="5" width="120">기안자</th>
		                        <td width="136">${ loginUser.deptName }</td>
		                        <th rowspan="5" width="120">결재자</th>
								<td width="136" class="signDept1"><input type="text" class="form-control" id="deptName0" name="ApprovalPathList[0].deptName" readonly></td>
								<td width="136" class="signDept2"><input type="text" class="form-control" id="deptName1" name="ApprovalPathList[1].deptName" readonly></td>
								<td width="136" class="signDept3"><input type="text" class="form-control" id="deptName2" name="ApprovalPathList[2].deptName" readonly></td>
								<td width="136" class="signDept4"><input type="text" class="form-control" id="deptName3" name="ApprovalPathList[3].deptName" readonly></td>
							</tr>
							<tr height="35">
		                        <td>${ loginUser.posiName }</td>
								<td><input type="text" class="form-control" id="posiName0" name="ApprovalPathList[0].posiName" readonly></td>
								<td><input type="text" class="form-control" id="posiName1" name="ApprovalPathList[1].posiName" readonly></td>
								<td><input type="text" class="form-control" id="posiName2" name="ApprovalPathList[2].posiName" readonly></td>
								<td><input type="text" class="form-control" id="posiName3" name="ApprovalPathList[3].posiName" readonly></td>
							</tr>
							<!-- 승인 시 승인날짜와 같이 이미지 뜨도록 (sysdate) -->
							<tr height="80" style="color:gray;">
								<td class="signTd"><img src="resources/elecApprovalUpfiles/check1.png"></td>
								<td class="signTd"><input type="hidden" name="ApprovalPathList[0].ecTurn" value="1"></td>
								<td class="signTd"><input type="hidden" name="ApprovalPathList[1].ecTurn" value="2"></td>
								<td class="signTd"><input type="hidden" name="ApprovalPathList[2].ecTurn" value="3"></td>
								<td class="signTd"><input type="hidden" name="ApprovalPathList[3].ecTurn" value="4"></td>
							</tr>
							<tr height="35">
								<td><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></td>
								<td><input type="hidden" id="memNo0" name="ApprovalPathList[0].memNo"></td>
								<td><input type="hidden" id="memNo1" name="ApprovalPathList[1].memNo"></td>
								<td><input type="hidden" id="memNo2" name="ApprovalPathList[2].memNo"></td>
								<td><input type="hidden" id="memNo3" name="ApprovalPathList[3].memNo"></td>
		                     </tr>
		                     <tr height="35">
								<td style="color:royalblue;">${ loginUser.memName }</td>
								<td><input type="text" class="form-control" id="memName0" name="ApprovalPathList[0].memName" readonly></td>
								<td><input type="text" class="form-control" id="memName1" name="ApprovalPathList[1].memName" readonly></td>
								<td><input type="text" class="form-control" id="memName2" name="ApprovalPathList[2].memName" readonly></td>
								<td><input type="text" class="form-control" id="memName3" name="ApprovalPathList[3].memName" readonly></td>
							</tr>
						</table>
						<br>
					</div>
	
					<div class="content_3">
						<table class="tableType03">
	                        <tr height="40">
	                           <th>제목</th>
	                           <td colspan="3"><input type="text" name="ecTitle" id="ecTitle" value="연차 신청합니다." placeholder="제목을 입력해주세요." required></td>
	                        </tr>
	                        <tr height="40">
	                           <th width="120">기안자</th>
	                           <td width="340">
	                           		<input type="text" name="ecWriter" value="${ loginUser.memName }" readonly>
	                           		<input type="hidden" name="memNo" value="${ loginUser.memNo }">
	                           	</td>
	                           <th width="120">기안 부서</th>
	                           <td width="340"><input type="text" value="${ loginUser.deptName }" readonly></td>
	                        </tr>
	                        <tr height="40">
								<th>연차신청일</th>
								<td>
									<input type="date" name="offStart" required style="width:130px; margin-right:25px">  
									 ~
	                           		<input type="date" name="offEnd" required style="width:130px; margin-left:25px;">
								</td>
								<th>기안 일시</th>
								<td><input type="text" name="ecEnrolldate" value="<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />" readonly></td>
	                        </tr>
	                        <tr height="30">
	                           <th colspan="4">상세내용</th>
	                        </tr>
	                        <tr>
	                           <td colspan="4">
	                              <input type="text" name="ecCnt" id="ecCnt" placeholder="내용을 입력해주세요." required style="height:250px;">
	                           </td>
	                        </tr>
						</table><br><br>
					</div>
	            </form>
			</div>
		</div>
		
    </div>

	<!-- The Modal -->
	<div class="modal fade" id="signOffBtn">
		<div class="modal-dialog modal-xl">
		<div class="modal-content">
			
			<!-- Modal Header -->
			<div class="modal-header">
				<h5 class="modal-title">결재선 설정</h5>
			</div>
				
			<c:forEach var="count" items="${ mCount }">
				<input type="hidden" name="memCount" value="${ mCount.memCount }">
			</c:forEach>
			
			<!-- Modal body -->
			<div class="modal-body" style="width:100%; height:100%;">
				<div class="signModalOuter">
					<div class="modal1">
						<c:forEach var="dept" items="${ list }">
							<ul id="dept">${ dept.deptName }(${ dept.count }) <input type="hidden" name=" deptNo" class="deptNo" value="${ dept.deptNo }" ></ul>
						</c:forEach>
					</div>
					<div class="modal2">
						<ul id="selectName"></ul>
					</div>
					<!-- <div class="modal3">
						<button class="btn btn-primary"> > </button>
						<button class="btn btn-primary"> < </button>
					</div> -->
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
						<!-- 결재자 -->
						<div class="modal4_3" id="modal4_3"></div>
						<div>
							<button type="submit" class="btn btn-secondary apply" id="apply" data-dismiss="modal">적용</button>
							<button type="button" class="btn btn-secondary" id="delete" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>    
			</div>
		</div>
		</div>
	</div>

	<!-- 결재선 AJAX용 script -->
    <script type="text/javascript">
    
    	// 클릭된 폼으로 이동하기
	    function moveurl(url) { 
		    location.href = url;
		};
    
	    $(function(){
	    	
	    	// 결재선에서 부서클릭시 해당 부서의 사원명,직급 불러오기
	         $(".modal1>ul").click(function(){
	        	 
	        	 var deptNo = $(this).children(".deptNo").val();
	         	 var json = JSON.parse(deptNo);

	         	 $.ajax({
		                  url:"memberList.ea",
		                  type:"get",
		                  data:{deptNo:deptNo},
		                  success:function(list){
		                	
		                  	var value="";
		                	$.each(list, function(i, obj){
		                		
			                  	value += "<li>"
			                  		  + '<input type="hidden" name="memNo" class="memNo" id="memNo" value="' + obj.memNo + '">'
			                  		  + '<input type="hidden" name="deptName" class="deptName" value="' + obj.deptName +'">'
			                  		  + '<input type="hidden" name="posiName" class="posiName" value="' + obj.posiName +'">'
			                  		  + '<input type="hidden" name="memName" class="memName" value="' + obj.memName +'">'
			                          + obj.memName + "(" + obj.posiName + ")"
			                          + "</li>"
		                	
		                	})
		                	
		                 	$(".modal2 ul").html(value);
		                	
		                  },error:function(){
		                      console.log("실패");
		                  }
		         });
	      	})
	   });
	   
	   // 부서명 클릭시 CSS효과주기
	   $(function(){
			$(".modal1>ul").click(function(){
				$('.modal1>ul').removeClass();
				$(this).addClass('on1');
			})
		});
	
		$(function(){
			$(document).on("click", ".modal2>ul>li", function(){
				
				// 사원명 클릭시 CSS효과주기
				$('.modal2>ul>li').removeClass();
				$(this).addClass('on2');
				
				// 결재자의 memNo, deptName, posiName, memName
				var memNo = $(this).children('input.memNo').val();
				var deptName = $(this).children('input.deptName').val();
				var posiName = $(this).children('input.posiName').val();
				var memName = $(this).children('input.memName').val();
				// name(posi)
				var name = $(this).text(); 
				
				// #modal4_3 안의 자식요소(결재선) 갯수 불러오기 (0부터)
				var ele = document.getElementById('modal4_3');
				var eleCount = ele.childElementCount;

				// 결재선에 네개까지만 들어갈 수 있게 하는 조건문
				if(eleCount < 4){
					$(".modal4_3").append(
										    "<ul>" 
										  + name
										  + '<input type="hidden" class="memNo" value='+ memNo +'>'
										  + '<input type="hidden" class="deptName" value='+ deptName +'>'
										  + '<input type="hidden" class="posiName" value='+ posiName +'>'
										  + '<input type="hidden" class="memName" value='+ memName +'>'
										  + "</ul>"
										 );
				}else{
					alert("추가할 수 있는 결재자가 초과되었습니다.");
				}
				
			});
		});
      
		var arr = new Array();   
			
		$(function(){
		    $("#apply").click(function(){
		      
		      // 선택된 결재자들의 memNo, deptName, posiName, memName을 arr에 담기
		      $("#modal4_3 .memNo").each(function(i,input){
		    	  
		          arr.push({
				             memNo:$(this).val()
				       	   , deptName:$("#modal4_3 .deptName").eq(i).val()
				       	   , posiName:$("#modal4_3 .posiName").eq(i).val()
				       	   , memName:$("#modal4_3 .memName").eq(i).val()
		          		  });
		          
		          // 선택된 결재자들의 memNo, deptName, posiName, memName을 폼에 뿌려주기
		          $("#memNo"+i).val(arr[i].memNo);
		          $("#deptName"+i).val(arr[i].deptName);
		          $("#posiName"+i).val(arr[i].posiName);
		          $("#memName"+i).val(arr[i].memName);
		          
		      });
		    })
		});
		
		$(function(){
			$("#delete").click(function(){
				
				// 취소버튼 클릭시 결재선 비우기
				$(".modal4_3").empty();
				
				// modal1, modal2 css 효과 지우기
				
			})
		});
   	</script>
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>
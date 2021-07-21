<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>expenseForm</title>

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
        
        .outer{width:1000px; height:1200px; margin: auto;}
        
        /* 기본설정 */
        .basicSetting{width:100%; height:50px; border:1px solid lightgray; font-size:13px;}
        .basicSetting .td1{width:20%; text-align: center;}
        .basicSetting .td2{width:20%;}
        .basicSetting .td3{width:30%; text-align: right;}
        .basicSetting .td4{width:30%; text-align: center; font-weight: bolder;}
        
        /* 결재선 */
        .outer .signOff{display: inline-block;}
        .outer .signOff>*{float:left; margin-right:20px;}
        .outer .signOff h6{margin-top: 4px;}
        .outer .signOffBtn{
            border:1px solid lightgray;
            background: white;
            color:royalblue;
            width:80px;
            height:30px;
            font-size:11px;
        }
        .outer .signLine{text-align: center; width:100%; height:280px; font-size:13px;}
        .outer .signLine td{border:1px solid lightgray;}
        .outer .signLine .form-control{text-align:center;}
        .outer .signLine .signTd{width:10%;}
        .outer .signLine .signTd img{height:60px; width:60px;}
        
        /* 지출결의서 작성 */
        .outer .inputTable{width:100%; font-size:15px; font-weight: lighter;}
        .outer .inputTable td,th{border:1px solid lightgray;}
        .outer .inputTable th{width:100px;text-align: center;}
        .outer .inputTable td{ padding:0px 10px 0px 10px;}
        .outer .inputTable textarea{ border:none;}
        .outer .btn-warning{
            background: rgb(155, 89, 182);
            border:none;
            color:white;
            float:right;
            width:80px;
            height:40px;
            font-size: 14px;
        }
        .outer input[type=text]{width:100%; height:35px; border:none; font-size: 14px; background:white;}
        .outer textarea{resize: none; font-size: 14px;}
        
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
	    .signTd{background:white;}
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
		<form class="outer" action="insertExpense.ea" method="post">
                <br><br>
                <button type="submit" class="btn btn-warning" href="">기안하기</button>
                <br><br>
                <!-- 기본설정 -->
                <h6>기본설정</h6>
                <table class="basicSetting">
                    <tr>
                        <td class="td1">문서종류</td>
                        <td class="td2">
                            <div class="form-group">
                                <select class="form-control" name="approvalFormCode url" id="ecCode" style="font-size: 13px;"  onchange="moveurl(this.value);">
                                    <option value="documentEnrollForm.ea?code=PL">기획안</option>
									<option value="documentEnrollForm.ea?code=BC">업무연락</option>
									<option value="offEnrollForm.ea">연차</option>
									<option value="expenseForm.ea" selected>지출결의서</option>
									<option value="documentEnrollForm.ea?code=ME">회람</option>
                                </select>
                                <input type="hidden" name="ecCode" value="EX">
                              </div>
                        </td>
                        <td class="td3">
                        	문서번호
                        	<input type="hidden" name="ecDocName" value="EX-<c:out value="${date}"/>-<c:out value="${randomNo}"/>">
                        </td>
                        <td class="td4">EX-<c:out value="${date}"/>-<c:out value="${randomNo}"/></td>
                    </tr>
                </table>
                <br><br>

                <!-- 결재선 -->
                <div class="signOff">
                    <h6>결재선</h6>
                    <a type="button" class="btn btn-primary signOffBtn" data-toggle="modal" data-target="#signOffBtn">결재선설정</a>
                </div>
                <table class="signLine">
                    <tr height="15%;">
                        <td rowspan="6" style="width:5%; font-weight: bold;">기안자</td>
                        <td>
                        	<input type="text" class="form-control" name="deptName" value="${ loginUser.deptName }" readonly>
                       		<input type="hidden" name="memNo" value="${ loginUser.memNo }">
                        </td>
                        <td rowspan="6" style="width:5%; font-weight: bold;">결재자</td>
                        <td class="signTd dept0"></td>
                        <td class="signTd dept1"></td>
                        <td class="signTd dept2"></td>
                        <td class="signTd dept3"></td>
                    </tr>
                    <tr height="15%;">
                        <td>${ loginUser.posiName }</td>
                        <td class="posi0"></td>
                        <td class="posi1"></td>
                        <td class="posi2"></td>
                        <td class="posi3"></td>
                    </tr>
                    <tr height="40%;">
                        <td class="signTd"><img src="resources/elecApprovalUpfiles/check1.png"></td>
                        <td class="signTd turn0"></td>
                        <td class="signTd turn1"></td>
                        <td class="signTd turn2"></td>
                        <td class="signTd turn3"></td>
                    </tr>
                    <tr height="15%;">
                        <td><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></td>
                       	<td class="mno0"></td>
                       	<td class="mno1"></td>
                       	<td class="mno2"></td>
                       	<td class="mno3"></td>
                    </tr>
                    <tr height="15%;">
                        <td style="color:royalblue;">${ loginUser.memName }</td>
                        <td class="name0"></td>
                        <td class="name1"></td>
                        <td class="name2"></td>
                        <td class="name3"></td>
                    </tr>
                </table>
                <br><br>

                <!-- 지출결의서 작성 -->
                <h6>상세입력</h6>
                <table class="inputTable">
                    <tr height="40">
                        <th>제목</th>
                        <td><input type="text" name="ecTitle" class="form-control" required></td>
                    </tr>
                    <tr height="40">
                        <th>구분</th>
                        <td>
                            <input type="radio" name="exStatus" value="개인"> 개인 &nbsp;
                            <input type="radio" name="exStatus" value="법인"> 법인
                        </td>
                    </tr>
                    <tr height="40">
                        <th>지출 일자</th>
                        <td><input type="text" name="month" value=""></td>
                    </tr>
                    <tr height="40">
                        <th>지출자</th>
                        <td>
                        	<input type="text" class="form-control" name="exWriter" value="${ loginUser.memName }" required>
                        	<input type="hidden" class="form-control" name="ecWriter" value="${ loginUser.memName }" required>
                        </td>
                    </tr>
                    <tr height="40">
                        <th>계좌 정보</th>
                        <td><input type="text" name="account" class="form-control" required></td>
                    </tr>
                    <tr>
                        <th>지출 내용</th>
                        <td>
                            <div class="form-group"><textarea class="form-control" name="ecCnt" rows="15" id="comment" required></textarea></div>
                        </td>
                    </tr>
                </table>
                <br>
            </form>

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
		      
		      // 선택된 결재자들의 memNo, deptName, posiName, memName을 arr에 담아서 폼에 뿌리기
		      $("#modal4_3 .memNo").each(function(i,input){
		    	  
		          arr.push({
				             memNo:$(this).val()
				       	   , deptName:$("#modal4_3 .deptName").eq(i).val()
				       	   , posiName:$("#modal4_3 .posiName").eq(i).val()
				       	   , memName:$("#modal4_3 .memName").eq(i).val()
		          		  });
		          
		    	   $(".dept"+i).append('<input tpye="text" class="form-control" id="deptName" value='+ arr[i].deptName +' readonly>');
		    	   $(".posi"+i).append('<input type="text" class="form-control" id="posiName" value='+ arr[i].posiName +' readonly>');
		    	   $(".name"+i).append('<input type="text" class="form-control" id="memName" value='+ arr[i].memName +' readonly>');
		    	   $(".mno"+i).append('<input type="hidden" name="ApprovalPathList['+ i +'].memNo" value='+ arr[i].memNo +'>');
		    	   $(".turn"+i).append('<input type="hidden" name="ApprovalPathList[' + i + '].ecTurn" value="'+(i + 1)+'">');
		    	   
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

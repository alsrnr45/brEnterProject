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

<!-- 부트스트랩4 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
       /* 폰트 */
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
        * {font-family: 'Noto Sans KR', sans-serif;}
        
        .outer{width:1000px; height:100%; margin: auto;}
        
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
        .outer .signLine .signTd{width:10%;}
        
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
        .outer input[type=text]{width:100%; height:35px; border:none; font-size: 14px;}
        .outer textarea{resize: none; font-size: 14px;}
        
        /* 결재선 모달 */
        .signModalOuter{ margin:auto; text-align: center; width:1000px; height:500px;}
        .signModalOuter ul{list-style:none; padding-left:0px; height:30px; padding-top:3px;}
        .signModalOuter ul:hover{cursor:pointer; background: rgb(170, 218, 248); padding-top:3px;}
        .signModalOuter .btn{background:lightslategrey; color:white; border:none; margin-top:10px;}
        .modal1, .modal2, .modal3, .modal4{float:left; height:430px; margin: 30px 5px 0px 5px; }
        .modal1, .modal2{border:1px solid lightgray; padding: 20px; overflow:scroll;}
        .modal1, .modal2, .modal4{width:30%;}
        .modal3{width:5%; padding-top:160px;}
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
        .modal4_3{ height:47%; border:1px solid lightgray; text-align: center; padding: 20px;}
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
		<form class="outer">
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
                                <select class="form-control" style="font-size: 13px;">
                                    <option value="documentEnrollForm.ea">기획안</option>
                                    <option value="documentEnrollForm.ea">업무연락</option>
                                    <option value="offEnrollForm.ea">연차</option>
                                    <option value="expenseForm.ea" selected>지출결의서</option>
                                    <option value="documentEnrollForm.ea">회람</option>
                                </select>
                              </div>
                        </td>
                        <td class="td3">문서번호</td>
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
                        <td>개발팀</td>
                        <td rowspan="6" style="width:5%; font-weight: bold;">결재자</td>
                        <td>개발팀</td>
                        <td>개발팀</td>
                        <td>개발팀</td>
                        <td>개발팀</td>
                    </tr>
                    <tr height="15%;">
                        <td>사원</td>
                        <td>대리</td>
                        <td>과장</td>
                        <td>차장</td>
                        <td>부장</td>
                    </tr>
                    <tr height="40%;">
                        <td class="signTd">싸인싸인</td>
                        <td class="signTd"></td>
                        <td class="signTd"></td>
                        <td class="signTd"></td>
                        <td class="signTd"></td>
                    </tr>
                    <tr height="15%;">
                        <td>2021-06-01</td>
                        <td>2021-06-01</td>
                        <td>2021-06-01</td>
                        <td>2021-06-02</td>
                        <td>2021-06-02</td>
                    </tr>
                    <tr height="15%;">
                        <td style="color:royalblue;">안소은</td>
                        <td>김대리</td>
                        <td>김과장</td>
                        <td>김차장</td>
                        <td>김부장</td>
                    </tr>
                </table>
                <br><br>

                <!-- 지출결의서 작성 -->
                <h6>상세입력</h6>
                <table class="inputTable">
                    <tr height="40">
                        <th>제목</th>
                        <td><input type="text" class="form-control form-control"></td>
                    </tr>
                    <tr height="40">
                        <th>구분</th>
                        <td>
                            <input type="radio" name="sortation" selected> 개인 &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="sortation"> 법인
                        </td>
                    </tr>
                    <tr height="40">
                        <th>회계 기준월</th>
                        <td>
                            <p style="float:left; margin: 8px 10px 0px 0px;">2021년</p>
                            <select class="form-control" id="" style="float:left; width:50px;">
                                <option value="Jan">1</option>
                                <option value="Feb">2</option>
                                <option value="Mar">3</option>
                                <option value="Apr">4</option>
                                <option value="May">5</option>
                                <option value="JUN">6</option>
                                <option value="Jul">7</option>
                                <option value="Aug">8</option>
                                <option value="Sep">9</option>
                                <option value="Oct">10</option>
                                <option value="Nov">11</option>
                                <option value="Dec">12</option>
                            </select>
                            <p style="float:left; margin: 8px 0px 0px 10px;">월</p>
                        </td>
                    </tr>
                    <tr height="40">
                        <th>지출자</th>
                        <td><input type="text" class="form-control form-control"></td>
                    </tr>
                    <tr height="40">
                        <th>계좌 정보</th>
                        <td><input type="text" class="form-control form-control"></td>
                    </tr>
                    <tr>
                        <th>지출 내용</th>
                        <td>
                            <div class="form-group">
                                <textarea class="form-control" rows="15" id="comment"></textarea>
                            </div>
                        </td>
                    </tr>
                </table>
                <br>
            </form>

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
                                			<ul onclick="dept();">${ dept.deptName }(${ mList.mem_count })</ul>
                                    </c:forEach>
                                </div>
                                <div class="modal2">
                                	<c:forEach var="mem" items="${ mlist }">
                                    	<ul onclick="deptName();">${ mem.memName }(${ mem.posiName })</ul>
                                    </c:forEach>
                                </div>
                                <div class="modal3">
                                    <button class="btn btn-primary"> > </button>
                                    <button class="btn btn-primary"> < </button>
                                </div>
                                <div class="modal4" align="left">
                                    <div style="margin-bottom:5px;"><b>기안자</b></div>
                                    <div class="modal4_1">
                                        <p>안소은</p>
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
                                        <ul>최선희(팀장)</ul>
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
                        /*
                        <!-- 결재선 ajax 
                        <script type="text/javascript">
                        	function deptName(){
                                $.ajax({
                                    url:"memberList.ea",
                                    data:{memNo : ${mem.memNo}},
                                    success:function(memNo){
                                        alert(memNo);
                                    },error:function(){
                                        console.log("실패");
                                    }
                                });
                            }
                        </script>
                        -->
                        
                    </div>
                    </div>
                </div>
                </form>
            <br><br><br>
        </div>
    </div>
	
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

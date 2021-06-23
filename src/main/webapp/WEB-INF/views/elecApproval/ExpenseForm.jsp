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

<!-- 부트스트랩4 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- JSTREE 스크립트-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

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
	
	/* 컨텐츠 */
    .outer{width:1000px; height:100%; margin: auto;}
    /* 기본설정 */
    .basicSetting{
        width:100%;
        height:50px;
        border:1px solid lightgray;
        font-size:13px;
    }
    .basicSetting .td1{width:20%; text-align: center;}
    .basicSetting .td2{width:20%;}
    .basicSetting .td3{ width:30%;text-align: right;}
    .basicSetting .td4{
        width:30%;
        text-align: center;
        font-weight: bolder;
    }
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
    .outer .signLine{
        text-align: center;
        width:100%;
        height:240px;
        font-size:13px;
    }
    .outer .signLine td{border:1px solid lightgray;}
    .outer .signLine .signTd{height:40%; width:18%;}
    /* 지출결의서 작성 */
    .outer .inputTable{
        width:100%;
        font-size:15px;
        font-weight: lighter;
    }
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
            <form class="outer">
                <br><br>
                <button type="submit" class="btn btn-warning">기안하기</button>
                <br><br>
                <!-- 기본설정 -->
                <h6>기본설정</h6>
                <table class="basicSetting">
                    <tr>
                        <td class="td1">문서종류</td>
                        <td class="td2">
                            <div class="form-group">
                                <select class="form-control" style="font-size: 13px;">
                                    <option value="X">선택</option>
                                    <option value="PL">기획안</option>
                                    <option value="BC">업무연락</option>
                                    <option value="OF">연차</option>
                                    <option value="EX" selected>지출결의서</option>
                                    <option value="ME">회람</option>
                                </select>
                              </div>
                        </td>
                        <td class="td3">문서번호</td>
                        <td class="td4">EX-20210618-86328</td>
                    </tr>
                </table>
                <br><br>

               <!-- 결재선 -->
               <div class="signOff">
                    <h6>결재선</h6>
                    <a type="submit" class="btn btn-primary signOffBtn" data-toggle="modal" data-target="#signOffBtn">결재선설정</a>
                </div>
                <table class="signLine">
                    <tr>
                        <td rowspan="5" style="width:10%;">기안자</td>
                        <td>개발팀</td>
                        <td rowspan="5" style="width:10%;">결재자</td>
                        <td>개발팀</td>
                        <td>개발팀</td>
                        <td>개발팀</td>
                    </tr>
                    <tr>
                        <td>사원</td>
                        <td>팀장</td>
                        <td>부장</td>
                        <td>대표</td>
                    </tr>
                    <tr>
                        <td class="signTd">싸인싸인</td>
                        <td class="signTd"></td>
                        <td class="signTd"></td>
                        <td class="signTd"></td>
                    </tr>
                    <tr>
                        <td>2021-06-01</td>
                        <td>2021-06-01</td>
                        <td>2021-06-01</td>
                        <td>2021-06-02</td>
                    </tr>
                    <tr>
                        <td style="color:royalblue;">안소은</td>
                        <td>김팀장</td>
                        <td>김부장</td>
                        <td>김대표</td>
                    </tr>
                </table>
                <br><br>

                <!-- The Modal -->
                <div class="modal fade" id="signOffBtn">
                    <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                    
                        <!-- Modal Header -->
                        <div class="modal-header">
                        <h4 class="modal-title">Modal Heading</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        
                        <!-- Modal body -->
                        <div class="modal-body">
                        Modal body..
                        </div>
                        
                        <!-- Modal footer -->
                        <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                        
                    </div>
                    </div>
                </div>
  

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
            <br><br><br>
        </div>
    </div>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

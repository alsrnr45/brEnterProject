<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BR-Main</title>

<!-- 부트스트랩 탬플릿 -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/homeMain.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>

</style>

</head>
<body class="sb-nav-fixed">
   <!-- 상단바 -->
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<jsp:include page="userHeader.jsp"/>
    </nav>
    
    <div id="layoutSidenav">
        <!-- 메뉴바 -->
        <div id="layoutSidenav_nav">
            <jsp:include page="userMenu.jsp"/>
        </div>
        <!--컨텐츠-->
    	<div id="layoutSidenav_content">
        	 <main style="display: flex;">
                <!--컨텐츠: left-->
                <div class="container-fluid px-4 leftBox" style="width: 30%;">
                    <!--근태박스-->
                   	  <div class="row"> 
                            <div class="col-xl-6 " style="width: 500px; height: 600px;">
                                <div class="card mb-4 lefRow" style="height: 550px;">
                                    <div class="card-header">
                                        <div>
										<i class="fas fa-clock"></i>
                                        	<span>00월00일 </span>
                                        	<span style="margin-left:35%; text-align:right;">00:00:00</span> <!-- *js date함수적용하기 -->
                                        </div>	
                                    </div>
                                    
                                    <!-- 프로필및 근태관리 -->
                                    <div class="card-body" style="text-align: left;">
                                       <div class="parent 상부 " style="height: 200px;" >
                                         <div class="child 프로필사진" style=" " >
	                                       	 <div style="text-align: center;">
	                                       	  <img class="circleBase type1" src="${ loginUser.profile}"> 
	                                       	 </div>
                                         </div>
                                         <div class="child myProfileBox"  style=" margin-left:15px;">
                                  	        <div class="name"style="height: 40%; padding-left:10px;">
                                  	        	<div class="myName" style=" padding-top:50px; font-size:1.2em; font-weight:bold; ">
	                                  	        ${ loginUser.memName }
	                                  	        	
                                  	        	</div>
                                  	        </div>
                                  	        <div class="myInfo" style=" height: 60%; margin-top:10px; padding-left:10px; font-size:0.9em; color:#474747;">
	                                  	        <div class="직급">직급: ${ loginUser.posiName }</div>
	                                  	        <div class="부서">부서: ${ loginUser.deptName }</div>
                                  	        </div>
                                         </div>
                                       </div>
                                    <hr class="dropdown-divider" />
                                       <div class="parent time1 하부1(시간)">
                                            <div class="child punctuality" style="flex-basis:30%;" >
                                                <div>출근 시간</div>
                                                <div>퇴근 시간</div>
                                            </div>
                                            <div class="child punctuality" style="flex-basis:80%;" >
                                              <div style="text-align:right;"> 
                                                <div>(예)09:00:02</div>
                                                <div>(예)18:00:00</div>
                                              </div>
                                            </div>
									   </div>
						    		<hr class="dropdown-divider" />
						 			   <div class="time2 하부2(근무상태)">
                                           <div class="status">
                                             <select style="width: 100%; height: 50px;">
	                                                  <option value="">근무중</option>
	                                                  <option value="">외출중</option>
	                                                  <option value="">회의중</option>
                                              </select>
                                            </div>
                                       </div>                                    
                                       <div class="time3 하부3(버튼)">
                                         <div class="onOff" style="margin-bottom:;" >
                                            <div class="buttons"  >
                                                <button id="on"> 출근 </button>
                                                <button id="off"> 퇴근 </button>
                                            </div>
                                        </div>
                                       </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    <!--api박스-->
                        <div class="row"> 
                            <div class="col-xl-6" >
                                <div class="card mb-4"  style="height: 600px;">
                                    <div class="card-header">
                                        <i class="fas fa-calendar-alt"></i>
                                      	  CALENDER
                                    </div>
        <!-- *진행중!! -->          
        						   	<jsp:include page="ybCalender.jsp"/>
                                    	
                                   
                                </div>
                            </div>
                        </div>
                </div>
                <!--컨텐츠: right-->
                <div class="container-fluid px-4 rightBox" >
                    <!--컴백슬라이드 부분표시-->
                    <div class="row" >
                        <div class="col-xl-3 col-md-6" style="width: 100% !important;">
                            <div class="card bg-primary text-white mb-4">
                                <div class="card-body">컴백이미지 공간</div>
                                <div class="card-footer d-flex align-items-center">
                              
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--게시판 미리보기-->
                    
                    <!--게시판1-->
                    <div class="card mb-4" style="height: 400px;"> <!--카드박스 세로크기 조정부분-->
                        <div class="card-header">
                            <i class="fas fa-bullhorn"></i>
                            NOTICE
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성일</th>
                                        <th>조회수</th>
                                        <th>Start date</th>
                                        <th>Salary</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Name</th>
                                        <th>Position</th>
                                        <th>Office</th>
                                        <th>Age</th>
                                        <th>Start date</th>
                                        <th>Salary</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <tr>
                                        <td>Tiger Nixon</td>
                                        <td>System Architect</td>
                                        <td>Edinburgh</td>
                                        <td>61</td>
                                        <td>2011/04/25</td>
                                        <td>$320,800</td>
                                    </tr>
                                    <tr>
                                        <td>Garrett Winters</td>
                                        <td>Accountant</td>
                                        <td>Tokyo</td>
                                        <td>63</td>
                                        <td>2011/07/25</td>
                                        <td>$170,750</td>
                                    </tr>
                                    <tr>
                                        <td>Ashton Cox</td>
                                        <td>Junior Technical Author</td>
                                        <td>San Francisco</td>
                                        <td>66</td>
                                        <td>2009/01/12</td>
                                        <td>$86,000</td>
                                    </tr>
                                    <tr>
                                        <td>Cedric Kelly</td>
                                        <td>Senior Javascript Developer</td>
                                        <td>Edinburgh</td>
                                        <td>22</td>
                                        <td>2012/03/29</td>
                                        <td>$433,060</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--게시판2-->
                    <div class="card mb-4" style="height: 400px;"> <!--카드박스 세로크기 조정부분-->
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            NOTICE
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성일</th>
                                        <th>조회수</th>
                                        <th>Start date</th>
                                        <th>Salary</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Name</th>
                                        <th>Position</th>
                                        <th>Office</th>
                                        <th>Age</th>
                                        <th>Start date</th>
                                        <th>Salary</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <tr>
                                        <td>Tiger Nixon</td>
                                        <td>System Architect</td>
                                        <td>Edinburgh</td>
                                        <td>61</td>
                                        <td>2011/04/25</td>
                                        <td>$320,800</td>
                                    </tr>
                                    <tr>
                                        <td>Garrett Winters</td>
                                        <td>Accountant</td>
                                        <td>Tokyo</td>
                                        <td>63</td>
                                        <td>2011/07/25</td>
                                        <td>$170,750</td>
                                    </tr>
                                    <tr>
                                        <td>Ashton Cox</td>
                                        <td>Junior Technical Author</td>
                                        <td>San Francisco</td>
                                        <td>66</td>
                                        <td>2009/01/12</td>
                                        <td>$86,000</td>
                                    </tr>
                                    <tr>
                                        <td>Cedric Kelly</td>
                                        <td>Senior Javascript Developer</td>
                                        <td>Edinburgh</td>
                                        <td>22</td>
                                        <td>2012/03/29</td>
                                        <td>$433,060</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
            <br><br><br><br><br><br><br>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Your Website 2021</div>
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
   		</div>
    </div>
  

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>

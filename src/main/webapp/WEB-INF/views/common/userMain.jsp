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

<!-- CB slide image -->
<link href="resources/css/comebackSlide.css" rel="stylesheet" />
<link href="resources/css/comebackSlide2.css" rel="stylesheet" />


<style>
    .attendOuter{margin:auto; height:480px; width:300px;  border:1px solid lightgray; margin-bottom:23px;}
    .attendOuter .date{height:50px; text-align: center; padding-top:10px; background: rgb(241, 241, 241);}
    .attendOuter .profile{height:400px; margin-top:30px;}
    .attendOuter .profile .member{height:130px; width:100%; margin:0px 0px 30px 0px;}
    .attendOuter .profile .member .image .img{height:100%; width:130px; float:left;}
    .attendOuter .profile .member .info{height:100%; width:50%; float:right;}
    .attendOuter .profile .member .info .memName{font-size: 25px; font-weight: bold; text-align: center; padding-top:20px; margin-bottom: 5px;}
    .attendOuter .profile .member .info .deptName,.posiName{ text-align: left; padding-left:25px;}
    
    .attendOuter .profile .workTime{text-align: center; padding: 10px 0 10px 0;}
    .attendOuter .profile .workTime .start,.end{font-size: 20px;}
    .attendOuter .profile .workTime .left{margin-right:70px;}

    .attendOuter .buttons{height:100px; width:100%; margin: 20px 0 0 0;}
    .attendOuter .buttons .checkIn{background:rgb(255, 244, 126); border:none; height:50px; width:100%; margin-bottom: 10px;}
    .attendOuter .buttons .checkOut{background:rgb(212, 212, 212); border:none; height:50px; width:100%;}
    /* .attendOuter .cal {margin-top: 500px;} */
</style>

</head>
<body class="sb-nav-fixed" >
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
                   	<div class="attendOuter row"> 

                        <!-- 현재시간 -->
                        <div class="date">
                            <span id="dpTime"></span>
                        </div>   

                        <!-- 프로필및 근태관리 -->
                        <div class="profile">
                            <!-- 사원정보 -->
                            <div class="member">
                                <div class="image">
                                    <img class="circleBase img" src="${ loginUser.profile }">
                                </div>
                                <div class="info">
                                    <div class="memName">${ loginUser.memName }</div>
                                    <div class="deptName">부서 : ${ loginUser.deptName }</div>
                                    <div class="posiName">직급 : ${ loginUser.posiName }</div>
                                </div>
                            </div>
                            
                            <hr class="dropdown-divider" />

                            <!-- 출퇴근 시간 -->
                            <div class="workTime">
                                <div class="work1">
                                    <span class="left">출근</span>
                                    <span>09 : 00</span>
                                </div>
                                <div class="work2">
                                    <span class="left">퇴근</span>
                                    <span>18 : 00</span>
                                </div>
                            </div>

                            <hr class="dropdown-divider" />  
                            
                            <!-- 출퇴근 버튼 -->
                            <div class="buttons">
                                <button class="btn btn-primary checkIn" id="checkIn">출근하기</button>
                                <button class="btn btn-primary checkOut" id="checkOut">퇴근하기</button>
                            </div>
                        </div>
                        
                    </div>
                    <!-- 캘린더 api-->
                    <div class="cal">
                        <jsp:include page="ybCalender.jsp"/>
                    </div>
                </div>

                <!--컨텐츠: right-->
                <div class="container-fluid px-4 rightBox" >
                    <!--컴백슬라이드 부분표시-->
                    <div class="row" >
                        <div class="col-xl-3 col-md-6  " style="width: 100% !important;">
                            <div class="card bg-primary blue text-white mb-4">
                                <!--<div class="card-body">-->
								<div class="section">
									<input type="radio" name="slide" id="slide01" checked>
									<input type="radio" name="slide" id="slide02">
									<input type="radio" name="slide" id="slide03">
									<div class="slidewrap">
										
										<ul class="slidelist">
											<!-- 슬라이드 영역 -->
											<li class="slideitem">
												<a>
													<div class="textbox">
														<h3>첫번째 슬라이드</h3>
														<p>첫번째 슬라이드 입니다.</p>
													</div>
													<img src="resources/comebackUpfiles/comeback_IU.png">
												</a>
											</li>
											<li class="slideitem">
												<a>
													
													<div class="textbox">
														<h3>두번째 슬라이드</h3>
														<p>두번째 슬라이드 입니다.</p>
													</div>
													<img src="resources/comebackUpfiles/comeback_bts.png">

												</a>
											</li>
											<li class="slideitem">
												<a>
													
													<div class="textbox">
														<h3>두번째 슬라이드</h3>
														<p>두번째 슬라이드 입니다.</p>
													</div>
													<img src="resources/comebackUpfiles/comeback_blackpink.png">

												</a>
											</li class="slideitem">
								
											<!-- 좌,우 슬라이드 버튼 -->
											<div class="slide-control">
												<div>
													<label for="slide03" class="left"></label>
													<label for="slide02" class="right"></label>
												</div>
												<div>
													<label for="slide01" class="left"></label>
													<label for="slide03" class="right"></label>
												</div>
												<div>
													<label for="slide02" class="left"></label>
													<label for="slide01" class="right"></label>
												</div>
											</div>
								
										</ul>
										<!-- 페이징 -->
										<ul class="slide-pagelist">
											<li><label for="slide01"></label></li>
											<li><label for="slide02"></label></li>
											<li><label for="slide03"></label></li>
										</ul>
									</div>
									
								</div>	              
	              
	              
                                <!--</div>-->
                                
                                
                                <!-- footer -->
                                <div class="card-footer d-flex align-items-center">
                                </div>
                            </div>
                        </div>
                    </div>

                    
                   <!--게시판 미리보기-->                   
                    <!--게시판1 : 전자결재 기안함리스트 -->
                    <div class="card mb-4" style="height: 590px;"> <!--카드박스 세로크기 조정부분 (높이 755로) -->
                        <div class="card-header">
                            <i class="far fa-clipboard"></i>&nbsp; 
                            Electronic Approval 
                        </div>
                        <div class="card-body">
	                               
	                    	<table id="datatablesSimple" class="approvalTotalList">
	                        	<thead>
	                            	<tr>
	                                	<th style="text-align:center;">문서번호</th>
	                                    <th style="text-align:center;">문서종류</th>
	                                    <th style="text-align:center;">제목</th>
	                                    <th style="text-align:center;">기안자</th>
	                                    <th style="text-align:center;">결재상태</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            	<!-- 로그인한 유저가 올린 문서만 보이도록 조건 처리 -->                                       
	                                	<c:forEach var="ea" items="${ list }">
	                                    	<c:if test="${ loginUser.memName eq ea.ecWriter }">							
		                                    	<tr>                             	   
		                                       		<td>${ ea.ecDocName }<input type="hidden" class="eano" value="${ ea.ecDocNo }"></td>                                      	   	   
		                                       	       	                                       	      	                                     	       
		                                       	    <!-- 문서 코드에 따른 조건 처리 -->
		                                       	    <td>
		                                       	    	<input id="ecCode" type="hidden" value="${ ea.ecCode }">
		                                       	       	<c:choose>
		                                       	       		<c:when test="${ ea.ecCode eq 'PL' }">
		                                       	       			기획안
		                                       	       		</c:when>
		                                       	       		<c:when test="${ ea.ecCode eq 'BC' }">
		                                       	       			업무연락
		                                       	       		</c:when>
		                                       	       		<c:when test="${ ea.ecCode eq 'OF' }">
		                                       	       			연차
		                                       	       		</c:when>
		                                       	       		<c:when test="${ ea.ecCode eq 'EX' }">
		                                       	       			지출결의서
		                                       	       		</c:when>
		                                       	       		<c:otherwise>
		                                       	       			회람 
		                                       	       		</c:otherwise>
		                                       	       </c:choose>
		                                       	    </td>
		                                       	        
		                                       	    <td>${ ea.ecTitle }</td>
		                                       	    <td>${ ea.ecWriter }<input type="hidden" id="mno" value="${ loginUser.memNo }"></td>

		                                       	       
		                                       	    <!-- 결재대기인 경우에만 글자색 빨간색으로 변경할 것 -->
		                                       	    <td>
		                                       	    	<c:choose>	             
			                                       	    	<c:when test="${ empty ea.ecCanceldate && empty ea.ecCompdate }">
								                           		<font color="red">결재대기</font>
								                           	</c:when>
								                           	<c:when test="${ !empty ea.ecCanceldate && !empty ea.ecCompdate }">
								                           		반려  		
								                           	</c:when>
								                           	<c:when test="${ empty ea.ecCanceldate && !empty ea.ecCompdate }">
								                           	   	결재완료
								                           	</c:when>
							                           	</c:choose>
		                                       	   </td>
		                                       </tr>
	                                       </c:if>	
	                                    </c:forEach>
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
    <script src="resources/js/clock.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>
a<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>BR-Main</title>
        <!-- 부트스트랩  -->
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    
        <!-- jQuery 라이브러리 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <style>
            /* 폰트 */
            @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
            * {font-family: 'Noto Sans KR', sans-serif;}

		.sb-nav-fixed #layoutSidenav #layoutSidenav_content {
		      padding-left: 130px;
		      top: 40px;
		   }

            .card-body{
               height: 250px;
           }
           .leftBox{
               width: 100%;
           }
           .rightBox{
               width: 80%;
           }
           .leftRow{
               width: 100%;
               height: 100%;
           }
           .col-xl-6{
               width: 500px;
           }
           .parent {
                display: flex;
            }
            .child {
                flex: 1;
            }
            .time{
                margin-top: 50px;
                margin-bottom: 50px;
            }
            .status{
                margin-top: 20px;
            }
            #on{
                width: 30%; height: 50px !important;
                margin-right: 10px;
                border-radius: 5px;
                border: none;
                cursor: pointer;
                background-color: #9b59b6;
                color: white;
            }
            #off{
                width: 30%; height: 50px !important;
                border-radius: 5px;
                border: none;
                cursor: pointer;
                background-color: #c9c4c4;
            }
            #on:hover{background-color: #cf9ae4}
            #off:hover{background-color: #e0e0e0}
    
            /*테이블*/

            h1{margin-bottom: 20px;}
            table{ text-align: center; margin: auto;}
            .noticeList>tbody>tr:hover{cursor:pointer;}
            .card-header>.btn{float:right;}

        </style>

</head>
<body class="sb-nav-fixed" >
        <!--main 컨텐츠-->
        <div id="layoutSidenav_content">
            <main style="display: flex;">
                <!--컨텐츠: left-->
                <div class="container-fluid px-4 leftBox" style="width: 30%;">
                    <!--근태박스-->
                        <div class="row"> 
                            <div class="col-xl-6 " style="width: 500px; height: 650px;">
                                <div class="card mb-4 lefRow" style="height: 600px;">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        	근태관리 상단 -> 현재시간 표시부분
                                    </div>
                                    <div class="card-body" style="text-align: center;">
                                       <div class="parent 상부" style="height: 200px;" >
                                           <div class="child 프로필" style=" background-color: aqua;" >
                                          	   수정예정
                                           </div>
                                           <div class="child 사원정보">
                                    	        수정예정
                                           </div>
                                       </div>
                                       <hr class="dropdown-divider" />
                                       <div class="time 하부1(시간)">
                                            <div class=" inAndOut" style="margin: 30px align=center;" >
                                                <div>출근 시간: ***********
                                                </div>
                                                <div>퇴근 시간: ************
                                                </div>
                                            </div>
                                            <div class="status">
                                                <select style="width: 70%; height: 50px;">
                                                    <option value="">근무중</option>
                                                    <option value="">외출중</option>
                                                     <option value="">회의중</option>
                                                </select>
                                            </div>
                                       </div>
                                       <div class="timeBtn 하부2(버튼)">
                                        <div class="onOff" style="margin-bottom: 10%;" >
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
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        코로나 api 혹은 달력api
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
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
        
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>
</html>
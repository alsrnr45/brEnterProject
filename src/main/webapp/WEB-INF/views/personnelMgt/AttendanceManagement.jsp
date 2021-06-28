<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>UserMenu</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
        /* 폰트 */
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
        * {font-family: 'Noto Sans KR', sans-serif;}
        .outer{
            margin:auto;
            height:800px;
        }
        .outer .firstLine{
            margin:auto;
            width:100%;
            height:400px;
        }
        .outer .firstLine .workTitle{
            width:100%;
            display: inline-block;
            margin-left:10px;
        }
        .outer .firstLine .workTitle>*{
            width:300px;
            float:left;
            text-align: left;
            margin-right:20px;
            margin-left:20px;
        }
        .outer .firstLine>div{
            margin:auto;
            border:1px solid lightgray;
            border-radius: 10px;
            float:left;
            width:300px;
            height:300px;
            text-align: center;
            margin-right:20px;
            margin-left:22px;
        }
        /* 근무계획 */
        .outer .firstLine .first{
            padding-top:40px;
        }
        .outer .firstLine .first .caleander{
            width:140px;
            height:140px;
            border-radius:10px;
            margin:auto;
            padding:10px;
            background-color: rgb(245, 238, 248);
        }
        .outer .caleander .day{
            background-color: white;
        }
        /* 근무체크 */
        .outer .firstLine .second{
            padding-top:40px;
        }
        .outer .firstLine .second .btn{
            width:250px;
            height:60px;
            margin-bottom:10px;
            background: rgb(245, 238, 248);
            color:gray;
            border: none;
        }
        /* 근무현황 */
        .outer .firstLine .third{
            color:royalblue;
        }
        .outer .firstLine .third .btn{
            width:100%;
            height:60px;
            margin-bottom:13px;
            background: rgb(245, 238, 248);
            color:black;
            border:none;
        }
        /* 근무시간 */
        .outer .secondLine .average{
            border:1px solid lightgray;
            border-radius: 10px;
            margin:auto;
            width:1000px;
            height:100px;
        }
        .outer .secondLine .average > div{
            margin-left:20px;
        }
        .outer .secondLine .average>*{
            text-align: center;
            float:left;
            width:300px;
            margin:10px;
            padding:15px;
        }
        .outer .secondLine .average .number{
            color:royalblue;
        }
    </style>
</head>
<body class="sb-nav-fixed">
    <!-- 상단바 -->
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="index.html" style="width: 225px;">
   
              <img src="resources/images/비알로고.png" style="height: 56px;"></a>
      
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <!-- Navbar-->
    
        <div style="width:100%;" align="right">
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4" style="flex-direction: column;"> <!--flex를 column 설정값으로 바꿈-->
                <li class="nav-item dropdown" style="justify-content: space-between;"> 
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">사원명</a></li>
                        <li><a class="dropdown-item" href="#!" style="font-size: 13px;">이메일</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        
                        <!--logout-->
                        <div class="dropmenu">
                          <button class="logout mymenu" >Logout</button><button class="mypage mymenu">MYPAGE</button>
                        <!--<li><a class="dropdown-item" href="#!">Logout</a></li> *dropdown-item 사용시 한칸 전부사용됨-->
                        </div>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    
    <div id="layoutSidenav">
        
        <!-- 메뉴바 -->
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">

                        <!-- 메일 --><br>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#mail" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="far fa-envelope"></i></div>
                            메일
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="mail" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="#">전체 메일</a>
                                <a class="nav-link" href="#">받은 메일함</a>
                                <a class="nav-link" href="#">보낸 메일함</a>
                                <a class="nav-link" href="#">임시 보관함</a>
                                <a class="nav-link" href="#">휴지통</a>
                            </nav>
                        </div>

                        <!-- 주소록 -->
                        <a class="nav-link" href="#">
                            <div class="sb-nav-link-icon"><i class="far fa-address-book"></i></div>
                            주소록
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                        </a>

                        <!-- 일정관리 -->
                        <a class="nav-link" href="#">
                            <div class="sb-nav-link-icon"><i class="fas fa-calendar-alt"></i></div>
                            &nbsp;일정관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                        </a>

                        <!-- 회의실 -->
                        <a class="nav-link" href="#">
                            <div class="sb-nav-link-icon"><i class="fas fa-handshake"></i></div>
                            회의실
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                        </a>

                        <!-- 전자결재 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#electronicApproval" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="far fa-clipboard"></i></div>
                            &nbsp;전자결재
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="electronicApproval" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="#">문서함</a>
                                <a class="nav-link" href="#">진행중인 문서</a>     
                            </nav>
                        </div>
                        
                        <!-- 인사관리 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#personnelManagement" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                            인사관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="personnelManagement" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="#">근태관리</a>
                                <a class="nav-link" href="#">근무현황</a>
                                <a class="nav-link" href="#">연차</a>
                            </nav>
                        </div>            

                        <!-- 게시판 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#board" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-chalkboard"></i></div>
                            게시판
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="board" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="#">경조사</a>
                                <a class="nav-link" href="#">주간식단</a>
                                <a class="nav-link" href="#">자유게시판</a>
                            </nav>
                        </div>
                        
                        <!-- BR엔터소식 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#brEnterNotice" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-bullhorn"></i></div>
                            BR엔터소식
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="brEnterNotice" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="#">Notice</a>
                                <a class="nav-link" href="#">Artists</a>
                                <a class="nav-link" href="#">News</a>
                                <a class="nav-link" href="#">Schedule</a>
                            </nav>
                        </div>

                        <!-- 채팅 -->
                        <a class="nav-link" href="#">
                            <div class="sb-nav-link-icon"><i class="fas fa-comments"></i></div>
                            채팅
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                        </a>

                        <!-- 스토어 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#store" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-store"></i></div>
                            스토어
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="store" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="#">Album</a>
                                <a class="nav-link" href="#">Cherring</a>
                                <a class="nav-link" href="#">Photo</a>
                                <a class="nav-link" href="#">Fashion</a>
                                <a class="nav-link" href="#">Stationery</a>
                                <a class="nav-link" href="#">Cart</a>
                                <a class="nav-link" href="#">Offline Store</a>
                            </nav>
                        </div>

                        <!-- 마이페이지 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#mypage" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-key"></i></div>
                            마이페이지
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="mypage" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="#">개인정보 설정</a>
                                <a class="nav-link" href="#">비밀번호 변경</a>
                                <a class="nav-link" href="#">주문내역 조회</a>
                                <a class="nav-link" href="#">급여내역 조회</a>
                            </nav>
                        </div>

                    </div>
                </div>
            </nav>
        </div>


        <div id="layoutSidenav_content">
            <div class="outer">
                <br><br>
                <h2><b>근태관리</b></h2>
                <br><br>
                <div class="firstLine">
                    <span class="workTitle">
                        <h6><b>근무계획</b></h6>
                        <h6><b>근무체크</b></h6>
                        <h6><b>근무현황</b></h6>
                    </span><br>
                    <div class="first">
                        <div class=workPlan>
                            <div class="caleander">
                                5월
                                <div class="day">
                                    <p><h1>20</h1>목요일</p>
                                </div>
                            </div>
                            <br>
                            <h5>9시출근</h5>
                            <small>09:00 ~ 18:00 (소정 9시간)</small>
                        </div>
                    </div>
                    <div class="second">
                        <h2><b>19 : 00 : 20</b></h2>
                        <br>
                        <button class="btn btn-primary">출근하기</button>
                        <button class="btn btn-primary">퇴근하기</button>
                    </div>
                    <div class="third">
                        <button class="btn btn-primary" disabled>출근체크시간</button>
                        <h2><b>09 : 00</b></h2>
                        <br>
                        <button class="btn btn-primary" style="margin-top:5px;" disabled>퇴근체크시간</button>
                        <h2><b>19 : 00</b></h2>
                    </div>
                </div>
                <div class="secondLine">
                    <h6 style="margin-left:20px;"><b>근무시간</b></h6>
                    <div class="average">
                        <div>
                            <span>근무일수</span> <br>
                            <span class="number">281</span> 일
                        </div>
                        <div>
                            <span>총근무시간</span> <br>
                            <span class="number">2,401</span> 시간
                        </div>
                        <div>
                            <span>평균근무시간</span> <br>
                            <span class="number">9</span> 시간
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>NoticeDetail</title>
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
            width:1000px;
        }
        .outer .list{
            background-color: lightgray;
            color:white;
            border: none;
            float:right;
            width:100px;
            height:40px;
            font-size: 16px;
            margin-bottom: 20px;
        }
        .outer table{
            width:100%;
            text-align: center;
            font-size:15px;
            font-weight: lighter;
        }
        .outer table tbody{
            border-top:1px solid lightgray;
        }
        .outer p{
            height:500px;
            width:100%;
            border:1px solid black;
            padding:10px;
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
                <h1><b>NOTICE</b></h1>

                <a href="" type="button" class="btn btn-primary list">목록으로</a>
                
                <table>
                    <thead>
                        <tr>
                            <td>No.</td>
                            <td>Title</td>
                            <td>Date</td>
                            <td>Hits</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>14</td>
                            <td>[사내공모] BR Global법인 개발자 모집(~05.11)</td>
                            <td>2021/04/03</td>
                            <td>121</td>
                        </tr>
                    </tbody>
                </table>    
                <br>
                <p>
                    내용입니다
                </p>       
            </div>
            <br><br>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>
</html>

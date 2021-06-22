<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userTemplate</title>
<!-- min-calenadr css-->
</head>
<body class="sb-nav-fixed">
 
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
                                <a class="nav-link" href="list.mail">전체 메일</a>
                                <a class="nav-link" href="receive.mail">받은 메일함</a>
                                <a class="nav-link" href="send.mail">보낸 메일함</a>
                                <a class="nav-link" href="temp.mail">임시 보관함</a>
                                <a class="nav-link" href="bin.mail">휴지통</a>
                            </nav>
                        </div>

                        <!-- 주소록 -->
                        <a class="nav-link" href="#">
                            <div class="sb-nav-link-icon"><i class="far fa-address-book"></i></div>
                           	 주소록
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                        </a>

                        <!-- 일정관리 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#schedule" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-calendar-alt"></i></div>
                            일정관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="schedule" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <div class="min-calendar">
                                    <main class="card">
                                        <section class="card__header">
                                          <h3>Thursday 7th</h3>
                                          <h3>January 2020</h3>
                                        </section>
                                        <section class="card__body">
                                          <ul class="card__body--days">
                                            <li>mon</li>
                                            <li>tue</li>
                                            <li>wed</li>
                                            <li>thu</li>
                                            <li>fri</li>
                                            <li>sat</li>
                                            <li>sun</li>
                                          </ul>
                                          <ul class="card__body--dates">
                                            <li class="prev">30</li>
                                            <li class="prev">31</li>
                                            <li>1</li>
                                            <li>2</li>
                                            <li>3</li>
                                            <li>4</li>
                                            <li>5</li>
                                            <li>6</li>
                                            <li class="active">7</li>
                                            <li>8</li>
                                            <li>9</li>
                                            <li>10</li>
                                            <li>11</li>
                                            <li>12</li>
                                            <li>13</li>
                                            <li>14</li>
                                            <li>15</li>
                                            <li class="circle orange">16 <span>5</span></li>
                                            <li>17</li>
                                            <li>18</li>
                                            <li class="circle purple">19 <span>6</span></li>
                                            <li>20</li>
                                            <li>21</li>
                                            <li>22</li>
                                            <li>23</li>
                                            <li>24</li>
                                            <li>25</li>
                                            <li>26</li>
                                            <li>27</li>
                                            <li>28</li>
                                            <li>29</li>
                                            <li>30</li>
                                            <li>31</li>
                                            <li class="next">1</li>
                                            <li class="next">2</li>
                                          </ul>
                                        </section>
                                      </main>    
                                    <!--<a class="nav-link" href="min.sch">미니캘린더</a>-->
                                </div>
                                <a class="nav-link" href="calendar.sch">전체 일정보기</a>
                                <a class="nav-link" href="enroll.sch">일정 만들기</a>
                                <a class="nav-link" href="adminEnroll.sch">관리자 일정만들기</a>
                            </nav>
                        </div>

                        <!-- 회의실 -->
                        <a class="nav-link collapsed" href="" data-bs-toggle="collapse" data-bs-target="#meetingRoom" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-handshake"></i></div>
                           	 회의실
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                        </a>
                        <div class="collapse" id="meetingRoom" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="test.mt">jsp테스트용</a>
                            </nav>
                        </div>

                        <!-- 전자결재 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#electronicApproval" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="far fa-clipboard"></i></div>
                            &nbsp;전자결재
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="electronicApproval" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="approvalTotalList.ea">문서함</a>
                                <a class="nav-link" href="approvalStandbyList.ea">진행중인 문서</a>     
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
                                <a class="nav-link" href="offList.pm">연차</a>
                                <a class="nav-link" href="salaryList.pm">급여내역 조회</a>
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
                                <a class="nav-link" href="boardFreeList.bf">자유게시판</a>
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
                                <a class="nav-link" href="storeList.st">Album</a>
                                <a class="nav-link" href="storeList.st">Cherring</a>
                                <a class="nav-link" href="storeList.st">Photo</a>
                                <a class="nav-link" href="storeList.st">Fashion</a>
                                <a class="nav-link" href="storeList.st">Stationery</a>
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
                            </nav>
                        </div>

                    </div>
                </div>
            </nav>
        </div>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
    
</body>
</html>

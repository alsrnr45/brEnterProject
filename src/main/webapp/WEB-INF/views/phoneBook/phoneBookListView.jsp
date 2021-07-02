<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<!-- 부트스트랩 탬플릿 -->
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="resources/css/styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	
	<!-- jQuery 라이브러리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- fullcalendar CDNs-->
    <link href='resources/scheduleResources/lib/main.css' rel='stylesheet' />
    <script src='resources/scheduleResources/lib/main.js'></script>
    <script src='resources/scheduleResources/lib/locales/ko.js'></script>
    
    <!-- modal 라이브러리 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    
<title>Insert title here</title>

<style>
    .card-footer{
        text-align: end;
    }
    
    .dataTable-table > tbody > tr > td, .dataTable-table > tbody > tr > th, 
    .dataTable-table > tfoot > tr > td, .dataTable-table > tfoot > tr > th, 
    .dataTable-table > thead > tr > td, .dataTable-table > thead > tr > th {
        text-align:center;
    }

    .bg-dark{
        background-color: rgb(155, 89, 182) !important;
    }

    .btn .btn-primary{
        text-align: inherit;
    }

    .btn-primary.focus, .btn-primary:focus{
        background-color: rgba(155, 89, 182, 0.6);
        border-color: rgba(155, 89, 182, 0.6);
        box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);
    }
    
    .btn-check:focus + .btn-primary, .btn-primary:hover{
        background-color: rgba(155, 89, 182, 0.6);
        border-color: rgba(155, 89, 182, 0.6);
        box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(155, 89, 182, 0.6);
    }

    /* modal css */
    .modal-backdrop.show{
        opacity :0;
    }

    .modal-body-content{
        width:100%;
        padding: 16px 24px;
        display:flex;
        flex-direction: row;
    }

    .content{
        display:flex;
        flex:5;
    }

    .content, .move-tab, .new-list{
        box-sizing:border-box;
        height: 460px;
    }

    .content-org-tree, .content-list{
        border: 1px solid #c9c9c9;
        flex:1;
    }

    .search-wrap, .scroll-wrap{
       
    } 

    .move-tab{
        text-align:center;
        flex:1;
    }

    .content-list{
       
    }

    .new-list{
        border: 1px solid #c9c9c9;
        flex:4;
    }

    ul, li{
        list-style : none;
    }

    .open{
        color:rgba(155, 89, 182);
        style:none;
    }

    .close{
        font-family: 'Noto Sans KR', sans-serif
        
    }

    .open:hover, .close:hover {
        style:none;
    }

</style>
</head>
<body>
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
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">주소록</h1>
                    <br>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="far fa-address-book"></i>
                            주소록 전체보기
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple" class="mailList">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>이름</th>
                                        <th>휴대폰번호</th>
                                        <th>사내이메일</th>
                                        <th>일반이메일</th>
                                        <th>회사(부서)</th>
                                        <th>주소록 이름</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox" name="" id=""></td>
                                        <td><input type="button" hidden><i class="far fa-star"></i></input></td>
                                        <th><i class="far fa-envelope"></i></th>
                                        <!-- <th><i class="far fa-envelope-open"></i></th>-->
                                        <td>kimjava@br.com</td>
                                        <td>kimjava@naver.com</td>
                                        <td>br엔터</td>
                                        <td>기본주소록, 축구동아리</td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th><input type="checkbox"></th>
                                        <th><button onclick="important()"><i class="far fa-star"></i></button></th>
                                        <th></th>
                                        <th>Age</th>
                                        <th>Sta rt date</th>
                                        <th>Salary</th>
                                    </tr>
                                </tfoot>
                            </table>
                            <div class="card-footer">
                                  <!-- Button to Open the Modal -->
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                주소록추가
                                </button>
                                <a class="btn btn-primary"  href="">메일발송</a>
                                <a class="btn btn-primary">삭제하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
              <!-- The Modal -->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                        <h4 class="modal-title">주소록 추가</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="modal-body-content">
                                <div class="content">
                                    <div class="content-org-tree">
                                        <ul>
                                            <li>
                                                <a href="#" class="open"><i class="fas fa-plus-square"></i>br엔터</a>
                                                <ul>
                                                    <li><a href="#" class="open"><i class="fas fa-plus-square"></i>기획팀</a></li>
                                                    <li><a href="#" class="open"><i class="fas fa-plus-square"></i>총무팀</a></li>
                                                    <li><a href="#" class="open"><i class="fas fa-plus-square"></i>인사팀</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="content-list">
                                        <div class="search-wrap">
                                            <input class="dataTable-input">
                                        </div>
                                        <div class="scroll-wrap">
                                        스크롤랩(실질주소)   
                                        </div>
                                    </div>
                                </div>
                                <div class="move-tab">
                                    <span class="btn btn-primary">추가 &gt</span><br><br>
                                    <span class="btn btn-primary">&lt 제외</span>
                                </div>
                                <div class="new-list">
                                    
                                </div>
                            </div>

                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>

var opener = $("a.open");
var nested = $("a.open").parent().find("li");
var nestedCont = $("li > ul > li").parent();
var that;

var tree = {
  init : function () {
    nestedCont.hide();
    $("li:last-child").addClass("end");
    $("a.open").each( function () {
      $(opener).click(function ( target ) {
       tree.click(this);
      });
     return false;
    })
  },
  click : function ( _tar ) {
   that = _tar;
   $(that).next().show();
   $(that).prev().toggleClass("close");
   $(that).toggleClass("close");
   if (!$(that).hasClass("close")) {
     $(that).next().hide();      
   }
  }
 }
 tree.init();

</script>
</html>

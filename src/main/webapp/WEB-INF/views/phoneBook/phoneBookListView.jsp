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
    .btn .btn-primary{
        text-align: inherit;
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
                                <a href="popup.pb" class="btn btn-primary" data-toggle="modal" data-target="#myModal">주소록 추가</a>
                                <a class="btn btn-primary btn-block"  href="">메일발송</a>
                                <a class="btn btn-primary btn-block">삭제하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </main> 
            
        </div>
    </div>

</body>
<script>
$('[data-target="#myModal"]').on('click', function (e) {
    e.preventDefault();

    var _linky = $(this).attr('href');
    var _target = $(this).data('target'); 
    var $target = $(_target);

    if ($target.length > 0) {
      
        $target.find('iframe').attr('src', 'about:blank');

        var _isRemote = false;
        if (_linky.indexOf('http') > -1) {
            _isRemote = true;
        }

        if (!_isRemote) {
            if (_linky.indexOf('?') > -1) {
                _linky += '&tmpl=component';
            } else {
                _linky += '?tmpl=component';
            }
        }
      
        $target.find('iframe').attr('src', _linky).load(function() {
            $target.modal('show');
        });
    }
});

$('body').on('hidden.bs.modal', '.modal', function () {
    $(this).removeData('bs.modal');
});
</script>
</html>
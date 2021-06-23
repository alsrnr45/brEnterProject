<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>brEntertainment Admin</title>

<!-- 부트스트랩 탬플릿 -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>

	/* 폰트 */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
	* {font-family: 'Noto Sans KR', sans-serif;}
	
	/* input 스타일 */
	input:focus, input[type]:focus, .uneditable-input:focus {
	border-color: rgb(255, 227, 14); 
	box-shadow: 0 1px 1px rgba(255, 247, 23, 0.075) inset, 0 0 8px rgba(182, 174, 89, 0.6);
	outline: 0 none;
	}
	
	/* 드롭박스 스타일 */
	.dataTable-selector:focus, .dataTable-selector:active{
	    border-color: rgb(255, 227, 14); 
	    box-shadow: 0 1px 1px rgba(255, 247, 23, 0.075) inset, 0 0 8px rgba(182, 174, 89, 0.6);
	    outline: 0 none;
	}
	option:checked {background: rgb(255,235,152);}
	
	/* 페이징바 스타일 */
	.dataTable-pagination a {color: black;}
	.dataTable-pagination a:hover, 
	.dataTable-pagination a:focus {background: rgb(250, 246, 222); border-color: #dee2e6; color: black;}
	.dataTable-pagination a:active {box-shadow: 0 1px 1px rgba(255, 247, 23, 0.075) inset, 0 0 8px rgba(182, 174, 89, 0.6);}
	.page-item.active .page-link, .page-item.active .dataTable-pagination a, .dataTable-pagination .page-item.active a, .dataTable-pagination li.active .page-link, .dataTable-pagination li.active a {
	    z-index: 3; color: black; background-color: rgb(255,235,152); border-color: #dee2e6;}
	.dataTable-pagination .active a, .dataTable-pagination .active a:focus, .dataTable-pagination .active a:hover {
	    background-color: rgb(255, 232, 141);
	    box-shadow: none;}
	    
	/* 관리자 전자결재 진행중인 문서 리스트 */
	h1{margin-bottom: 20px;}
	
</style>
</head>
<body class="sb-nav-fixed">
	<!-- 상단바 -->
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark2">
		<jsp:include page="../common/adminHeader.jsp"/>
    </nav>
    
    <div id="layoutSidenav">
        
        <!-- 메뉴바 -->
        <div id="layoutSidenav_nav">
            <jsp:include page="../common/adminMenu.jsp"/>
        </div>
        
        <!-- 컨텐츠 -->
        <div id="layoutSidenav_content">
        	<main>
            	<div class="container-fluid px-4">
                        
                	<div class="container-fluid px-4">
                    	<h1 class="mt-4">전자결재</h1>

                        	<div class="card mb-4">
                            	<div class="card-header">
                                    <i class="far fa-clipboard"></i>
                                    &nbsp; 진행중인 문서
                                </div>
                                <div class="card-body">
                                    <table id="datatablesSimple" class="adEcApprovalList">
                                        <thead>
                                            <tr>
                                                <th><input type="checkbox" id="checkEc"></th>
                                                <th>문서번호</th>
                                                <th>문서종류</th>
                                                <th>제목</th>
                                                <th>기안자</th>
                                                <th>기안일</th>
                                                <th>완료일</th>
                                                <th>결재상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><input type="checkbox" id="checkEc"></td>
                                                <td>BC-20210622-86328</td>
                                                <td>업무연락</td>
                                                <td>문서 11입니다.</td>
                                                <td>최과장</td>
                                                <td>2021-06-05</td>
                                                <td></td>
                                                <td style="color:red">결재대기</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="checkEc"></td>
                                                <td>BC-20210621-86327</td>
                                                <td>업무연락</td>
                                                <td>문서 10입니다.</td>
                                                <td>최과장</td>
                                                <td>2021-06-05</td>
                                                <td></td>
                                                <td style="color:red">결재대기</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="checkEc"></td>
                                                <td>BC-20210620-86326</td>
                                                <td>업무연락</td>
                                                <td>문서 9입니다.</td>
                                                <td>최과장</td>
                                                <td>2021-06-05</td>
                                                <td></td>
                                                <td style="color:red">결재대기</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="checkEc"></td>
                                                <td>PL-20210619-86325</td>
                                                <td>기획안</td>
                                                <td>문서 8입니다.</td>
                                                <td>최부장</td>
                                                <td>2021-06-05</td>
                                                <td></td>
                                                <td style="color:red">결재대기</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="checkEc"></td>
                                                <td>PL-20210618-86324</td>
                                                <td>기획안</td>
                                                <td>문서 7입니다.</td>
                                                <td>최사원</td>
                                                <td>2021-06-05</td>
                                                <td></td>
                                                <td style="color:red">결재대기</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="checkEc"></td>
                                                <td>ME-20210617-86323</td>
                                                <td>회람</td>
                                                <td>문서 6입니다.</td>
                                                <td>최사원</td>
                                                <td>2021-06-05</td>
                                                <td></td>
                                                <td style="color:red">결재대기</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="checkEc"></td>
                                                <td>ME-20210616-86322</td>
                                                <td>회람</td>
                                                <td>문서 5입니다.</td>
                                                <td>최사원</td>
                                                <td>2021-06-05</td>
                                                <td></td>
                                                <td style="color:red">결재대기</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="checkEc"></td>
                                                <td>OF-20210615-86321</td>
                                                <td>연차</td>
                                                <td>문서 4입니다.</td>
                                                <td>최사원</td>
                                                <td>2021-06-05</td>
                                                <td></td>
                                                <td style="color:red">결재대기</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="checkEc"></td>
                                                <td>OF-20210614-86320</td>
                                                <td>연차</td>
                                                <td>문서 3입니다.</td>
                                                <td>최사원</td>
                                                <td>2021-06-05</td>
                                                <td></td>
                                                <td style="color:red">결재대기</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="checkEc"></td>
                                                <td>EX-20210613-92101</td>
                                                <td>지출결의서</td>
                                                <td>문서 2입니다.</td>
                                                <td>최과장</td>
                                                <td>2021-06-05</td>
                                                <td></td>
                                                <td style="color:red">결재대기</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="checkEc"></td>
                                                <td>EX-20210612-92100</td>
                                                <td>지출결의서</td>
                                                <td>문서 1입니다.</td>
                                                <td>최부장</td>
                                                <td>2021-06-05</td>
                                                <td></td>
                                                <td style="color:red">결재대기</td>
                                            </tr>
                                        </tbody>
                                        <button type="submit" class="btn btn-danger" style="float:left;">선택삭제</button> 
                                    </table>                               
                                </div>
                            </div>
                        </div>
                    </div>
                </main> 
        	</div>
        	
    </div>
    
    <script>
    	$(function() {
            $(".adEcApprovalList>tbody>tr").click(function() {
            	// 폼마다 디테일 뷰 다름 => 조건 설정 (1: 공문, 기획안, 회람 / 2: 연차 / 3: 지출결의서)
            	location.href = "adminDocumentDetail.ea";
                console.log("전자결재 문서 클릭");
            })
        })
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="resources/js/datatables-simple-demo.js"></script>
	
</body>
</html>
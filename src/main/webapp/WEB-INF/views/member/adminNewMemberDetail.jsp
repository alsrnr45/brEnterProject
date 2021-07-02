<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>brEnter Admin</title>

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

	/* button 스타일 */
	.btn-danger {background-color: rgb(255, 134, 134); border-color: rgb(255, 134, 134); color: black;}
	.btn-warning {background-color: rgb(255, 227, 115); border-color: rgb(255, 227, 115);}
	.btn-secondary {background-color: #dfdfdf; border-color: #c3c4c4; color: black;}
	.btn-light {background-color: rgb(215, 215, 215); border-color: rgb(215, 215, 215);}
	
	/* 스타일 */
	.content {
	    width: 1100px; 
	    height: 600px; 
	    margin: auto;
	    background-color:rgb(240, 240, 240); 
	    box-shadow: 0 7px 15px rgb(0 0 0 / 40%);
	}
	
	/* .content div {outline: 1px solid blueviolet;} */
	.content div {float: left;}
	.content1 {width: 250px; height: 100%; padding: 52px 0px 50px 50px;}
	.box {width: 200px; height: 200px; border-radius: 70%; overflow: hidden;}
	.profile {width: 100%; height: 100%; object-fit: cover;}
	
	.content2 {width: 850px; height: 100%; padding: 52px 0px 50px 0px;}
	.information{width: 800px; height: 100%;}
	
	.information table {width:100%;}
	.information>table *{margin-bottom: 8px;}
	.information>table th {text-align:center; width:150px; font-size: 17px;}
	
	input{height:40px;}
	#personalInformation button{height:38px; width:100px; text-align:center;}
	
	.input-group-text{border-radius: 0rem 0.25rem 0.25rem 0rem; height: 40px;}
	.mb-3 {margin-bottom: 0 !important;}
	.input-group-append {margin-bottom: 0 !important;}
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
            <div class="content">
                
                <form id="personalInformation" action="" method="post">
                    <div class="content1">
                        <div class="box">
                            <img class="profile" src="resources/profileUpfiles/defaultProfile.jpg">
                        </div>
                        <input type="file" name="" hidden>
                    </div>

                    <div class="content2">
                        
                        <div class="information">
                            
                            <table align="center">
                                <tr>
                                    <th><label for="userName">사원명</label></th>
                                    <td><input type="text" id="userName" class="form-control" name="" value="${ m.memName }" required></td>
                                    <th><label for="userNo">사원번호</label></th>
                                    <td><input type="text" id="userNo" class="form-control" name="" value="${ m.memNo }" readonly></td>
                                </tr>
                                <tr>
                                    <th><label for="deptName">부서명</label></th>
                                    <td><input type="text" id="deptName" class="form-control" name="" value="" required></td>
                                    <th><label for="posiName">직급명</label></th>
                                    <td><input type="text" id="posiName" class="form-control" name="" value="" required></td>
                                </tr>
                                <tr>
                                    <th><label for="phnoe">연락처</label></th>
                                    <td><input type="text" id="phnoe" class="form-control" name="" value="${ m.phone }" required></td>
                                    <th><label for="hireDate">입사일</label></th>
                                    <td><input type="text" id="hireDate" class="form-control" name="" value="" required></td>
                                    
                                </tr>
                                <tr>
                                    <th><label for="account">계좌번호</label></th>
                                    <td>
                                        <div class="input-group mb-3">
                                            <input type="text" id="account" class="form-control" name="" value="" style="width: 100px;" required>
                                            <div class="input-group-append">
                                                <span class="input-group-text">${ m.bank }</span>
                                            </div>
                                        </div>
                                    </td>
                                    <th><label for="regi">주민등록번호</label></th>
                                    <td colspan="3"><input type="text" id="regi" class="form-control" name="" value="${ m.regi }" required></td>
                                </tr>
                                <tr>
                                    <th><label for="officeEmail">사내이메일</label></th>
                                    <td><input type="text" id="officeEmail" class="form-control" name="" value="${ m.officeEmail }" required></td>
                                    <th><label for="personalEmail">개인이메일</label></th>
                                    <td><input type="text" id="personalEmail" class="form-control" name="" value="${ m.personalEmail }" required></td>
                                </tr><tr>
                                    <th><label for="address">주소</label></th>
                                    <td><input type="text" id="address" class="form-control" name="" value="${ m.post }" required></td>
                                    <td style="padding-left: 7px;"><button class="btn btn-secondary">주소검색</button></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th><label for=""></label></th>
                                    <td colspan="3"><input type="text" id="address" class="form-control" name="" value="${ m.roadAddress }" required></td>
                                </tr>
                                <tr>
                                    <th><label for=""></label></th>
                                    <td colspan="3"><input type="text" id="address" class="form-control" name="" value="${ m.detailAddress }" required></td>
                                </tr>
                                <tr>
                                    <th><label for="enrollDate">가입신청일</label></th>
                                    <td><input type="text" id="enrollDate" class="form-control" name="" value="${ m.memEnrollDate }" required></td>
                                    <th><label for="acceptStatus">승인여부</label></th>
                                    <td><input type="text" id="acceptStatus" class="form-control" name="" value="${ m.acceptStatus }" required></td>
                                </tr>
                            </table>

                            <div style="float:right; margin-top: 15px;">
                                <button type="button" class="btn btn-light" onclick="javascript:history.go(-1);">뒤로가기</button>
                                <button type="button" class="btn btn-warning" style="margin-left: 7px;">반려하기</button>
                                <button type="button" class="btn btn-danger" style="margin-left: 7px;">등록하기</button>
                            </div>
                        </div><!--information-->
                    </div><!--content2-->
                </form>

             </div><!--content-->
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>



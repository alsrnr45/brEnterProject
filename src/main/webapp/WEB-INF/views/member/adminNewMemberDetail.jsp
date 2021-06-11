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
	
	#personalInformation table {width:100%;}
	#personalInformation>table *{margin-bottom: 8px;}
	#personalInformation>table th {text-align:center; width:150px; font-size: 17px;}
	
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
                
                <div class="content1">
                    <div class="box">
                        <img class="profile" src="data:image/jpeg;base64,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" alt="">
                    </div>
                    <input type="file" name="" hidden>
                </div>

                <div class="content2">
                    
                    <div class="information">
                        
                        <form id="personalInformation" action="" method="post">
                            <table align="center">
                                <tr>
                                    <th><label for="userName">사원명</label></th>
                                    <td><input type="text" id="userName" class="form-control" name="" value="햄토리" required></td>
                                    <th><label for="userNo">사원번호</label></th>
                                    <td><input type="text" id="userNo" class="form-control" name="" value="150" readonly></td>
                                </tr>
                                <tr>
                                    <th><label for="deptName">부서명</label></th>
                                    <td><input type="text" id="deptName" class="form-control" name="" value="" required></td>
                                    <th><label for="posiName">직급명</label></th>
                                    <td><input type="text" id="posiName" class="form-control" name="" value="" required></td>
                                </tr>
                                <tr>
                                    <th><label for="phnoe">연락처</label></th>
                                    <td><input type="text" id="phnoe" class="form-control" name="" value="010-2574-2864" required></td>
                                    <th><label for="hireDate">입사일</label></th>
                                    <td><input type="text" id="hireDate" class="form-control" name="" value="" required></td>
                                    
                                </tr>
                                <tr>
                                    <th><label for="account">계좌번호</label></th>
                                    <td>
                                        <div class="input-group mb-3">
                                            <input type="text" id="account" class="form-control" name="" value="" style="width: 100px;" required>
                                            <div class="input-group-append">
                                                <span class="input-group-text">보람은행</span>
                                            </div>
                                        </div>
                                    </td>
                                    <th><label for="regi">주민등록번호</label></th>
                                    <td colspan="3"><input type="text" id="regi" class="form-control" name="" value="010101-2345678" required></td>
                                </tr>
                                <tr>
                                    <th><label for="officeEmail">사내이메일</label></th>
                                    <td><input type="text" id="officeEmail" class="form-control" name="" value="hamster@br.com" required></td>
                                    <th><label for="personalEmail">개인이메일</label></th>
                                    <td><input type="text" id="personalEmail" class="form-control" name="" value="hamster@gamil.com" required></td>
                                </tr><tr>
                                    <th><label for="address">주소</label></th>
                                    <td><input type="text" id="address" class="form-control" name="" value="06234" required></td>
                                    <td style="padding-left: 7px;"><button class="btn btn-secondary">주소검색</button></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th><label for=""></label></th>
                                    <td colspan="3"><input type="text" id="address" class="form-control" name="" value="서울 강남구 테헤란로14길 6 (역삼동) 남도빌딩" required></td>
                                </tr>
                                <tr>
                                    <th><label for=""></label></th>
                                    <td colspan="3"><input type="text" id="address" class="form-control" name="" value="1층" required></td>
                                </tr>
                                <tr>
                                    <th><label for="enrollDate">가입신청일</label></th>
                                    <td><input type="text" id="enrollDate" class="form-control" name="" value="2021.06.07" required></td>
                                    <th><label for="acceptStatus">승인여부</label></th>
                                    <td><input type="text" id="acceptStatus" class="form-control" name="" value="N" required></td>
                                </tr>
                            </table>

                            <div style="float:right; margin-top: 15px;">
                                <button type="button" class="btn btn-light" onclick="javascript:history.go(-1);">뒤로가기</button>
                                <button type="button" class="btn btn-warning" style="margin-left: 7px;">반려하기</button>
                                <button type="button" class="btn btn-danger" style="margin-left: 7px;">등록하기</button>
                            </div>

                        </form>

                    </div>
                    
                </div>

            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>


